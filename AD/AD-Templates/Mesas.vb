Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports System.Configuration
Imports System.Reflection
Imports System.Text.RegularExpressions
Imports System.Runtime.InteropServices.WindowsRuntime


Public Class Mesas

    Dim o_Database As Database
    Public Sub New()
        o_Database = DatabaseFactory.CreateDatabase("Conn")

    End Sub


    Public Function Mesas_ListasDisponibles()
        Try
            Return o_Database.ExecuteDataSet("Mesas_ListasDisponibles")
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function


End Class
