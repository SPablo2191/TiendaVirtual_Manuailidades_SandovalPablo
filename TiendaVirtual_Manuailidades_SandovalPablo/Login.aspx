<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TiendaVirtual_Manuailidades_SandovalPablo.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Estilos/StyleLogin.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mi Huella-Ingresar</title>
</head>
<body>
<form method="post" id="Login_Form" runat="server">

    <!-- encabezado -->
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
    <section>
            <div class="contenedor">
                <h1>Iniciar Sesión:</h1>
                    <div class="campo-entrada">
                        <asp:TextBox ID="NombreUsuario" runat="server" required Width="537px"></asp:TextBox>
                        <span></span>
                        <label>Nombre de usuario</label>


                    </div>
                    <div class="campo-entrada">
                        <asp:TextBox ID="ContraseñaUsuario" runat="server" required TextMode="Password" Width="537px"></asp:TextBox>
                        <span></span>
                        <label>Contraseña:</label>

                          
                    </div>
                    <a href="OlvidoContraseña.aspx">Olvidaste tu Contraseña?</a>
                    <br/>
                    <br/>
                    <div class="boton-centrado">
                        <asp:Button ID="Ingresar" runat="server" Text="Ingresar" OnClick="Ingresar_Click" />
                    </div>
                    <p>¿No tiene cuenta? <a href="Registro.aspx">Registrate Ahora</a></p>
                    <div class="label-advertencia">
                        <asp:Label ID="Mensaje_Error" runat="server" Text="Nombre de Usuario u Contraseña Incorrectos. Intente de nuevo" Visible="False"></asp:Label>
                    </div>
            </div>
        </section>
            <!-- pie de pagina -->
    <br />
    <footer id="pie">
        <hr /> 
        <p >Creado por Pablo Sandoval - Copyright &copy; 2021 aviso legal y politica de privacidad</p>

    </footer>
</form>

</body>
</html>
