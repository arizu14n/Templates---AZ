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

    'Public Function RegistrarPedido(ByVal idMesa As Integer, ByVal realizadoPor As String, ByVal importeTotal As Decimal, ByVal detalles As DataTable, ByRef idPedido As Integer) As Boolean
    '    Try
    '        Using conn As SqlConnection = DirectCast(o_Database.CreateConnection(), SqlConnection)
    '            Using cmd As SqlCommand = New SqlCommand("RegistrarPedido", conn)
    '                cmd.CommandType = CommandType.StoredProcedure

    '                cmd.Parameters.AddWithValue("@ID_Mesa", idMesa)
    '                cmd.Parameters.AddWithValue("@RealizadoPor", realizadoPor)
    '                cmd.Parameters.AddWithValue("@ImporteTotal", importeTotal)

    '                ' Parámetro de tipo de dato de tabla
    '                Dim paramDetalles As SqlParameter = New SqlParameter("@Detalles", SqlDbType.Structured)
    '                paramDetalles.TypeName = "TipoDetallePedido"
    '                paramDetalles.Value = detalles
    '                cmd.Parameters.Add(paramDetalles)

    '                ' Parámetro de salida
    '                Dim paramIDPedido As SqlParameter = New SqlParameter("@ID_Pedido", SqlDbType.Int)
    '                paramIDPedido.Direction = ParameterDirection.Output
    '                cmd.Parameters.Add(paramIDPedido)

    '                conn.Open()
    '                cmd.ExecuteNonQuery()

    '                ' Obtener el ID del pedido
    '                idPedido = Convert.ToInt32(paramIDPedido.Value)

    '                Return True
    '            End Using
    '        End Using
    '    Catch ex As Exception
    '        ' Manejar excepción o registrar error
    '        Return False
    '    End Try
    'End Function





End Class
