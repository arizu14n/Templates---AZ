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

    Dim o_Database As Database
    Public Sub New()
        o_Database = DatabaseFactory.CreateDatabase("Conn")

    End Sub

    Public Function GuardarDetallePedido(numeroPedido As Integer, idProducto As Integer, cantidad As Integer, precioUnitario As Decimal) As Boolean
        Dim sqlCommand As String = "INSERT INTO DetallesPedido (NumeroPedido, IdProducto, Cantidad, PrecioUnitario) " &
                                   "VALUES (@NumeroPedido, @IdProducto, @Cantidad, @PrecioUnitario)"

        Dim dbCommand As DbCommand = o_Database.GetSqlStringCommand(sqlCommand)

        o_Database.AddInParameter(dbCommand, "@NumeroPedido", DbType.Int32, numeroPedido)
        o_Database.AddInParameter(dbCommand, "@IdProducto", DbType.Int32, idProducto)
        o_Database.AddInParameter(dbCommand, "@Cantidad", DbType.Int32, cantidad)
        o_Database.AddInParameter(dbCommand, "@PrecioUnitario", DbType.Decimal, precioUnitario)

        Try
            o_Database.ExecuteNonQuery(dbCommand)
            Return True
        Catch ex As Exception
            ' Manejar la excepción según tus necesidades
            Return False
        End Try
    End Function




End Class
