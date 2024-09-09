Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports System.Configuration
Imports System.Reflection
Imports System.Text.RegularExpressions
Imports System.Runtime.InteropServices.WindowsRuntime

Public Class Categorias

    Dim o_Database As Database
    Public Sub New()
        o_Database = DatabaseFactory.CreateDatabase("Conn")

    End Sub

    Public Function Categorias_Agregar(ByVal Nombre As String, ByVal Estado As Boolean) As Double
        Try
            Return o_Database.ExecuteScalar("Categorias_Agregar", Nombre, Estado)
        Catch ex As System.Exception
            Throw ex

        End Try

    End Function

    Public Function Categorias_ConsultarActivas()
        Try
            Return o_Database.ExecuteDataSet("Categorias_ConsultarActivas")
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Categorias_ConsultarTodos()
        Try
            Return o_Database.ExecuteDataSet("Categorias_ConsultarTodos")
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Categorias_ConsultarID(ByVal ID_Categoria As Integer) As DataSet
        Try
            Return o_Database.ExecuteDataSet("Categorias_ConsultarID", ID_Categoria)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Categorias_Eliminar(ByVal ID_Categoria As Integer) As Double
        Try
            Return o_Database.ExecuteNonQuery("Categorias_Eliminar", ID_Categoria)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Categorias_Modificar(ByVal ID_Categoria As Integer, ByVal Nombre As String, ByVal Estado As Boolean) As Double
        Try
            Return o_Database.ExecuteNonQuery("Categorias_Modificar", ID_Categoria, Nombre, Estado)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function




End Class
