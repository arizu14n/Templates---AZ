Imports System.Data
Imports System.Data.SqlClient
Imports System.Xml
Imports AD_Templates
Imports System.Web.Services
Imports Newtonsoft.Json
Imports System.IO
Imports AD_Templates.Productos

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
        If IsPostBack Then

            Dim eventTarget As String = Request("__EVENTTARGET")
            Dim eventArgument As String = Request("__EVENTARGUMENT")

            Console.WriteLine("EventTarget: " & eventTarget)
            Console.WriteLine("EventArgument: " & eventArgument)

            If eventTarget = "AgregarProducto" Then
                Dim datos() As String = eventArgument.Split("|"c)
                If datos.Length = 2 Then
                    Dim idProducto As Integer
                    Dim cantidad As Integer
                    If Integer.TryParse(datos(0), idProducto) AndAlso Integer.TryParse(datos(1), cantidad) Then
                        Console.WriteLine("Agregando producto: " & idProducto & ", cantidad: " & cantidad)
                        AgregarProductoAlPedido(idProducto, cantidad)
                    Else
                        Console.WriteLine("Error al parsear idProducto o cantidad")
                    End If
                Else
                    Console.WriteLine("Formato de datos incorrecto")
                End If
            End If
        Else
            llenarCategoriasMenu()
            llenarMenuEspeciales()
            llenarComboMesas()
        End If

        AddHandler Page.LoadComplete, AddressOf ConfigureBotonesAgregar

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
                    htmlBuilder.Append("<h3 class=""tm-list-item-name"">" & producto("Nombre").ToString() & "<span id=" & "prec" & producto("ID_Producto").ToString() & " class=""tm-list-item-price"">$ " & producto("Precio").ToString() & "</span></h3>")
                    htmlBuilder.Append("<p class=""tm-list-item-description"">" & producto("Descripcion").ToString() & "</p>")
                    htmlBuilder.Append("<div class='A-Pedido' ><label style='margin-right: 3%' class='tm-form-trol'>Cantidad:</label><input id=" & "cant" & producto("ID_Producto").ToString() & " type='number'class='tm-form-trol' style='border: 0.5px solid white;' min='1' max='10' value='1'/>")
                    htmlBuilder.Append("<button class='tm-form-trol btnAgrega btn-agregar-producto' id='prod" & producto("ID_Producto").ToString() & "' data-id-producto='" & producto("ID_Producto").ToString() & "'>Agregar</button></div>")
                    'htmlBuilder.Append("<div class='A-Pedido'  ><label style='margin-right: 3%'  class='tm-form-trol'>Cantidad:</label><input id=" & "cant" & producto("ID_Producto").ToString() & " type='number'class='tm-form-trol' style='border: 0.5px solid white;' min='1' max='10' value='1'/><button class='tm-form-trol btnAgrega' id=" & "prod" & producto("ID_Producto").ToString() & " onclick='AgregaPedido(sender,e)' >Agregar</button></div>")
                    htmlBuilder.Append("</div></div>")
                    contador += 1
                Next
                htmlBuilder.Append("</div></div>")
                contentPlaceholder.InnerHtml = htmlBuilder.ToString()
                contador = 0
            Next
        End If
    End Sub

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

    Protected Sub GuardarPedido()
        Dim ID_Mesa As Integer = Integer.Parse(CboMesas.SelectedValue)
        Dim dt As DataTable = GetPedidoForMesa(ID_Mesa)

        If dt.Rows.Count = 0 Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('No hay productos en el pedido.');", True)
            Return
        End If

        Dim totalPedido As Decimal = dt.AsEnumerable().Sum(Function(row) row.Field(Of Decimal)("Total"))
        Dim nombrePersona As String = txtPedidoNombre.Text.Trim()

        If String.IsNullOrEmpty(nombrePersona) Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Por favor, ingrese el nombre del cliente.');", True)
            Return
        End If

        ' Guardar el pedido principal y obtener el ID generado
        Dim o_Pedidos As New Pedidos()
        Dim numeroPedido As Integer = o_Pedidos.GuardarPedido(ID_Mesa, nombrePersona, totalPedido)

        If numeroPedido > 0 Then
            Dim o_DetallesPedido As New DetallesPedido()
            Dim resultadoDetalles As Boolean = True

            For Each row As DataRow In dt.Rows
                Dim resultadoDetalle As Boolean = o_DetallesPedido.GuardarDetallePedido(numeroPedido,
                                                                                   CInt(row("Id_Producto")),
                                                                                   CInt(row("Cantidad")),
                                                                                   CDec(row("PrecioUnitario")))
                If Not resultadoDetalle Then
                    resultadoDetalles = False
                    Exit For
                End If
            Next

            If resultadoDetalles Then
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", $"alert('Pedido #{numeroPedido} guardado exitosamente');", True)
                LimpiarPedido(ID_Mesa)
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Error al guardar los detalles del pedido');", True)
            End If
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Error al guardar el pedido');", True)
        End If
    End Sub


    Private Property Pedidos As Dictionary(Of Integer, DataTable)
        Get
            If Session("Pedidos") Is Nothing Then
                Session("Pedidos") = New Dictionary(Of Integer, DataTable)()
            End If
            Return CType(Session("Pedidos"), Dictionary(Of Integer, DataTable))
        End Get
        Set(value As Dictionary(Of Integer, DataTable))
            Session("Pedidos") = value
        End Set
    End Property

    Private Function GetPedidoForMesa(ID_Mesa As Integer) As DataTable
        If Not Pedidos.ContainsKey(ID_Mesa) Then
            Dim dt As New DataTable()
            dt.Columns.Add("ID_Mesa", GetType(Integer))
            dt.Columns.Add("Id_Producto", GetType(Integer))
            dt.Columns.Add("Producto", GetType(String))
            dt.Columns.Add("PrecioUnitario", GetType(Decimal))
            dt.Columns.Add("Cantidad", GetType(Integer))
            dt.Columns.Add("Total", GetType(Decimal))
            Pedidos(ID_Mesa) = dt
        End If
        Return Pedidos(ID_Mesa)
    End Function

    Protected Sub AgregarProductoAlPedido(idProducto As Integer, cantidad As Integer)
        Dim ID_Mesa As Integer = Integer.Parse(CboMesas.SelectedValue)
        Dim productos As New Productos()
        Dim producto As Producto = productos.ObtenerProductoPorId(idProducto)

        If producto IsNot Nothing AndAlso producto.ID_Producto > 0 Then
            AgregarProductoAlPedido(ID_Mesa, producto.ID_Producto, producto.Nombre, cantidad, producto.Precio)
            ActualizarGridPedidos(ID_Mesa)
        Else
            ' Manejar el caso en que el producto no se encuentre
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alert", "alert('Producto no encontrado.');", True)
        End If
    End Sub


    Protected Sub AgregarProductoAlPedido(ID_Mesa As Integer, Id_producto As Integer, nombre As String, cantidad As Integer, precio As Decimal)
        Dim dt As DataTable = GetPedidoForMesa(ID_Mesa)

        ' Verificar si el producto ya existe en el pedido
        Dim existingRow = dt.AsEnumerable().FirstOrDefault(Function(r) r.Field(Of Integer)("Id_Producto") = Id_producto)

        If existingRow IsNot Nothing Then
            ' Si el producto ya existe, actualizamos la cantidad y el total
            existingRow("Cantidad") = CInt(existingRow("Cantidad")) + cantidad
            existingRow("Total") = CDec(existingRow("Total")) + (cantidad * precio)
        Else
            ' Si el producto no existe, agregamos una nueva fila
            Dim row As DataRow = dt.NewRow()
            row("ID_Mesa") = ID_Mesa
            row("Id_Producto") = Id_producto
            row("Producto") = nombre
            row("PrecioUnitario") = precio
            row("Cantidad") = cantidad
            row("Total") = cantidad * precio
            dt.Rows.Add(row)
        End If

        Pedidos(ID_Mesa) = dt ' Actualizar la sesión con el nuevo pedido
        ActualizarGridPedidos(ID_Mesa)
    End Sub


    Private Sub ActualizarGridPedidos(ID_Mesa As Integer)
        Dim dt As DataTable = GetPedidoForMesa(ID_Mesa)
        GriPedidos.DataSource = dt
        GriPedidos.DataBind()
        ActualizarTotalGeneral(ID_Mesa)
        GriPedidos.Visible = True
    End Sub

    Private Sub ActualizarTotalGeneral(ID_Mesa As Integer)
        Dim dt As DataTable = GetPedidoForMesa(ID_Mesa)
        Dim totalGeneral As Decimal = dt.AsEnumerable().Sum(Function(row) row.Field(Of Decimal)("Total"))

        ' Actualizar el span con el total
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "actualizarTotal",
        $"document.getElementById('totalPedido').innerText = '{totalGeneral:C}';", True)
    End Sub

    Private Sub ConfigureBotonesAgregar(sender As Object, e As EventArgs)
        For Each control As Control In contentPlaceholder.Controls
            If TypeOf control Is HtmlButton AndAlso CType(control, HtmlButton).ID.StartsWith("prod") Then
                AddHandler CType(control, HtmlButton).ServerClick, AddressOf AgregaPedido
            End If
        Next
    End Sub

    Protected Sub AgregaPedido(sender As Object, e As EventArgs)
        Dim btn As HtmlButton = CType(sender, HtmlButton)
        Dim idProducto As Integer = Integer.Parse(btn.ID.Substring(4))
        Dim cantidad As Integer = Integer.Parse(CType(btn.Parent.FindControl("cant" & idProducto), HtmlInputGenericControl).Value)
        Dim precio As Decimal = Decimal.Parse(CType(btn.Parent.FindControl("prec" & idProducto), HtmlGenericControl).InnerText.Substring(1))
        Dim nombre As String = CType(btn.Parent.FindControl("nombre" & idProducto), HtmlGenericControl).InnerText

        Dim ID_Mesa As Integer = Integer.Parse(CboMesas.SelectedValue)
        AgregarProductoAlPedido(ID_Mesa, idProducto, nombre, cantidad, precio)

        ' Mostrar los elementos con la clase A-Pedido
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "mostrarPedido",
        "document.querySelectorAll('.A-Pedido').forEach(function(el) { el.style.display = 'block'; });", True)
    End Sub

    Private Sub LimpiarPedido(ID_Mesa As Integer)
        If Pedidos.ContainsKey(ID_Mesa) Then
            Pedidos.Remove(ID_Mesa)
        End If
        GriPedidos.DataSource = Nothing
        GriPedidos.DataBind()

        ' Ocultar los elementos con la clase A-Pedido y resetear el total
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "limpiarPedido",
        "document.querySelectorAll('.A-Pedido').forEach(function(el) { el.style.display = 'none'; });" &
        "document.getElementById('totalPedido').innerText = '$0.00';" &
        "if(document.getElementById('CboMesas')) document.getElementById('CboMesas').selectedIndex = -1;", True)
    End Sub



    '***************************************************
    'CODIGO DE ROMINA PARA ADAPTAR
    '***************************************************


    'Protected Sub cboAceptar_Click(sender As Object, e As EventArgs) Handles cboAceptar.Click
    '    Dim ID_Mesa as integer = Cbo_Mesas.SelectedValue
    '    Dim idproducto As Integer = CboProducto.SelectedValue
    '    Dim producto As String = CboProducto.SelectedItem.Text
    '    Dim precio As Decimal = Decimal.Parse(txtPrecio.Text)
    '    Dim cantidad As Integer = Integer.Parse(CboCantidad.SelectedValue)
    '    Dim total As Decimal = precio * cantidad

    '    ' Agregar los datos al DataTable
    '    Dim dt As DataTable = Pedido
    '    Dim dr As DataRow = dt.NewRow()
    'dr('
    '    dr("ProductoId") = idproducto
    '    dr("Producto") = producto
    '    dr("PrecioUnitario") = precio
    '    dr("Cantidad") = cantidad
    '    dr("Total") = total
    '    dt.Rows.Add(dr)

    '    ' Actualizar la propiedad Pedido y la grilla
    '    Pedido = dt
    '    grdGrilla.DataSource = dt
    '    grdGrilla.DataBind()
    '    ActualizarTotalGeneral()

    'End Sub
    'Private Sub ActualizarTotalGeneral()
    '    Dim totalGeneral As Decimal = 0

    '    For Each row As DataRow In Pedido.Rows
    '        totalGeneral += Convert.ToDecimal(row("Total"))
    '    Next

    '    txtTotal.Text = totalGeneral
    'End Sub

    'Protected Sub cmbGuardar_Click(sender As Object, e As EventArgs) Handles cmbGuardar.Click
    '    Dim clienteId As Integer = Integer.Parse(cboCliente.SelectedValue)
    '    Dim fechaSeleccionada As DateTime = Calendar1.SelectedDate

    '    ' Verificar que se haya seleccionado una fecha
    '    If fechaSeleccionada = DateTime.MinValue Then
    '        ' No se ha seleccionado una fecha
    '        Response.Write("<script>alert('Por favor, selecciona una fecha.');</script>")
    '        Return
    '    End If

    '    Dim total As Decimal = Convert.ToDecimal(txtTotal.Text)

    '    ' Crear y llenar la tabla de detalles del pedido
    '    Dim detalles As New DataTable()
    '    detalles.Columns.Add("ProductoId", GetType(Integer))
    '    detalles.Columns.Add("Cantidad", GetType(Integer))
    '    detalles.Columns.Add("PrecioUnitario", GetType(Decimal))

    '    ' Asegúrate de que la tabla Pedido contiene las columnas necesarias
    '    If Pedido.Columns.Contains("ProductoId") AndAlso Pedido.Columns.Contains("Cantidad") AndAlso Pedido.Columns.Contains("PrecioUnitario") Then
    '        For Each row As DataRow In Pedido.Rows
    '            detalles.Rows.Add(row("ProductoId"), row("Cantidad"), row("PrecioUnitario"))
    '        Next
    '    Else
    '        Response.Write("<script>alert('La tabla Pedido no contiene las columnas necesarias.');</script>")
    '        Return
    '    End If

    '    ' Llamar al método para guardar el pedido
    '    Dim o_Pedidos As New C_Pedidos()
    '    Dim resultado As Boolean = o_Pedidos.Guardar_Pedido(clienteId, fechaSeleccionada, total, detalles)

    '    If resultado Then
    '        ' Mostrar un mensaje de éxito y limpiar los controles
    '        Response.Write("<script>alert('Pedido guardado exitosamente');</script>")
    '        LimpiarControles()
    '    Else
    '        ' Mostrar un mensaje de error
    '        Response.Write("<script>alert('Error al guardar el pedido');</script>")
    '    End If

    'End Sub

    'Private Sub LimpiarControles()
    '    cboCliente.SelectedIndex = 0
    '    CboProducto.SelectedIndex = 0
    '    txtPrecio.Text = ""
    '    CboCantidad.SelectedIndex = 0
    '    Pedido.Clear()
    '    grdGrilla.DataSource = Nothing
    '    grdGrilla.DataBind()
    '    txtTotal.Text = ""

    'End Sub




End Class