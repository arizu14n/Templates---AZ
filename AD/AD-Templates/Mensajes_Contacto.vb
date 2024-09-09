Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports System.Configuration
Imports System.Reflection
Imports System.Text.RegularExpressions
Imports System.Runtime.InteropServices.WindowsRuntime
Public Class Mensajes_Contacto

    Dim o_Database As Database
    Public Sub New()
        o_Database = DatabaseFactory.CreateDatabase("Conn")

    End Sub

    Public Function Mensajes_Contacto_Agregar(ByVal Nombre As String, ByVal Email As String, ByVal Mensaje As String) As Double
        Try
            Return o_Database.ExecuteScalar("Mensajes_Contacto_Agregar", Nombre, Email, Mensaje)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function


    Public Function Mensajes_Contacto_ConsultarTodos()
        Try
            Return o_Database.ExecuteDataSet("Mensajes_Contacto_ConsultarTodos")
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Mensajes_Contacto_ConsultarID(ByVal ID_Contacto As Integer) As DataSet
        Try
            Return o_Database.ExecuteDataSet("Mensajes_Contacto_ConsultarID", ID_Contacto)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Mensajes_Contacto_Eliminar(ByVal ID_Contacto As Integer) As Double
        Try
            Return o_Database.ExecuteNonQuery("Mensajes_Contacto_Eliminar", ID_Contacto)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Mensajes_Contacto_Modificar(ByVal ID_Contacto As Integer, ByVal Nombre As String, ByVal Email As String, ByVal Mensaje As String, ByVal Estado As Boolean) As Double
        Try
            Return o_Database.ExecuteNonQuery("Mensajes_Contacto_Modificar", ID_Contacto, Nombre, Email, Mensaje)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function




End Class
