Imports System.Data
Imports System.Data.SqlClient
Imports System.Xml
Imports AD_Templates

Public Class backoffice
    Inherits System.Web.UI.Page

    Dim oDs As New DataSet
    Dim o_Cat As New Categorias


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Usuario") Is Nothing Then
            Response.Redirect("Login.aspx")

        End If

        If Page.IsPostBack = False Then
            llenarComboCategorias()

        End If
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As EventArgs)
        Session("Usuario") = Nothing
        Response.Redirect("Login.aspx")
    End Sub

    Protected Sub btnCrudProductos_Click(sender As Object, e As EventArgs)

        llenarGrillaProductos()
    End Sub

    Public Sub llenarComboCategorias()
        Dim o_Cat As New Categorias
        oDs = o_Cat.Categorias_ConsultarActivas()
        With cbo_ProductoCategorias
            .DataSource = oDs.Tables(0)
            .DataTextField = oDs.Tables(0).Columns(1).ToString
            .DataValueField = oDs.Tables(0).Columns(0).ToString
            .DataBind()
        End With
    End Sub

    Public Sub llenarGrillaProductos()
        Dim o_Prod As New Productos
        oDs = o_Prod.Productos_ConsultarTodos
        With GridView1
            .DataSource = oDs.Tables(0)
            .DataBind()
        End With
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Attributes("onclick") = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" & e.Row.RowIndex)
            e.Row.Attributes("style") = "cursor:pointer;"
        End If
    End Sub
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim row As GridViewRow = GridView1.SelectedRow
        For Each rowItem As GridViewRow In GridView1.Rows
            rowItem.CssClass = If(rowItem.RowIndex = GridView1.SelectedIndex, "gridview-selected-row", String.Empty)
        Next
        txt_ProductoID.Text = Server.HtmlDecode(row.Cells(1).Text)
        btn_ProductoConsultarID_Click(sender, e)
    End Sub
    Public Function CargaFD() As Boolean
        If txt_ProductoImagen.Text <> Nothing And txt_ProductoNombre.Text <> Nothing And txt_ProductoDescripcion.Text <> Nothing And txt_ProductoPrecio.Text <> Nothing Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function ModificaFD() As Boolean
        If txt_ProductoID.Text <> Nothing And txt_ProductoImagen.Text <> Nothing And txt_ProductoNombre.Text <> Nothing And txt_ProductoDescripcion.Text <> Nothing And txt_ProductoPrecio.Text <> Nothing Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Sub LimpiarTextos()
        txt_ProductoID.Text = ""
        txt_ProductoImagen.Text = ""
        txt_ProductoNombre.Text = ""
        txt_ProductoDescripcion.Text = ""
        txt_ProductoPrecio.Text = ""

    End Sub
    Protected Sub btn_ProductoAgregar_Click(sender As Object, e As EventArgs) Handles btn_ProductoAgregar.Click
        Dim oDs As New DataSet
        Dim o_Prod As New Productos
        If CargaFD() = True Then
            o_Prod.Productos_Agregar(cbo_ProductoCategorias.SelectedValue, txt_ProductoImagen.Text, txt_ProductoNombre.Text, txt_ProductoDescripcion.Text, txt_ProductoPrecio.Text, chk_ProductoEstado.Checked)
            Dim script As String = "mostrarAlerta('Producto Agregado', 'Un nuevo producto ha sido agregado correctamente', 'success');"
            ClientScript.RegisterStartupScript(Me.GetType(), "SweetAlertScript", script, True)
            llenarGrillaProductos()
            LimpiarTextos()
        Else
            Dim script As String = "mostrarAlerta('¡Faltan datos!', 'revisa e intenta cargar nuevamente', 'error');"
            ClientScript.RegisterStartupScript(Me.GetType(), "SweetAlertScript", script, True)
        End If

    End Sub

    Protected Sub btn_ProductoModificar_Click(sender As Object, e As EventArgs) Handles btn_ProductoModificar.Click
        Dim oDs As New DataSet
        Dim o_Prod As New Productos
        If ModificaFD() = True Then
            o_Prod.Productos_Modificar(txt_ProductoID.Text, cbo_ProductoCategorias.SelectedValue, txt_ProductoImagen.Text, txt_ProductoNombre.Text, txt_ProductoDescripcion.Text, txt_ProductoPrecio.Text, chk_ProductoEstado.Checked)
            llenarGrillaProductos()
            LimpiarTextos()
        Else
            Dim script As String = "mostrarAlerta('¡Faltan datos!', 'revisa e intenta modificar nuevamente', 'error');"
            ClientScript.RegisterStartupScript(Me.GetType(), "SweetAlertScript", script, True)
        End If
    End Sub

    Protected Sub btn_ProductoConsultarID_Click(sender As Object, e As EventArgs) Handles btn_ProductoConsultarID.Click
        Dim oDs As New DataSet
        Dim o_Prod As New Productos
        If txt_ProductoID.Text <> Nothing Then
            oDs = o_Prod.Productos_ConsultarID(txt_ProductoID.Text)
            If oDs.Tables(0).Rows.Count > 0 Then
                Dim row As DataRow = oDs.Tables(0).Rows(0)
                cbo_ProductoCategorias.SelectedValue = row("ID_Categoria").ToString()
                txt_ProductoID.Text = row("ID_Producto").ToString()
                txt_ProductoImagen.Text = row("Imagen").ToString()
                txt_ProductoNombre.Text = row("Nombre").ToString()
                txt_ProductoDescripcion.Text = row("Descripcion").ToString()
                txt_ProductoPrecio.Text = Convert.ToDecimal(row("precio")).ToString("N2")
                Dim estado As String = row("Estado").ToString()
                If estado = True Then
                    chk_ProductoEstado.Checked = True
                Else
                    chk_ProductoEstado.Checked = False
                End If
            End If
        End If
    End Sub

    Protected Sub btn_ProductoEliminar_Click(sender As Object, e As EventArgs) Handles btn_ProductoEliminar.Click
        Dim oDs As New DataSet
        Dim o_Prod As New Productos
        If txt_ProductoID.Text <> Nothing Then
            o_Prod.Productos_Eliminar(txt_ProductoID.Text)
            Dim script As String = "mostrarAlerta('¡Producto Eliminado!', 'Has eliminado un producto correctamente', 'success');"
            ClientScript.RegisterStartupScript(Me.GetType(), "SweetAlertScript", script, True)
            llenarGrillaProductos()
            LimpiarTextos()
        End If
    End Sub

End Class