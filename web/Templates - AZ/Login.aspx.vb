Imports System.Data.SqlClient
Imports System.Web.Configuration
Imports System.Data
Imports System.Xml
Imports AD_Templates

Public Class Login
    Inherits System.Web.UI.Page

    Dim oDs As New DataSet
    Dim o_Usu As New Usuarios



    Protected Sub btn_Login_Click(sender As Object, e As EventArgs)

        Dim usuario As String = txt_Usuario.Text
        Dim contraseña As String = txt_Contra.Text
        Dim estaCorrecto As Boolean = False

        Dim o_Usu As New Usuarios

        Dim count As Integer = 0
        count = o_Usu.Usuarios_contar(usuario, contraseña)

        If count > 0 Then
            estaCorrecto = True
        End If
        If estaCorrecto = True Then
            Session("Usuario") = usuario
            Response.Redirect("backoffice.aspx")
        Else
            lbl_Respuesta.Text = "Los valores ingresados de usuario y/o contraseña no son correctos"

        End If

    End Sub
End Class
