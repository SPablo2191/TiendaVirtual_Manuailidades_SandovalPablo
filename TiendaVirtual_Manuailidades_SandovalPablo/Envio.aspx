<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Envio.aspx.cs" Inherits="TiendaVirtual_Manuailidades_SandovalPablo.Envio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Estilos/EstiloEnvio.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mi Huella-Envio</title>
</head>
<body>
    <form method="post" id="Envio_Form" runat="server">
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
        <!--recuadro de tipos de envio-->
        <section>
            <div class="contenedor">
                <asp:Label ID="lbl_titulo" runat="server" Text="Detalles de Boleta:"></asp:Label>
                <hr />
                <asp:Label ID="Lbl_modo" runat="server" Text="Tipos de Retiro:"></asp:Label>
                                <br />

                <asp:DropDownList ID="DropDownList1" CssClass="ddp-estilo" runat="server" Width="433px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">Elija una opción de retiro</asp:ListItem>
                </asp:DropDownList>
                <br />
                &nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                <br />

                <asp:Button ID="bn_volver" CssClass="botones" runat="server" Text="VOLVER" BorderStyle="None" Width="152px" OnClick="Button1_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_siguiente"  CssClass="botones" runat="server" Text="SIGUIENTE" BorderStyle="None" Width="152px" OnClick="btn_siguiente_Click" />
                                <br />
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Visible="False" Text="Elija una opcion para continuar"></asp:Label>

                <br />
                <br />
                <br />

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
