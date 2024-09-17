Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports System.Configuration
Imports System.Reflection
Imports System.Text.RegularExpressions
Imports System.Runtime.InteropServices.WindowsRuntime
Imports System.Data.Common

Public Class DetallesPedido

    Public Property idPedido As Integer
    Public Property ID_Producto As Integer
    Public Property Descripcion As String
    Public Property Cantidad As Integer
    Public Property Precio As Decimal
    Public Property Total As Decimal



    Dim o_Database As Database
    Public Sub New()
        o_Database = DatabaseFactory.CreateDatabase("Conn")

    End Sub




End Class
