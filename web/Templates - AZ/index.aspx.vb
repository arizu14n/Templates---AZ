Imports System.Data
Imports System.Data.SqlClient
Imports System.Xml
Imports AD_Templates
Imports System.Web.Services
Imports Newtonsoft.Json
Imports System.IO
Imports AD_Templates.Productos
Imports System.Web.Script.Services

Public Class index
    Inherits System.Web.UI.Page
    Dim oDs As New DataSet
    Dim oDs1 As New DataSet
    Dim o_MC As New Mensajes_Contacto
    Dim o_Prod As New Productos
    Dim o_Cat As New Categorias
    Dim o_Esp As New Especiales
    Dim o_Usu As New Usuarios


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then


            llenarCategoriasMenu()
            llenarMenuEspeciales()
            llenarComboMesas()

        End If



    End Sub


    Private Sub llenarCategoriasMenu()
        oDs = New DataSet
        o_Cat = New Categorias

        oDs = o_Cat.Categorias_ConsultarActivas

        If oDs.Tables(0).Rows.Count > 0 Then
            Dim nombreCategoria As String = oDs.Tables(0).Rows(0)("Nombre_Categoria").ToString()
            Dim htmlBuilder1 As New StringBuilder()
            For Each categoria As DataRow In oDs.Tables(0).Rows
                nombreCategoria = categoria("Nombre_Categoria")
                htmlBuilder1.Append("<li>")
                htmlBuilder1.Append("<a href=""#"" class=""tm-tab-link active"" data-id=" & categoria("Nombre_Categoria").ToString() & ">" & categoria("Nombre_Categoria").ToString() & "</a>")
                htmlBuilder1.Append("</li>")

                CargarProductosPorCategoria(nombreCategoria)
            Next
            contentCategorias.InnerHtml = htmlBuilder1.ToString()

        End If
    End Sub
    Private Sub llenarMenuEspeciales()

        Dim oDs As New DataSet
        Dim o_Esp As New Especiales
        oDs = o_Esp.Especiales_ConsultarActivos()

        If oDs.Tables(0).Rows.Count > 0 Then
            Dim htmlBuilder As New StringBuilder()
            For Each row As DataRow In oDs.Tables(0).Rows
                Dim imagen As String = row("Imagen").ToString()
                Dim nombre As String = row("Nombre").ToString()
                Dim descripcion As String = row("Descripcion").ToString()

                htmlBuilder.Append("<div class='tm-black-bg tm-special-item'>")
                htmlBuilder.AppendFormat("<img src='{0}' alt='Image' />", imagen)
                htmlBuilder.Append("<div class='tm-special-item-description'>")
                htmlBuilder.AppendFormat("<h2 class='tm-text-primary tm-special-item-title'>{0}</h2>", nombre)
                htmlBuilder.AppendFormat("<p class='tm-special-item-text'>{0}</p>", descripcion)
                htmlBuilder.Append("</div></div>")
            Next
            specialItemsContainer.InnerHtml = htmlBuilder.ToString()
        End If



    End Sub
    Private Sub CargarProductosPorCategoria(ByVal nombreCategoria As String)

        oDs = New DataSet
        o_Cat = New Categorias
        oDs = o_Cat.Categorias_ConsultarActivas

        oDs1 = New DataSet
        o_Prod = New Productos

        If oDs.Tables(0).Rows.Count > 0 Then
            Dim htmlBuilder As New StringBuilder()
            Dim nombreCateg As String = oDs.Tables(0).Rows(0)("Nombre_Categoria").ToString()
            Dim contador = 0
            For Each categoria As DataRow In oDs.Tables(0).Rows

                nombreCateg = categoria("Nombre_Categoria").ToString()

                oDs1 = New DataSet
                o_Prod = New Productos
                oDs1 = o_Prod.Productos_ConsultarActivosPorCategoria(nombreCateg)

                contador = 0
                For Each producto As DataRow In oDs1.Tables(0).Rows
                    If contador = 0 Then
                        htmlBuilder.Append("<div id=" & nombreCateg & " class=""tm-tab-content"">")
                        htmlBuilder.Append("<div class=""tm-list"">")
                    End If

                    htmlBuilder.Append("<div class=""tm-list-item"">")
                    htmlBuilder.Append("<img src=""" & producto("Imagen").ToString() & """ alt=""Image"" class=""tm-list-item-img""/>")
                    htmlBuilder.Append("<div class=""tm-black-bg tm-list-item-text"">")
                    htmlBuilder.Append("<h3 class=""tm-list-item-name"">" & producto("Nombre").ToString() & "</h3>")
                    htmlBuilder.Append("<span id=""prec" & producto("ID_Producto").ToString() & """ class=""tm-list-item-price"">$ " & producto("Precio").ToString() & "</span>")
                    htmlBuilder.Append("<p class=""tm-list-item-description"">" & producto("Descripcion").ToString() & "</p>")
                    htmlBuilder.Append("<div class='A-Pedido'><label style='margin-right: 3%' class='tm-form-trol'>Cantidad:</label>")
                    htmlBuilder.Append("<input id=""cant" & producto("ID_Producto").ToString() & """ type='number' class='tm-form-trol' style='border: 0.5px solid white;' min='1' max='10' value='1'/>")
                    htmlBuilder.Append("<button class='tm-form-trol btnAgrega btn-agregar-producto' id='prod" & producto("ID_Producto").ToString() & "' data-id-producto='" & producto("ID_Producto").ToString() & "'>Agregar</button></div>")
                    htmlBuilder.Append("</div></div>")

                    contador += 1
                Next
                htmlBuilder.Append("</div></div>")
                contentPlaceholder.InnerHtml = htmlBuilder.ToString()
                contador = 0
            Next
        End If
    End Sub

    <System.Web.Services.WebMethod()>
    Public Shared Function AgregarProducto(idProducto As Integer, descripcion As String, cantidad As Integer, precio As Decimal, total As Decimal, nombre As String, mesa As String) As Boolean
        ' Obtener el pedido actual de la sesión
        Dim pedido As Dictionary(Of String, List(Of Producto)) = CType(HttpContext.Current.Session("Pedido"), Dictionary(Of String, List(Of Producto)))

        If pedido Is Nothing Then
            pedido = New Dictionary(Of String, List(Of Producto))()
        End If

        ' Clave para identificar el pedido único (nombre + mesa)
        Dim clavePedido As String = nombre & "_" & mesa

        ' Verificar si el pedido ya existe en la sesión
        If Not pedido.ContainsKey(clavePedido) Then
            pedido(clavePedido) = New List(Of Producto)()
        End If

        ' Buscar si el producto ya está en el pedido
        Dim productoExistente = pedido(clavePedido).FirstOrDefault(Function(p) p.ID_Producto = idProducto)

        If productoExistente IsNot Nothing Then
            ' Si el producto ya existe, actualizar la cantidad y total
            productoExistente.Cantidad += cantidad
            productoExistente.Total += total
        Else
            ' Si no existe, agregar un nuevo producto al pedido
            pedido(clavePedido).Add(New Producto With {
            .ID_Producto = idProducto,
            .Descripcion = descripcion,
            .Cantidad = cantidad,
            .Precio = precio,
            .Total = total
        })
        End If

        ' Guardar el pedido actualizado en la sesión
        HttpContext.Current.Session("Pedido") = pedido

        Return True
    End Function






#Region "Formulario de Contacto"

    Private Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        If txtNombre.Text <> Nothing And txtMail.Text <> Nothing And txtMensaje.Text <> Nothing Then
            oDs = New DataSet
            o_MC = New Mensajes_Contacto
            o_MC.Mensajes_Contacto_Agregar(txtNombre.Text, txtMail.Text, txtMensaje.Text)
            limpiarFormContacto()
            Dim script As String = "mostrarAlerta('Felicitaciones', 'Has enviado correctamente tu mensaje', 'success');"
            ClientScript.RegisterStartupScript(Me.GetType(), "SweetAlertScript", script, True)

        End If
    End Sub

    Private Sub limpiarFormContacto()
        txtNombre.Text = String.Empty
        txtMail.Text = String.Empty
        txtMensaje.Text = String.Empty
    End Sub

#End Region

    Public Sub llenarComboMesas()

        Dim o_Mesa As New Mesas
        Dim oDs As New DataSet

        oDs = o_Mesa.Mesas_ListasDisponibles
        If oDs.Tables(0).Rows.Count > 0 Then
            With CboMesas
                .DataSource = oDs.Tables(0)
                .DataTextField = oDs.Tables(0).Columns(1).ToString
                .DataValueField = oDs.Tables(0).Columns(0).ToString
                .DataBind()
            End With

        End If

    End Sub





End Class
Public Class Producto
    Public Property ID_Producto As Integer
    Public Property Descripcion As String
    Public Property Cantidad As Integer
    Public Property Precio As Decimal
    Public Property Total As Decimal
End Class






