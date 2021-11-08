<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contactenos.aspx.cs" Inherits="TiendaVirtual_Manuailidades_SandovalPablo.Contactenos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Estilos/estilocontact.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mi Huella - Contactenos</title>
</head>
<body>
    <form method="post" id="Inicio_Form" runat="server">
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
    <!-- seccion de imagenes -->
               <section>
            <div class="contenedor">
                <h1>¡Siguenos!</h1>
                <h2>Facebook: <asp:HyperLink ID="HyperLink2" CssClass="enlaces" runat="server" NavigateUrl="#">@MiHuellaMosaicos</asp:HyperLink>
                </h2>
                <h2>
                Instagram: <asp:HyperLink ID="HyperLink3" CssClass="enlaces" runat="server" NavigateUrl="#">@MiHuellaMosaicos</asp:HyperLink>
                </h2>
                <h3>¡Envianos tu Comentario o Sugerencia para mejorar!</h3>
                <asp:TextBox ID="txt_comentario" CssClass="comentario" runat="server" Height="105px" TextMode="MultiLine" Width="780px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                <br />
                <asp:Button ID="Button1" CssClass="botonenviar" runat="server" Text="ENVIAR" Width="135px" Height="52px" OnClick="Button1_Click" />
                <br />
                                <br />
                <asp:Label ID="Label1" runat="server" Text="Gracias por su comentario!" Visible="False"></asp:Label>
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
