<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OlvidoContraseña.aspx.cs" Inherits="TiendaVirtual_Manuailidades_SandovalPablo.OlvidoContraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Estilos/StyleContra.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mi Huella- Recuperar contraseña</title>
</head>
<body>
<form method="post" id="Contra_Form" runat="server">

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
    <div class="contenedor">
        <h1>Recuperar Contraseña:</h1>
        <asp:Panel ID="Panel1" runat="server">
                        <asp:Label ID="Label1" runat="server" Text="Si su correo electronico aparece en nuestra base de datos,podra establecer una nueva contraseña"></asp:Label>
            <div class="campo-entrada">
                        <asp:TextBox ID="txt_email" runat="server" CssClass="textos" required></asp:TextBox>
                        <span></span>
                        <label>Introduzca su correo electronico</label>


                    </div>
            <br />
                                <div class="boton-centrado">
                        <asp:Button ID="Button1" runat="server" Text="Comprobar" OnClick="Button1_Click"  />
                    </div>
                <asp:Label ID="lbl_error" runat="server" Text="correo electronico invalido. Intente nuevamente." ForeColor="Crimson" Visible="False"></asp:Label>

        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Visible="False">
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>

                        <div class="campo-entrada">
                        <asp:TextBox ID="TextBox1" CssClass="textos" runat="server" required TextMode="Password"></asp:TextBox>
                        <span></span>
                        <label>Introduzca nueva contraseña</label>


                    </div>
            <div class="campo-entrada">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="textos" required TextMode="Password"></asp:TextBox>
                        <span></span>
                        <label>Confirmar nueva Contraseña</label>
  


                    </div>
                                                          <div class="boton-centrado">
                        <asp:Button ID="Button2" runat="server" Text="Confirmar" OnClick="Button2_Click"    />
                    </div>
                            <asp:Label ID="Label5" runat="server" Text="Las contraseñas no coinciden. Intente nuevamente." ForeColor="Crimson" Visible="False"></asp:Label>

        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" Visible="False">
            <asp:Label ID="Label2" runat="server" Text="Se pudo Actuanilizar la contraseña con Exito!"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Se enviara un correo electronico para confirmar."></asp:Label>
            <br />
            <br />
                                                            <div class="boton-centrado">
                        <asp:Button ID="Button3" runat="server" Text="Volver al Inicio" OnClick="Button3_Click"  />
                    </div>

        </asp:Panel>
    </div>
            <!-- pie de pagina -->
    <br />
    <footer id="pie">
        <hr /> 
        <p >Creado por Pablo Sandoval - Copyright &copy; 2021 aviso legal y politica de privacidad</p>

    </footer>
</form>
</body>
</html>
