Imports System.Data
Imports AD_Pedidos

Public Class Inicio
    Inherits System.Web.UI.Page
    Dim oDs As New DataSet
    Dim o_Pedidos As New C_Pedidos
    Public totalgeneral As Decimal = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            cargar_combo()
            cargar_combo_productos()
            For i = 1 To 20
                CboCantidad.Items.Add(i)
            Next
        End If

    End Sub


    Public Sub cargar_combo()
        Dim o_Pedidos As New C_Pedidos
        oDs = o_Pedidos.Cargar_Combo_Productos

        With CboProducto
            .DataSource = oDs.Tables(0)
            .DataTextField = oDs.Tables(0).Columns(1).ToString
            .DataValueField = oDs.Tables(0).Columns(0).ToString
            .DataBind()
        End With
    End Sub
    Public Sub cargar_combo_productos()
        Dim o_Pedidos As New C_Pedidos
        oDs = o_Pedidos.Cargar_Combo

        With cboCliente
            .DataSource = oDs.Tables(0)
            .DataTextField = oDs.Tables(0).Columns(1).ToString
            .DataValueField = oDs.Tables(0).Columns(0).ToString
            .DataBind()
        End With
    End Sub

    Protected Sub CboProducto_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CboProducto.SelectedIndexChanged
        oDs = New DataSet
        o_Pedidos = New C_Pedidos

        oDs = o_Pedidos.Consultar_Precio(CboProducto.SelectedValue)

        txtPrecio.Text = oDs.Tables(0).Rows(0)(0).ToString()
    End Sub
    Private Property Pedido As DataTable
        Get
            If Session("Pedido") Is Nothing Then
                Dim dt As New DataTable()
                dt.Columns.Add("ProductoId", GetType(Integer))
                dt.Columns.Add("Producto", GetType(String)) ' Asumo que tienes una columna Producto para mostrar el nombre del producto
                dt.Columns.Add("PrecioUnitario", GetType(Decimal))
                dt.Columns.Add("Cantidad", GetType(Integer))
                dt.Columns.Add("Total", GetType(Decimal)) ' Asumo que tienes una columna Total para el precio total de cada producto
                Session("Pedido") = dt
            End If
            Return CType(Session("Pedido"), DataTable)
        End Get
        Set(value As DataTable)
            Session("Pedido") = value
        End Set
    End Property

    Protected Sub cboAceptar_Click(sender As Object, e As EventArgs) Handles cboAceptar.Click
        Dim idproducto As Integer = CboProducto.SelectedValue
        Dim producto As String = CboProducto.SelectedItem.Text
        Dim precio As Decimal = Decimal.Parse(txtPrecio.Text)
        Dim cantidad As Integer = Integer.Parse(CboCantidad.SelectedValue)
        Dim total As Decimal = precio * cantidad

        ' Agregar los datos al DataTable
        Dim dt As DataTable = Pedido
        Dim dr As DataRow = dt.NewRow()
        dr("ProductoId") = idproducto
        dr("Producto") = producto
        dr("PrecioUnitario") = precio
        dr("Cantidad") = cantidad
        dr("Total") = total
        dt.Rows.Add(dr)

        ' Actualizar la propiedad Pedido y la grilla
        Pedido = dt
        grdGrilla.DataSource = dt
        grdGrilla.DataBind()
        ActualizarTotalGeneral()

    End Sub
    Private Sub ActualizarTotalGeneral()
        Dim totalGeneral As Decimal = 0

        For Each row As DataRow In Pedido.Rows
            totalGeneral += Convert.ToDecimal(row("Total"))
        Next

        txtTotal.Text = totalGeneral
    End Sub

    Protected Sub cmbGuardar_Click(sender As Object, e As EventArgs) Handles cmbGuardar.Click
        Dim clienteId As Integer = Integer.Parse(cboCliente.SelectedValue)
        Dim fechaSeleccionada As DateTime = Calendar1.SelectedDate

        ' Verificar que se haya seleccionado una fecha
        If fechaSeleccionada = DateTime.MinValue Then
            ' No se ha seleccionado una fecha
            Response.Write("<script>alert('Por favor, selecciona una fecha.');</script>")
            Return
        End If

        Dim total As Decimal = Convert.ToDecimal(txtTotal.Text)

        ' Crear y llenar la tabla de detalles del pedido
        Dim detalles As New DataTable()
        detalles.Columns.Add("ProductoId", GetType(Integer))
        detalles.Columns.Add("Cantidad", GetType(Integer))
        detalles.Columns.Add("PrecioUnitario", GetType(Decimal))

        ' Asegúrate de que la tabla Pedido contiene las columnas necesarias
        If Pedido.Columns.Contains("ProductoId") AndAlso Pedido.Columns.Contains("Cantidad") AndAlso Pedido.Columns.Contains("PrecioUnitario") Then
            For Each row As DataRow In Pedido.Rows
                detalles.Rows.Add(row("ProductoId"), row("Cantidad"), row("PrecioUnitario"))
            Next
        Else
            Response.Write("<script>alert('La tabla Pedido no contiene las columnas necesarias.');</script>")
            Return
        End If

        ' Llamar al método para guardar el pedido
        Dim o_Pedidos As New C_Pedidos()
        Dim resultado As Boolean = o_Pedidos.Guardar_Pedido(clienteId, fechaSeleccionada, total, detalles)

        If resultado Then
            ' Mostrar un mensaje de éxito y limpiar los controles
            Response.Write("<script>alert('Pedido guardado exitosamente');</script>")
            LimpiarControles()
        Else
            ' Mostrar un mensaje de error
            Response.Write("<script>alert('Error al guardar el pedido');</script>")
        End If

    End Sub

    Private Sub LimpiarControles()
        cboCliente.SelectedIndex = 0
        CboProducto.SelectedIndex = 0
        txtPrecio.Text = ""
        CboCantidad.SelectedIndex = 0
        Pedido.Clear()
        grdGrilla.DataSource = Nothing
        grdGrilla.DataBind()
        txtTotal.Text = ""

    End Sub
End Class