<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="TiendaVirtual_Manuailidades_SandovalPablo.Productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Estilos/StyleProducto.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mi Huella-Producto</title>
    <style type="text/css">
        .auto-style3 {
            height: 101px;
            width: 195px;
        }
        .auto-style4 {
            width: 89px;
        }
        .auto-style6 {
            margin-left: 1px;
        }
        .auto-style7 {
            height: 101px;
            width: 344px;
        }
        .auto-style9 {
            width: 344px;
        }
        .auto-style10 {
            width: 195px;
            height: 47px;
        }
        .auto-style11 {
            width: 344px;
            height: 47px;
        }
        .auto-style12 {
            border-style: solid;
            border-color: inherit;
            border-width: 1px;
            box-shadow: 10px 10px 15px rgba(0,0,0,0.05);
            font-family: 'Cloud Light';
            cursor: pointer;
            outline: none;
            font-size: 18px;
            background: #CACFD2;
            border-radius: 15px;
            font-weight: lighter;
            cursor: pointer;
            outline: none;
        }
    </style>
    </head>
<body>
<form method="post" id="Prod_Form" runat="server">

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
    <!-- lista de productos -->
        <section>
        <div class="contenedor">
                    <asp:Label ID="lbl_titulo" runat="server"></asp:Label>
            <br />
                                                <asp:DropDownList ID="ddlCategorias" CssClass="ddp-estilo" runat="server" AppendDataBoundItems="True" Width="349px" AutoPostBack="True" OnSelectedIndexChanged="ddlCategorias_SelectedIndexChanged">
                                        <asp:ListItem Value="0">Todas Las Categorias</asp:ListItem>
                                    </asp:DropDownList>
<br />
                        <!-- panel-->
            <asp:Panel ID="Panel1" runat="server" CssClass="tabla-carrito" Visible="False">
                <asp:Label ID="Label4" runat="server" Text="Carrito de Compras"></asp:Label>
                <asp:GridView ID="GridView1" runat="server" CssClass="tabla-compras" OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound"   >
                    <Columns>
                        <asp:ButtonField  Text="Eliminar" CommandName="delete" HeaderText="Opciones" >
                        <ControlStyle CssClass="linklabel" />
                        </asp:ButtonField>
                    </Columns>
                </asp:GridView>
                <asp:Label ID="lbl_total" runat="server" ></asp:Label>
                                <br />

                <asp:Button ID="btn_Siguiente" CssClass="auto-style12" runat="server" Text="SIGUIENTE" Width="216px" BorderStyle="None" OnClick="btn_Siguiente_Click" />
            </asp:Panel>

            <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" CssClass="auto-style6" OnItemCommand="DataList1_ItemCommand">
                <AlternatingItemStyle BackColor="#CCCCCC" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    <table class="tabla">
                        <tr>
                            <td class="auto-style3">Nombre:</td>
                            <td class="auto-style7">
                                <asp:Label ID="lblnombre" runat="server" Text='<%# Eval("nombre") %>'></asp:Label>
                            </td>
                            <td rowspan="3">
                                <asp:Image ID="Image1" runat="server" width="215px" height="191px" ImageUrl='<%# "~/imagenes/"+Eval("imagen") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">Descripcion:</td>
                            <td class="auto-style9">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("descripcion") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Precio:</td>
                            <td class="auto-style11">
                                <asp:Label ID="lblprecio" runat="server" Text='<%# Eval("precio") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="btn_agregar" CssClass="boton-agregar" runat="server" Text="Agregar" Width="232px"  BorderColor="#D0D3D4" BorderStyle="None" ForeColor="#333333" Height="31px" OnClick="Button1_Click" CommandName="Seleccionar" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#1ABC98" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
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
