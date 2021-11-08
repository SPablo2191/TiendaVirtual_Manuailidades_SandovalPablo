<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TiendaVirtual_Manuailidades_SandovalPablo.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Estilos/StyleRegistro.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mi Huella-Nuevo Registro</title>
    <style type="text/css">
        .auto-style1 {
            width: 1255px;
        }
    </style>
</head>
<body>
<form method="post" id="Register_Form" runat="server">

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
    <!-- registro -->
        <section>
            <div class="contenedor">
                <h1>Nuevo Registro</h1>
                <asp:Panel ID="Panel1" runat="server">
                    <!-- NyA -->
                    <div class="campo-entrada">
                        <asp:TextBox ID="Tb_nya" runat="server" CssClass="TextBoxs" required></asp:TextBox>

                        <span></span>
                        <label>Nombre y apellido</label>
                    </div>
                    <!-- DNI -->
                    <div class="campo-entrada">
                        <asp:TextBox ID="tb_dni" runat="server" CssClass="TextBoxs" required TextMode="Number"></asp:TextBox>
                        <span></span>
                        <label>DNI</label>
                    </div>
                    <!-- nombre de usuario -->
                    <div class="campo-entrada">
                        <asp:TextBox ID="tb_username" runat="server" CssClass="TextBoxs" required Width="465px"></asp:TextBox>
                        <span></span>
                        <label>Nombre de Usuario</label>
                        <asp:Label ID="lbl_mensajeerrorUsuario" runat="server" Text="Nombre de usuario ya existente.Pruebe otro" Visible="False"></asp:Label>
                    </div>
                    <!-- Contraseña -->
                    <div class="campo-entrada">
                        <asp:TextBox ID="tb_password" runat="server" CssClass="TextBoxs" required TextMode="Password" Width="465px"></asp:TextBox>
                        <span></span>
                        <label>Contraseña</label>  
                    </div>
                    <!-- Contraseña confirmar -->
                    <div class="campo-entrada">
                        <asp:TextBox ID="tb_confirm_password" runat="server" CssClass="TextBoxs" required TextMode="Password" Width="465px"></asp:TextBox>
                        <span></span>
                        <label>Confirmar Contraseña</label>
                        <asp:Label ID="Lbl_Error_contraseña" runat="server" Text="Las contraseñas tienen que coincidir" Visible="False"></asp:Label>
                    </div>
                    <!-- Correo -->
                    <div class="campo-entrada">
                        <asp:TextBox ID="tb_email" runat="server" CssClass="TextBoxs" required Width="465px"></asp:TextBox>                   
                        <span></span>
                        <label>Correo Electronico</label>
                    <asp:RegularExpressionValidator ID="val_correo" runat="server" ErrorMessage="Correo Invalido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tb_email"></asp:RegularExpressionValidator>
                    </div>
                    <!-- Numero de Celular-->
                    <div class="campo-entrada">
                        <asp:TextBox ID="tb_celular" runat="server" CssClass="TextBoxs" required TextMode="Phone"></asp:TextBox>
                        <span></span>
                        <label>Numero de Celular</label>
                    </div>
                    <!-- Direccion -->
                    <div class="campo-entrada">
                        <asp:TextBox ID="tb_direccion" runat="server" CssClass="TextBoxs" required></asp:TextBox>
                        <span></span>
                        <label>Direccion</label>
                    </div>

                    <div class="boton-centrado">
                        <asp:Button ID="Registrarse" runat="server" Text="Registrarse" OnClick="Registrarse_Click" />
                    </div>
                    <hr class="auto-style1" />
                    <div class="box-label">
                        <asp:Label ID="Label1" runat="server" Text="Una vez halla sido registrado con exito, se procedera a enviar un mensaje de confirmacion a su correo" CssClass="mensaje-fin" ></asp:Label>
                        <br />
                                                <asp:Label ID="Lbl_correoerror" runat="server" Text="Correo Electronico ya registrado.Pruebe Con otro" CssClass="mensaje-fin" ForeColor="Crimson" Visible="False"></asp:Label>
                    </div>
                    </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <asp:Label ID="Label2" runat="server" Text="Ha sido registrado con exito! El correo de confirmacion le llegara en unos momentos.<br/> Bienvenido a Mi Huella-Mosaicos"></asp:Label>
                    <br />
                    <div class="boton-centrado"> 
                            <asp:Button ID="Button1"  runat="server" Text="Volver al inicio"  OnClick="Button1_Click"  />
                    </div>
                </asp:Panel>
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
