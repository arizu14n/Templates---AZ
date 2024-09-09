Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports System.Configuration
Imports System.Reflection
Imports System.Text.RegularExpressions
Imports System.Runtime.InteropServices.WindowsRuntime

Public Class Usuarios

    Dim o_Database As Database
    Public Sub New()
        o_Database = DatabaseFactory.CreateDatabase("Conn")

    End Sub


    Public Function Usuarios_contar(usuario As String, contra As String) As Integer
        Try
            Return o_Database.ExecuteScalar("Usuario_contar", usuario, contra)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function



End Class
