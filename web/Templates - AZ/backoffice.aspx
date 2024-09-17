<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="backoffice.aspx.vb" Inherits="Templates___AZ.backoffice" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Back Office</title>
    <link rel="stylesheet" href="fontawesome/css/all.min.css" />
    <!-- https://fontawesome.com/ -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
    <!-- https://fonts.google.com/ -->
    <link rel="stylesheet" href="css/tooplate-wave-cafe.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="tm-container">
            <div class="tm-page-content">
                <div class="tm-black-bg tm-contact-text-container">
                    <h2>Bienvenido al Back Office</h2>
                    <asp:Button ID="btnLogout" runat="server" Text="Salir" OnClick="btnLogout_Click" class="tm-btn-primary tm-align-right" />
                    <h3>Operaciones Disponibles</h3>

                    <asp:Button ID="btnCrudProductos" OnClick="llenarGrillaProductos" class="tm-btn-primary prod-button" runat="server" Text="Productos" />

                    <asp:Button ID="btnCrudCategorias" OnClick="llenarGrillaProductos" class="tm-btn-primary prod-button" runat="server" Text="Categorías" />

                    <asp:Button ID="btnCrudUsuarios" OnClick="llenarGrillaProductos" class="tm-btn-primary prod-button" runat="server" Text="Usuarios" />
                    
                    <asp:Button ID="btnCrudEspeciales" OnClick="llenarGrillaProductos" class="tm-btn-primary prod-button" runat="server" Text="Especiales" />

                    <asp:Button ID="btnMensajes" OnClick="llenarGrillaProductos" class="tm-btn-primary prod-button" runat="server" Text="Mensajes" />
                    <asp:Button ID="btnMesas" OnClick="llenarGrillaProductos" class="tm-btn-primary prod-button" runat="server" Text="Mesas" />
                </div>

                <div id="crud-productos" class="tm-page-content">
                    <div class="tm-black-bg tm-contact-form-container tm-align-left">
                        <!-- Formulario de producto -->
                        <div class="tm-form-group">
                            <asp:DropDownList ID="cbo_ProductoCategorias" class="tm-form-control" runat="server" placeholder="Categoría" BackColor="#009999"></asp:DropDownList>
                            <br />
                            <asp:TextBox ID="txt_ProductoID" class="tm-form-control" runat="server" placeholder="ID_Producto"></asp:TextBox>
                            <asp:TextBox ID="txt_ProductoImagen" class="tm-form-control" placeholder="Imagen" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="txt_ProductoNombre" class="tm-form-control" placeholder="Nombre" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="txt_ProductoDescripcion" class="tm-form-control" placeholder="Descripción" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="txt_ProductoPrecio" class="tm-form-control" placeholder="Precio" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label7" runat="server" class="tm-form-control" Text="Activo?"></asp:Label>
                            <asp:CheckBox ID="chk_ProductoEstado" class="tm-form-control" runat="server" Checked="true" />
                            <br />
                            <asp:Button ID="btn_ProductoAgregar" class="tm-btn-primary prod-button" runat="server" Text="Agregar" />
                            <asp:Button ID="btn_ProductoModificar" runat="server" class="tm-btn-primary prod-button" Text="Modificar" />
                            <asp:Button ID="btn_ProductoEliminar" class="tm-btn-primary prod-button" runat="server" Text="Eliminar" />
                            <asp:Button ID="btn_ProductoConsultarID" runat="server" class="tm-btn-primary prod-button" Text="Buscar ID" />
                        </div>
                    </div>
                    <div class="tm-tab-content tm-black-bg" id="grid-container">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            
                            <Columns>
                            
                                <asp:CommandField ShowSelectButton="True" />
                                
                                <asp:BoundField DataField="Codigo" HeaderText="Código">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="Categoria" HeaderText="Categoría">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                <asp:TemplateField HeaderText="Imagen">
                                    <ItemTemplate>
                                        <img src='<%# Eval("Imagen") %>' alt="Imagen" style="max-width: 100px; max-height: 100px;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                                
                                <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:N2}">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:CheckBoxField DataField="Estado" HeaderText="Estado">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:CheckBoxField>

                            </Columns>

                        </asp:GridView>
                    </div>
                </div>

                
                <div id="crud-categorias" class="tm-page-content">
                    <div class="tm-black-bg tm-contact-form-container tm-align-left">
                        <!-- Formulario de Categorias -->
                        <div class="tm-form-group">
                            <h4>CATEGORIAS</h4>
                            <asp:DropDownList ID="DropDownList1" class="tm-form-control" runat="server" placeholder="Categoría" BackColor="#009999"></asp:DropDownList>
                            <br />
                            <asp:TextBox ID="TextBox1" class="tm-form-control" runat="server" placeholder="ID_Producto"></asp:TextBox>
                            <asp:TextBox ID="TextBox2" class="tm-form-control" placeholder="Imagen" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox3" class="tm-form-control" placeholder="Nombre" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox4" class="tm-form-control" placeholder="Descripción" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox5" class="tm-form-control" placeholder="Precio" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label1" runat="server" class="tm-form-control" Text="Activo?"></asp:Label>
                            <asp:CheckBox ID="CheckBox1" class="tm-form-control" runat="server" Checked="true" />
                            <br />
                            <asp:Button ID="Button1" class="tm-btn-primary prod-button" runat="server" Text="Agregar" />
                            <asp:Button ID="Button2" runat="server" class="tm-btn-primary prod-button" Text="Modificar" />
                            <asp:Button ID="Button3" class="tm-btn-primary prod-button" runat="server" Text="Eliminar" />
                            <asp:Button ID="Button4" runat="server" class="tm-btn-primary prod-button" Text="Buscar ID" />
                        </div>
                    </div>
                    <div class="tm-tab-content tm-black-bg" id="grid-container-categorias">
                        <h4>CATEGORIAS</h4>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                            
                            <Columns>
                            
                                <asp:CommandField ShowSelectButton="True" />
                                
                                <asp:BoundField DataField="Codigo" HeaderText="Código">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="Categoria" HeaderText="Categoría">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                <asp:TemplateField HeaderText="Imagen">
                                    <ItemTemplate>
                                        <img src='<%# Eval("Imagen") %>' alt="Imagen" style="max-width: 100px; max-height: 100px;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                                
                                <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:N2}">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:CheckBoxField DataField="Estado" HeaderText="Estado">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:CheckBoxField>

                            </Columns>

                        </asp:GridView>
                    </div>
                </div>

                
                <div id="crud-usuarios" class="tm-page-content">
                    <div class="tm-black-bg tm-contact-form-container tm-align-left">
                        <!-- Formulario de Usuarios -->
                        <div class="tm-form-group">
                            <h4>USUARIOS</h4>
                            <asp:DropDownList ID="DropDownList2" class="tm-form-control" runat="server" placeholder="Categoría" BackColor="#009999"></asp:DropDownList>
                            <br />
                            <asp:TextBox ID="TextBox6" class="tm-form-control" runat="server" placeholder="ID_Producto"></asp:TextBox>
                            <asp:TextBox ID="TextBox7" class="tm-form-control" placeholder="Imagen" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox8" class="tm-form-control" placeholder="Nombre" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox9" class="tm-form-control" placeholder="Descripción" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox10" class="tm-form-control" placeholder="Precio" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label2" runat="server" class="tm-form-control" Text="Activo?"></asp:Label>
                            <asp:CheckBox ID="CheckBox2" class="tm-form-control" runat="server" Checked="true" />
                            <br />
                            <asp:Button ID="Button5" class="tm-btn-primary prod-button" runat="server" Text="Agregar" />
                            <asp:Button ID="Button6" runat="server" class="tm-btn-primary prod-button" Text="Modificar" />
                            <asp:Button ID="Button7" class="tm-btn-primary prod-button" runat="server" Text="Eliminar" />
                            <asp:Button ID="Button8" runat="server" class="tm-btn-primary prod-button" Text="Buscar ID" />
                        </div>
                    </div>
                    <div class="tm-tab-content tm-black-bg" id="grid-container-usuarios">
                        <h4>USUARIOS</h4>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
                            
                            <Columns>
                            
                                <asp:CommandField ShowSelectButton="True" />
                                
                                <asp:BoundField DataField="Codigo" HeaderText="Código">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="Categoria" HeaderText="Categoría">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                <asp:TemplateField HeaderText="Imagen">
                                    <ItemTemplate>
                                        <img src='<%# Eval("Imagen") %>' alt="Imagen" style="max-width: 100px; max-height: 100px;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                                
                                <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:N2}">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:CheckBoxField DataField="Estado" HeaderText="Estado">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:CheckBoxField>

                            </Columns>

                        </asp:GridView>
                    </div>
                </div>

                
                <div id="crud-especiales" class="tm-page-content">
                    <div class="tm-black-bg tm-contact-form-container tm-align-left">
                        <!-- Formulario de Especiales -->
                        <div class="tm-form-group">
                            <h4>ESPECIALES</h4>
                            <asp:DropDownList ID="DropDownList3" class="tm-form-control" runat="server" placeholder="Categoría" BackColor="#009999"></asp:DropDownList>
                            <br />
                            <asp:TextBox ID="TextBox11" class="tm-form-control" runat="server" placeholder="ID_Producto"></asp:TextBox>
                            <asp:TextBox ID="TextBox12" class="tm-form-control" placeholder="Imagen" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox13" class="tm-form-control" placeholder="Nombre" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox14" class="tm-form-control" placeholder="Descripción" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox15" class="tm-form-control" placeholder="Precio" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label3" runat="server" class="tm-form-control" Text="Activo?"></asp:Label>
                            <asp:CheckBox ID="CheckBox3" class="tm-form-control" runat="server" Checked="true" />
                            <br />
                            <asp:Button ID="Button9" class="tm-btn-primary prod-button" runat="server" Text="Agregar" />
                            <asp:Button ID="Button10" runat="server" class="tm-btn-primary prod-button" Text="Modificar" />
                            <asp:Button ID="Button11" class="tm-btn-primary prod-button" runat="server" Text="Eliminar" />
                            <asp:Button ID="Button12" runat="server" class="tm-btn-primary prod-button" Text="Buscar ID" />
                        </div>
                    </div>
                    <div class="tm-tab-content tm-black-bg" id="grid-container-especiales">
                        <h4>ESPECIALES</h4>
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
                            
                            <Columns>
                            
                                <asp:CommandField ShowSelectButton="True" />
                                
                                <asp:BoundField DataField="Codigo" HeaderText="Código">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="Categoria" HeaderText="Categoría">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                <asp:TemplateField HeaderText="Imagen">
                                    <ItemTemplate>
                                        <img src='<%# Eval("Imagen") %>' alt="Imagen" style="max-width: 100px; max-height: 100px;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                                
                                <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:N2}">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:CheckBoxField DataField="Estado" HeaderText="Estado">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:CheckBoxField>

                            </Columns>

                        </asp:GridView>
                    </div>
                </div>

                
                <div id="crud-mensajes" class="tm-page-content">
                    <div class="tm-black-bg tm-contact-form-container tm-align-left">
                        <!-- Formulario de Mensajes -->
                        <div class="tm-form-group">
                            <h4>MENSAJES</h4>
                            <asp:DropDownList ID="DropDownList4" class="tm-form-control" runat="server" placeholder="Categoría" BackColor="#009999"></asp:DropDownList>
                            <br />
                            <asp:TextBox ID="TextBox16" class="tm-form-control" runat="server" placeholder="ID_Producto"></asp:TextBox>
                            <asp:TextBox ID="TextBox17" class="tm-form-control" placeholder="Imagen" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox18" class="tm-form-control" placeholder="Nombre" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox19" class="tm-form-control" placeholder="Descripción" runat="server"></asp:TextBox>
                            <br />
                            <asp:TextBox ID="TextBox20" class="tm-form-control" placeholder="Precio" runat="server"></asp:TextBox>
                            <br />
                            <asp:Label ID="Label4" runat="server" class="tm-form-control" Text="Activo?"></asp:Label>
                            <asp:CheckBox ID="CheckBox4" class="tm-form-control" runat="server" Checked="true" />
                            <br />
                            <asp:Button ID="Button13" class="tm-btn-primary prod-button" runat="server" Text="Agregar" />
                            <asp:Button ID="Button14" runat="server" class="tm-btn-primary prod-button" Text="Modificar" />
                            <asp:Button ID="Button15" class="tm-btn-primary prod-button" runat="server" Text="Eliminar" />
                            <asp:Button ID="Button16" runat="server" class="tm-btn-primary prod-button" Text="Buscar ID" />
                        </div>
                    </div>
                    <div class="tm-tab-content tm-black-bg" id="grid-container-mensajes">
                        <h4>MENSAJES</h4>
                        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView5_SelectedIndexChanged">
                            
                            <Columns>
                            
                                <asp:CommandField ShowSelectButton="True" />
                                
                                <asp:BoundField DataField="Codigo" HeaderText="Código">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="Categoria" HeaderText="Categoría">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                <asp:TemplateField HeaderText="Imagen">
                                    <ItemTemplate>
                                        <img src='<%# Eval("Imagen") %>' alt="Imagen" style="max-width: 100px; max-height: 100px;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                                
                                <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:N2}">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:CheckBoxField DataField="Estado" HeaderText="Estado">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:CheckBoxField>

                            </Columns>

                        </asp:GridView>
                    </div>
                </div>



            </div>



            <!-- Background video -->
            <div class="tm-video-wrapper">
                <i id="tm-video-control-button" class="fas fa-pause"></i>
                <video autoplay="" muted="" loop="" id="tm-video">
                    <source src="video/wave-cafe-video-bg.mp4" type="video/mp4" />
                </video>
            </div>

            <script src="js/jquery-3.4.1.min.js"></script>
            
            <script src="./Scripts/backOffice.js"></script>
        </div>




    </form>
</body>
</html>

