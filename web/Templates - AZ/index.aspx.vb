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

#Region "Carga Inicial"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            llenarCategoriasMenu()
            llenarMenuEspeciales()
            llenarComboMesas()

        End If

    End Sub

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


#End Region


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


#Region "Pedidos"
    Protected Sub AceptarPedido(sender As Object, e As EventArgs) 'Handles btnAceptar.Click
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('El botón fue clickeado');", True)

        ' Obtener los valores de los controles
        Dim idMesa As Integer = Convert.ToInt32(CboMesas.SelectedValue) ' ID de la mesa seleccionada
        Dim realizadoPor As String = txtPedidoNombre.Text ' Nombre ingresado
        Dim importeTotal As Decimal = Convert.ToDecimal(hdnTotalPedido.Value) ' Total del pedido desde el campo oculto

        ' Crear un DataTable para los detalles del pedido
        Dim detallesPedido As New DataTable()
        detallesPedido.Columns.Add("ID_Producto", GetType(Integer))
        detallesPedido.Columns.Add("Cantidad", GetType(Integer))
        detallesPedido.Columns.Add("Precio", GetType(Decimal))

        ' Recorrer los productos recibidos desde la tabla dinámica
        For Each row As GridViewRow In tablapedidos.Rows ' Cambia aquí para usar un control adecuado
            If row.RowType = DataControlRowType.DataRow Then
                Dim detalleRow As DataRow = detallesPedido.NewRow()
                detalleRow("ID_Producto") = Convert.ToInt32(row.Cells(0).Text) ' Obtener ID del producto
                detalleRow("Cantidad") = Convert.ToInt32(row.Cells(2).Text) ' Obtener cantidad
                detalleRow("Precio") = Convert.ToDecimal(row.Cells(3).Text) ' Obtener precio
                detallesPedido.Rows.Add(detalleRow)
            End If
        Next

        ' Llamar al método para guardar el pedido
        Dim resultado As Boolean = GuardarPedido(idMesa, realizadoPor, importeTotal, detallesPedido)

        ' Mensaje de éxito o error
        If resultado Then
            Response.Write("<script>alert('Pedido guardado exitosamente');</script>")
        Else
            Response.Write("<script>alert('Error al guardar el pedido');</script>")
        End If
    End Sub



    Protected Function GuardarPedido(idMesa As Integer, realizadoPor As String, importeTotal As Decimal, detallesPedido As DataTable) As Boolean
        Dim oDs As New DataSet
        Dim o_pedido As New Pedidos
        Dim transaction As SqlTransaction ' Inicializa la variable para la transacción
        Dim fechaPedido As Date = Now.Date
        Dim estado As Boolean = True

        Using conn As New SqlConnection("Conn") ' Asegúrate de tener la cadena de conexión
            conn.Open()
            transaction = conn.BeginTransaction()

            Try
                ' Insertar en la tabla pedidosEncabezado
                Dim idPedido As Integer = o_pedido.Pedidos_AgregarEncabezado(idMesa, fechaPedido, realizadoPor, importeTotal, estado, transaction)

                ' Insertar en la tabla pedidosDetalle
                For Each row As DataRow In detallesPedido.Rows
                    Dim idProducto As Integer = Convert.ToInt32(row("ID_Producto"))
                    Dim cantidad As Integer = Convert.ToInt32(row("Cantidad"))
                    Dim precio As Decimal = Convert.ToDecimal(row("Precio"))

                    o_pedido.Pedidos_AgregarDetalle(idPedido, idProducto, cantidad, precio, estado, transaction)
                Next

                ' Confirmar la transacción
                transaction.Commit()
                Return True
            Catch ex As Exception
                ' Deshacer la transacción en caso de error
                transaction.Rollback()
                Return False
            End Try
        End Using
    End Function






End Class




#End Region








