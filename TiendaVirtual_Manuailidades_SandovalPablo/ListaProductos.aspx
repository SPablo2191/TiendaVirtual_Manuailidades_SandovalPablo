<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaProductos.aspx.cs" Inherits="TiendaVirtual_Manuailidades_SandovalPablo.ListaProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Estilos/EstiloCR.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mi Huella- Lista de Productos</title>
</head>
<body>
    <form method="post" id="lprod_Form" runat="server">
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
                <h1>Lista de Productos:</h1>
                            <br />
                                                <asp:DropDownList ID="ddlCategorias" CssClass="ddp-estilo" runat="server" AppendDataBoundItems="True" Width="349px" AutoPostBack="True" OnSelectedIndexChanged="ddlCategorias_SelectedIndexChanged">
                                        <asp:ListItem Value="0">Todas Las Categorias</asp:ListItem>
                                    </asp:DropDownList>
<br />

                            <div class="grid">
                                    <asp:GridView ID="GridView1" CssClass="tabla-compras" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="16px" Width="789px">
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
                </div>
                                <br />
                <!--panel de botones-->
                                <asp:Panel ID="Panel_botones" runat="server" Visible="False">
                                <asp:Button ID="Btn_nuevo" runat="server" CssClass="botones" Text="Añadir Nuevo Producto" Width="264px" OnClick="Btn_nuevo_Click"  />
                                <asp:Button ID="btn_agregar" runat="server" CssClass="botones" Text="Añadir Producto Existente" Width="264px" OnClick="Button1_Click" />
                                   <!-- <asp:Button ID="btn_eliminar" runat="server" CssClass="botones" Text="Eliminar producto" Width="264px" OnClick="btn_eliminar_Click" />-->
                                    </asp:Panel>
                <!--panel añadir nuevo producto-->
                <asp:Panel ID="Panel_nuevo" runat="server" Visible="False">
                                        <!-- nombre del producto -->
                    <div class="campo-entrada" style="left: 0px; top: 0px; width: 661px">
                        <asp:TextBox ID="Tb_nombre" runat="server" CssClass="TextBoxs" required></asp:TextBox>

                        <span></span>
                        <label>Nombre del producto</label>
                    </div>
                                        <!-- descripcion -->
                    <div class="campo-entrada" style="left: 0px; top: 0px; width: 661px">
                        <asp:TextBox ID="tb_descp" runat="server" CssClass="TextBoxs" required></asp:TextBox>

                        <span></span>
                        <label>Descripcion del producto</label>
                    </div>
                                                            <!--precio-->
                    <div class="campo-entrada" style="left: 0px; top: 0px; width: 661px">
                        <asp:TextBox ID="tb_precio" runat="server" CssClass="TextBoxs" required TextMode="Number"></asp:TextBox>

                        <span></span>
                        <label>Precio del producto</label>
                    </div>
                                                            <!-- imagen -->
                    <div class="campo-entrada" style="left: 0px; top: 0px; width: 661px">
                        <asp:TextBox ID="tb_imagen" runat="server" CssClass="TextBoxs" required></asp:TextBox>

                        <span></span>
                        <label>Copiar nombre de la imagen con su formato (.jpg,.jpeg,etc)</label>
                    </div>
                                                            <!-- tipo de producto -->
                                    <asp:DropDownList ID="DropDownList2" CssClass="ddp-estilo" runat="server" AppendDataBoundItems="True" Width="349px">
                                        <asp:ListItem Value="0">Seleccione categoria del producto</asp:ListItem>
                                    </asp:DropDownList>
                                                                                <!-- cantidad -->
                    <div class="campo-entrada" style="left: 0px; top: 0px; width: 661px">
                        <asp:TextBox ID="tb_cantidad" runat="server" CssClass="TextBoxs" required TextMode="Number"></asp:TextBox>

                        <span></span>
                        <label>Cantidad del producto</label>
                    </div>
                                                        <asp:Button ID="Button5" runat="server" CssClass="botones" Text="INGRESAR PRODUCTO" Width="264px" OnClick="Button5_Click" />

                </asp:Panel>
                                                                                                <!-- AÑADIR PRODUCTO EXISTENTE -->

               <asp:Panel ID="Panel_cantidad" runat="server" Visible="False">
                                    <asp:DropDownList ID="DropDownList1" CssClass="ddp-estilo" runat="server" AppendDataBoundItems="True" Width="349px">
                                        <asp:ListItem Value="0">Seleccione Producto al que desea aumentar su cantidad</asp:ListItem>
                                    </asp:DropDownList>
                        <div class="campo-entrada" style="left: 0px; top: 0px; width: 661px">
                        <asp:TextBox ID="cantidad" CssClass="TextBoxs" runat="server" required TextMode="Number"></asp:TextBox>
                        <span></span>
                        <label>Ingrese cantidad a añadir de la actual</label>
                         </div>
                         <asp:Button ID="Button2" runat="server" CssClass="botones" Text="Cargar Cantidad" Width="249px" OnClick="Button2_Click"  />
                                </asp:Panel>
                                                                             <!-- eliminar producto -->
              <!--  <asp:Panel ID="Panel_eliminar" runat="server" Visible="False">
                                                        <asp:DropDownList ID="DropDownList3" CssClass="ddp-estilo" runat="server" AppendDataBoundItems="True" Width="349px">
                                        <asp:ListItem Value="0">Seleccione Producto al que desea eliminar</asp:ListItem>
                                    </asp:DropDownList>
                    <br />
                                             <asp:Button ID="Button6" runat="server" CssClass="botones" Text="Eliminar Producto" Width="249px" OnClick="Button6_Click"  />

                </asp:Panel>-->

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
