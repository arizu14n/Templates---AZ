<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="pediddosweb.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Nuevo Pedido</h2>
            <div>
                <asp:Label ID="Label3" runat="server" Text="Cliente"></asp:Label>
                <asp:DropDownList ID="cboCliente" runat="server">
                </asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="Label2" runat="server" AssociatedControlID="txtFecha">Fecha:</asp:Label>
                <asp:TextBox ID="txtFecha" runat="server" Visible="False" Width="16px"></asp:TextBox>
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            </div>
            <h3>Detalles del Pedido</h3>
            <div>
                Producto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Precio&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cantidad</div>
            <div>
                <asp:DropDownList ID="CboProducto" runat="server" Height="16px" AutoPostBack="True" OnSelectedIndexChanged="CboProducto_SelectedIndexChanged">

                </asp:DropDownList>
                <asp:TextBox ID="txtPrecio" runat="server" Enabled="False" Width="90px"></asp:TextBox>
                <asp:DropDownList ID="CboCantidad" runat="server">
                </asp:DropDownList>
                <asp:Button ID="cboAceptar" runat="server" Text="Agregar" />
            </div>
            <div>
                <asp:GridView ID="grdGrilla" runat="server">
                </asp:GridView>
                <br />
                Total
            </div>
        </div>
        <div>
            <asp:TextBox ID="txtTotal" runat="server" Enabled="False"></asp:TextBox>
            <br />
                <asp:Button ID="cmbGuardar" runat="server" Text="Guardar Pedido" />
            </div>
    </form>
</body>
</html>
