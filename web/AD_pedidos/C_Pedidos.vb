Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports System.Configuration
Imports System.Data.Common ' Agrega este import
Public Class C_Pedidos
    Dim o_Database As Database

    Public Sub New()
        o_Database = DatabaseFactory.CreateDatabase("Conn")
    End Sub

    Public Function Cargar_Combo() As DataSet

        Return o_Database.ExecuteDataSet("Cargar_Combo_Clientes")

    End Function
    Public Function Cargar_Combo_Productos() As DataSet

        Return o_Database.ExecuteDataSet("Cargar_Combo_Productos")

    End Function
    Public Function Consultar_Precio(ByVal Id_Producto As Integer) As DataSet
        Return o_Database.ExecuteDataSet("Consultar_Precio", Id_Producto)

    End Function
    Public Function Guardar_Pedido(clienteId As Integer, fecha As DateTime, total As Decimal, detalles As DataTable) As Boolean


        Using connection As DbConnection = o_Database.CreateConnection()
            connection.Open()
                ' Iniciar una transacción
                Using transaction As SqlTransaction = connection.BeginTransaction()

                    ' Crear el comando para el procedimiento almacenado
                    Using command As New SqlCommand("InsertarPedidoCompleto", connection, transaction)
                        command.CommandType = CommandType.StoredProcedure

                        ' Agregar los parámetros al comando
                        command.Parameters.Add(New SqlParameter("@ClienteId", SqlDbType.Int)).Value = clienteId
                        command.Parameters.Add(New SqlParameter("@Fecha", SqlDbType.DateTime)).Value = fecha
                        command.Parameters.Add(New SqlParameter("@Total", SqlDbType.Decimal)).Value = total

                        ' Crear el parámetro para el tipo estructurado
                        Dim detallesParam As New SqlParameter("@Detalles", SqlDbType.Structured)
                        detallesParam.TypeName = "dbo.DetallesPedidoType"
                        detallesParam.Value = detalles
                        command.Parameters.Add(detallesParam)

                        ' Ejecutar el comando
                        command.ExecuteNonQuery()

                        ' Confirmar la transacción
                        transaction.Commit()
                    End Using
                End Using
            End Using
            Return True

    End Function
End Class
