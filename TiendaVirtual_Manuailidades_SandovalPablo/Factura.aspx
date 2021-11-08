<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="TiendaVirtual_Manuailidades_SandovalPablo.Factura" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Estilos/StyleFactura.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mi Huella - Factura</title>
</head>
<body>
    <form method="post" id="Factura_Form" runat="server">
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
        <!-- Detalles factura-->
        <section>
            <div class="contenedor">        
                <!-- Detalles titulo-->
                <asp:Label ID="lbl_titulo" runat="server" Text="Factura"></asp:Label>
                <hr />
                                        <asp:Panel ID="Panel1" runat="server">

                <asp:Label ID="lbl_subtitulo" runat="server" Text="Detalles:"></asp:Label>
                                                <br />
                <asp:Label ID="lbl_tipoenvio" CssClass="datos" runat="server" ></asp:Label>                               
                <br />
                <asp:Label ID="lbl_tipopago" CssClass="datos" runat="server" ></asp:Label>
                                                <br />
                        <!-- Detalles Carrito-->
                <asp:Label ID="Label1" CssClass="datos" runat="server" Text="Lista de Productos a Comprar:"></asp:Label>
                <div>
                                    <asp:GridView ID="GridView1" CssClass="tabla-compras" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="16px" Width="597px">
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                </div>
                <asp:Label ID="lbl_monto" CssClass="datos" runat="server" Font-Size="X-Large" ></asp:Label>
                                        <!-- Detalles botones-->
                                <br />

                <asp:Button ID="bn_volver" CssClass="botones" runat="server" Text="VOLVER" BorderStyle="None" Width="152px" OnClick="bn_volver_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_comprar"  CssClass="botones" runat="server" Text="REALIZAR PEDIDO" BorderStyle="None" Width="177px" OnClick="btn_comprar_Click"  />
                                <br />
                &nbsp;&nbsp;&nbsp;
                                        </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <asp:Label ID="Label2" runat="server" Text="Muchas Gracias por su compra!"></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Se enviara a su correo electronico la factura de la compra."></asp:Label>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Correo:"></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Estimamos que su pedido llegue:"></asp:Label>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Button ID="Button1" CssClass="botones" runat="server" Text="SEGUIR COMPRANDO" BorderColor="#999999" OnClick="Button1_Click" />
                </asp:Panel>
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
