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

    Public Function GuardarPedido(mesaId As Integer, nombrePersona As String, totalPedido As Decimal) As Integer
        Dim numeroPedido As Integer = 0

        Dim sqlCommand As String = "INSERT INTO Pedidos (MesaId, NombrePersona, TotalPedido, FechaPedido) " &
                                   "VALUES (@MesaId, @NombrePersona, @TotalPedido, @FechaPedido); " &
                                   "SELECT SCOPE_IDENTITY();"

        Dim dbCommand As DbCommand = o_Database.GetSqlStringCommand(sqlCommand)

        o_Database.AddInParameter(dbCommand, "@MesaId", DbType.Int32, mesaId)
        o_Database.AddInParameter(dbCommand, "@NombrePersona", DbType.String, nombrePersona)
        o_Database.AddInParameter(dbCommand, "@TotalPedido", DbType.Decimal, totalPedido)
        o_Database.AddInParameter(dbCommand, "@FechaPedido", DbType.DateTime, DateTime.Now)

        Try
            numeroPedido = Convert.ToInt32(o_Database.ExecuteScalar(dbCommand))
        Catch ex As Exception
            ' Manejar la excepción según tus necesidades
            ' Por ejemplo, podrías registrar el error en un log
            Throw New Exception("Error al guardar el pedido", ex)
        End Try

        Return numeroPedido
    End Function




End Class
