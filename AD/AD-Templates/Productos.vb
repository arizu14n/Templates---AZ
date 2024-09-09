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

Public Class Productos

    Dim o_Database As Database
    Public Sub New()
        o_Database = DatabaseFactory.CreateDatabase("Conn")

    End Sub

    Public Function Productos_Agregar(ByVal ID_Categoria As Integer, ByVal Imagen As String, ByVal Nombre As String, ByVal Descripcion As String, ByVal Precio As Double, ByVal Estado As Boolean) As Double
        Try
            Return o_Database.ExecuteScalar("Productos_Agregar", ID_Categoria, Imagen, Nombre, Descripcion, Precio, Estado)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function

    Public Function Productos_ConsultarActivos()
        Try
            Return o_Database.ExecuteDataSet("Productos_ConsultarActivos")
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Productos_ConsultarActivosPorCategoria(ByVal nombreCategoria As String) As DataSet
        Try
            Return o_Database.ExecuteDataSet("Productos_ConsultarActivosPorCategoria", nombreCategoria)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Productos_ConsultarTodos()
        Try
            Return o_Database.ExecuteDataSet("Productos_ConsultarTodos")
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Productos_ConsultarID(ByVal ID_Producto As Integer) As DataSet
        Try
            Return o_Database.ExecuteDataSet("Productos_ConsultarID", ID_Producto)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Productos_Eliminar(ByVal ID_Producto As Integer) As Double
        Try
            Return o_Database.ExecuteNonQuery("Productos_Eliminar", ID_Producto)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function
    Public Function Productos_Modificar(ByVal ID_Producto As Integer, ByVal ID_Categoria As Integer, ByVal Imagen As String, ByVal Nombre As String, ByVal Descripcion As String, ByVal Precio As Double, ByVal Estado As Boolean) As Double
        Try
            Return o_Database.ExecuteNonQuery("Productos_Modificar", ID_Producto, ID_Categoria, Imagen, Nombre, Descripcion, Precio, Estado)
        Catch ex As System.Exception
            Throw ex

        End Try
    End Function



    Public Function ObtenerProductoPorId(idProducto As Integer) As Producto
            Dim producto As New Producto()
            Dim sqlCommand As String = "SELECT ID_Producto, Nombre, Precio, Descripcion, Imagen " &
                                   "FROM Productos WHERE ID_Producto = @ID_Producto"

            Dim dbCommand As DbCommand = o_Database.GetSqlStringCommand(sqlCommand)
            o_Database.AddInParameter(dbCommand, "@ID_Producto", DbType.Int32, idProducto)

            Using dataReader As IDataReader = o_Database.ExecuteReader(dbCommand)
                If dataReader.Read() Then
                    producto.ID_Producto = Convert.ToInt32(dataReader("ID_Producto"))
                    producto.Nombre = Convert.ToString(dataReader("Nombre"))
                    producto.Precio = Convert.ToDecimal(dataReader("Precio"))
                    producto.Descripcion = Convert.ToString(dataReader("Descripcion"))
                    producto.Imagen = Convert.ToString(dataReader("Imagen"))
                End If
            End Using

            Return producto
        End Function


    Public Class Producto
        Public Property ID_Producto As Integer
        Public Property Nombre As String
        Public Property Precio As Decimal
        Public Property Descripcion As String
        Public Property Imagen As String
    End Class


    Public Property Categoria As String
    Public Property Nombre As String
    Public Property Descripcion As String
    Public Property Precio As Decimal


End Class
