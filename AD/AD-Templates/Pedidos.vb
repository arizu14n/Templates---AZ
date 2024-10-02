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


Public Class Pedidos

    Dim o_Database As Database

    Public Sub New()
        o_Database = DatabaseFactory.CreateDatabase("Conn")

    End Sub


    'Pedido_AgregarEncabezado. ASI SE LLAMA EL SP
    Public Function Pedidos_AgregarEncabezado(idMesa As Integer, fechaPedido As Date, realizadoPor As String, importeTotal As Decimal, estado As Boolean, transaction As SqlTransaction) As Integer
        Try
            Return o_Database.ExecuteScalar("Pedidos_AgregarEncabezado", idMesa, fechaPedido, realizadoPor, importeTotal, estado, transaction)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function

    'Pedidos_AgregarDetalle. ASI SE LLAMA EL SP

    Public Function Pedidos_AgregarDetalle(idPedido As Integer, idProducto As Integer, cantidad As Integer, precio As Decimal, estado As Boolean, transaction As SqlTransaction) As Double
        Try
            Return o_Database.ExecuteScalar("Pedidos_AgregarDetalle", idPedido, idProducto, cantidad, precio, estado, transaction)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function


End Class




