<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaEmpleados.aspx.cs" Inherits="TiendaVirtual_Manuailidades_SandovalPablo.ListaEmpleados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Estilos/EstiloCR.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mi Huella - Lista de Usuarios</title>
</head>
<body>
    <form method="post" id="lemp_Form" runat="server">
    <header id="tituloPrincipal">
        <div>
            <h1>Mi Huella Mosaicos</h1>
            <h2>Artesanías</h2>
        </div>
    </header>
<nav>
            <ul>
                <!-- inicio -->
                <li>
                    <asp:HyperLink ID="hl_inicio" runat="server" NavigateUrl="Inicio.aspx">Inicio</asp:HyperLink>
                </li>
                <!-- registro -->
                <li>
                    <asp:HyperLink ID="hl_registro" runat="server" NavigateUrl="Registro.aspx">Registrarse</asp:HyperLink>

                </li>
                <!-- login -->
                <li>
                    <asp:HyperLink ID="hl_login" runat="server" NavigateUrl="Login.aspx">Ingresar</asp:HyperLink>

                </li>
                <!-- compra -->
                <li>
                    <asp:HyperLink ID="hl_productos" runat="server" NavigateUrl="Productos.aspx">Productos</asp:HyperLink>

                </li>
                <!-- acerca de -->
                <li>
                    <asp:HyperLink ID="hl_informacion" runat="server" NavigateUrl="Informacion.aspx">Sobre Nosotros</asp:HyperLink>
                </li>
                <!-- contacto -->
                <li>
                    <asp:HyperLink ID="hl_contactenos" runat="server" NavigateUrl="Contactenos.aspx">Contactenos</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Productos.aspx" Visible="False">Lista de productos</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hl_comprasrealizadas" runat="server" NavigateUrl="ComprasRealizadas.aspx" Visible="False">Compras Realizadas</asp:HyperLink>
                </li>
                                <li>
                    <asp:HyperLink ID="hl_empleados" runat="server" NavigateUrl="ListaEmpleados.aspx" Visible="False">Lista de Usuarios</asp:HyperLink>
                </li>
                                <li>
                    <asp:HyperLink ID="hl_listaproductos" runat="server" NavigateUrl="ListaProductos.aspx" Visible="False">Lista de Productos</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hl_pedidos" runat="server" NavigateUrl="ListaPedidos.aspx" Visible="False">Lista de Pedidos</asp:HyperLink>
                </li>
                <li>
                    <asp:LinkButton ID="LinkButton1" runat="server" Visible="False" OnClick="CerrarSesion_Click">Cerrar Sesión</asp:LinkButton>
                </li>

            </ul>
        </nav>
    <!-- seccion de empleados -->
               <section>
            <div class="contenedor">

                <h1>Lista de Usuarios:</h1>
                            <div class="grid">
                                                <asp:Label ID="Label2" runat="server" Text="Para convertir un usuario en 'empleado' realize doble click en el boton 'Convertir en Empleado' en el respectivo usuario."></asp:Label>

                                    <asp:GridView ID="GridView1" CssClass="tabla-compras" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="16px" Width="789px" OnRowCommand="GridView1_RowCommand">
                                        <Columns>
                                            <asp:ButtonField HeaderText="Opciones" Text="Convertir en Empleado" CommandName="select" >
                                            <ControlStyle CssClass="linklabel" />
                                            </asp:ButtonField>
                                        </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="center" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="No tiene Acceso a dicha funcion" ForeColor="Crimson" Visible="False"></asp:Label>
                                <br />
                                                                <asp:Button ID="Button3" runat="server" CssClass="botones" Text="Obtener informacion de un usuario" Width="315px" OnClick="Button3_Click"  />

                                <asp:Panel ID="Panel2" runat="server" Visible="False">
                                <asp:Button ID="Button1" runat="server" CssClass="botones" Text="Añadir Sueldo al empleado" Width="315px" OnClick="Button1_Click" />

                                    </asp:Panel>
                                <asp:Panel ID="Panel3" runat="server" Visible="False">
                                                                        <asp:DropDownList ID="DropDownList2" CssClass="ddp-estilo" runat="server" AppendDataBoundItems="True" Width="349px">
                                        <asp:ListItem Value="0">Seleccione usuario al cual quiera generar un txt</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                                             <asp:Button ID="Button4" runat="server" CssClass="botones" Text="Descargar Informacion" Width="249px" OnClick="Button4_Click" />
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text="Informacion Descargada Con exito!" Visible="False"></asp:Label>

                                </asp:Panel>
                                <asp:Panel ID="Panel1" runat="server" Visible="False">
                                    <asp:DropDownList ID="DropDownList1" CssClass="ddp-estilo" runat="server" AppendDataBoundItems="True" Width="349px">
                                        <asp:ListItem Value="0">Seleccione empleado al cual desee asignar un sueldo</asp:ListItem>
                                    </asp:DropDownList>
                        <div class="campo-entrada">
                        <asp:TextBox ID="sueldo" CssClass="TextBoxs" runat="server" required></asp:TextBox>
                        <span></span>
                        <label>Ingrese Sueldo a cargar</label>
                         </div>
                         <asp:Button ID="Button2" runat="server" CssClass="botones" Text="Cargar sueldo" Width="249px" OnClick="Button2_Click" />




                                </asp:Panel>
                </div>

            </div>
        </section>

    </form>
    <!-- pie de pagina -->
    <br />
    <footer id="pie">
        <hr /> 
        <p >Creado por Pablo Sandoval - Copyright &copy; 2021 aviso legal y politica de privacidad</p>

    </footer>
</body>
</html>
