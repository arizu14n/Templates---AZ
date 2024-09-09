Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports System.Configuration
Imports System.Reflection
Imports System.Text.RegularExpressions
Imports System.Runtime.InteropServices.WindowsRuntime


Public Class Especiales

    Dim o_Database As Database
    Public Sub New()
        o_Database = DatabaseFactory.CreateDatabase("Conn")

    End Sub

    Public Function Especiales_Agregar(ByVal Nombre As String, ByVal Descripcion As String, ByVal Imagen As String, ByVal Estado As Boolean) As Double
        Try
            Return o_Database.ExecuteScalar("Especiales_Agregar", Nombre, Descripcion, Imagen, Estado)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function

    Public Function Especiales_ConsultarActivos()
        Try
            Return o_Database.ExecuteDataSet("Especiales_ConsultarActivos")
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Especiales_ConsultarTodos()
        Try
            Return o_Database.ExecuteDataSet("Especiales_ConsultarTodos")
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Especiales_ConsultarID(ByVal ID_Especial As Integer) As DataSet
        Try
            Return o_Database.ExecuteDataSet("Especiales_ConsultarID", ID_Especial)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Especiales_Eliminar(ByVal ID_Especial As Integer) As Double
        Try
            Return o_Database.ExecuteNonQuery("Especiales_Eliminar", ID_Especial)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Especiales_Modificar(ByVal ID_Especial As Integer, ByVal Nombre As String, ByVal Descripcion As String, ByVal Imagen As String, ByVal Estado As Boolean) As Double
        Try
            Return o_Database.ExecuteNonQuery("Especiales_Modificar", ID_Especial, Nombre, Descripcion, Imagen, Estado)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function



End Class
