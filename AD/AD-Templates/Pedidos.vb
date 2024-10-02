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

    Public Function GuardarPedido(idMesa As Integer, realizadoPor As String, importeTotal As Decimal, detallesPedido As DataTable) As Boolean
        Dim transaction As SqlTransaction = Nothing
        Dim conn As SqlConnection = Nothing

        Try
            conn = DirectCast(o_Database.CreateConnection(), SqlConnection)
            conn.Open()
            transaction = conn.BeginTransaction()

            ' Insertar en la tabla pedidosEncabezado
            Dim fechaPedido As Date = Now.Date
            Dim estado As Boolean = True
            Dim idPedido As Integer = Pedidos_AgregarEncabezado(idMesa, fechaPedido, realizadoPor, importeTotal, estado, transaction)

            ' Insertar en la tabla pedidosDetalle
            For Each row As DataRow In detallesPedido.Rows
                Dim idProducto As Integer = Convert.ToInt32(row("ID_Producto"))
                Dim cantidad As Integer = Convert.ToInt32(row("Cantidad"))
                Dim precio As Decimal = Convert.ToDecimal(row("Precio"))

                Pedidos_AgregarDetalle(idPedido, idProducto, cantidad, precio, estado, transaction)
            Next

            ' Confirmar la transacción
            transaction.Commit()
            Return True
        Catch ex As Exception
            ' Deshacer la transacción en caso de error
            If transaction IsNot Nothing Then
                transaction.Rollback()
            End If
            Throw ex
        Finally
            If conn IsNot Nothing AndAlso conn.State = ConnectionState.Open Then
                conn.Close()
            End If
        End Try
    End Function

End Class




