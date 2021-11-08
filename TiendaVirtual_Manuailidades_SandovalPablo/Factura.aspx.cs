using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaVirtual_Manuailidades_SandovalPablo
{
    public partial class Factura : System.Web.UI.Page
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["TiendaVirtualMiHuellaConnectionString"].ToString());
        //string usuariologeado = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["usuariologeado"] != null)
            {
                if (!IsPostBack)
                {
                    lbl_tipoenvio.Text = "Tipo de envio: " + Session["tpo_envio"].ToString();
                    lbl_tipopago.Text = "Metodo de Pago: " + Session["modopago"].ToString();
                    cargartablacarrito();
                    lbl_monto.Text ="Monto total a pagar: $"+ Session["total_pagar"].ToString();
                }
                string usuariologeado = Session["usuariologeado"].ToString();
                LinkButton1.Visible = true;
                hl_login.Visible = false;
                hl_registro.Visible = false;
                if (tipousuario(usuariologeado))
                {
                    hl_comprasrealizadas.Visible = true;
                }
                else
                {
                    hl_empleados.Visible = true;
                    hl_listaproductos.Visible = true;
                    hl_pedidos.Visible = true;
                    hl_informacion.Visible = false;
                    hl_contactenos.Visible = false;
                }
            }
            else
            {
                Response.Redirect("Inicio.aspx");
            }
        }
        public Boolean tipousuario(string usuariologeado)
        {
            ConexionBDD coon = new ConexionBDD();
            string aux = coon.Consulta(usuariologeado, "select tpo_usuario from Usuario where nombre_usuario=");
            if (aux.Equals("Cliente"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //GENERAR FACTURA CON LOS DATOS DE SESIONES GUARDADOS
        public void generarfactura()
        {
            string consulta = "INSERT INTO  factura(descripcion,nombre_usuario,modo_pago,id_tpoenvio,total,estado) values(@descripcion,@nombre_usuario,@modo_pago,@id_tpoenvio,@total,@estado)";
            DateTime datetime = DateTime.Now;
            Session["fechaCompra"] = datetime;
            int tpenvio = 0;
            int modpago = 0;
            try
            {
                this.conexion.Open();
                SqlCommand comando = new SqlCommand("select id_tpoEnvio from tpo_Envio where descripcion=@descripcion", conexion);
                comando.Parameters.AddWithValue("@descripcion", Session["tpo_envio"].ToString());
                SqlDataReader sdr = comando.ExecuteReader();
                if (sdr.Read())
                {
                    tpenvio = sdr.GetInt32(0);
                }
                sdr.Close();
                comando.Parameters.Clear();
                comando = new SqlCommand("select id_mp from ModoDePago where descripcion=@descripcion", conexion);
                comando.Parameters.AddWithValue("@descripcion", Session["modopago"].ToString());
                sdr = comando.ExecuteReader();
                if (sdr.Read())
                {
                    modpago = sdr.GetInt32(0);

                }
                sdr.Close();
                comando.Parameters.Clear();
                comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@descripcion", "Compra virtual realizada: "+datetime.ToString());
                comando.Parameters.AddWithValue("@nombre_usuario", Session["usuariologeado"].ToString());
                comando.Parameters.AddWithValue("@modo_pago", modpago);
                comando.Parameters.AddWithValue("@estado", "no entregado");
                comando.Parameters.AddWithValue("@total",Convert.ToDouble( Session["total_pagar"].ToString()));
                comando.Parameters.AddWithValue("@id_tpoenvio", tpenvio);
                comando.ExecuteNonQuery();
            }
            finally
            {
                conexion.Close();
            }

        }
        //cargar datos de la factura del usuario
        public int idfactura()
        {
            int idfactura = 0;
            string consulta = "select max(id_factura) from factura where nombre_usuario=@nombre_usuario";
            try
            {
                this.conexion.Open();
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@nombre_usuario", Session["usuariologeado"].ToString());
                SqlDataReader sdr = comando.ExecuteReader();
                if (sdr.Read())
                {
                    idfactura = sdr.GetInt32(0);
                }
            }
            finally
            {
                conexion.Close();
            }
            return idfactura;

        }
        public int ConsultaProducto(string nom_producto, string consulta)
        {
            try
            {
                //evaluar si el usuario esta en la bdd
                conexion.Open();
                consulta = consulta + "@nombre";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@nombre", nom_producto);
                SqlDataReader sdr = comando.ExecuteReader();
                if (sdr.Read())
                {
                    return sdr.GetInt32(0);

                }
                else
                {
                    return 0;
                }

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                conexion.Close();
            }
        }
        public void Actualizarcantidad(string consulta,int cantidad,string nombre)
        {
            try
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@nombre", nombre);
                comando.Parameters.AddWithValue("@cantidad", cantidad);
                comando.ExecuteNonQuery();
                comando.Parameters.Clear();
            }
            finally
            {
                conexion.Close();
            }

        }
        //generar lineas de factura por producto
        public void generarlinea_factura()
        {
            string consulta = "insert into LFactura(nombre_prod,precio_prod,id_factura,id_prod) values(@nombre_prod,@precio_prod,@id_factura,@id_prod)";
            //primero recuperamos el id de la factura que generamos
            int IDfactura = idfactura();
            //-----------------ahora obtener el nombre y el precio por producto------------------
            DataTable carrito_tabla = (DataTable)Session["pedido"];
            for (int i = 0; i < carrito_tabla.Rows.Count; i++)
            {
                string aux=carrito_tabla.Rows[i]["Nombre"].ToString();
                string consulta_producto = "select id_producto from producto where nombre=";
                int idprod = ConsultaProducto(aux,consulta_producto);
                //obtener cantidad actual del producto
                string consulta_cantidad = "select cantidad from producto where nombre=";
                int cantidad = ConsultaProducto(aux, consulta_cantidad)-1;
                //actualizar la cantidad del producto
                consulta_cantidad = "update producto set cantidad=@cantidad where nombre=@nombre";
                Actualizarcantidad(consulta_cantidad, cantidad, aux);
                try
                {
                    conexion.Open();
                    SqlCommand comando = new SqlCommand(consulta, conexion);
                    comando.Parameters.AddWithValue("@nombre_prod", aux);
                    comando.Parameters.AddWithValue("@precio_prod", carrito_tabla.Rows[i]["Precio"].ToString());
                    comando.Parameters.AddWithValue("@id_factura", IDfactura);
                    comando.Parameters.AddWithValue("@id_prod", idprod);
                    comando.ExecuteNonQuery();
                    comando.Parameters.Clear();
                }
                finally
                {
                    conexion.Close();
                }
            }

        }
        public void cargartablacarrito()
        {
            GridView1.DataSource = Session["pedido"];
            GridView1.DataBind();
        }
        public void CerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuariologeado");
            LinkButton1.Visible = false;
            hl_login.Visible = true;
            hl_registro.Visible = true;
            Response.Redirect("Inicio.aspx");
        }
        public string pedido_correo()
        {
            string auxi = "|Nombre del producto|precio|"+ "<br/>";
            DataTable carrito_tabla = (DataTable)Session["pedido"];
            for (int i = 0; i < carrito_tabla.Rows.Count; i++)
            {
                 auxi += carrito_tabla.Rows[i]["Nombre"].ToString() + "|"+ carrito_tabla.Rows[i]["Precio"].ToString() + "|" + "<br/>";
            }
            return auxi;
        }
        protected void btn_comprar_Click(object sender, EventArgs e)
        {
            ConexionBDD conn = new ConexionBDD();
            string correo_receptor=conn.Consulta(Session["usuariologeado"].ToString(), "select email from Usuario where nombre_usuario=");
            generarfactura();
            generarlinea_factura();
            Panel1.Visible = false;
            Panel2.Visible = true;
            Label6.Text = "Correo: " + correo_receptor;
            if(Session["tpo_envio"].ToString().Equals("Retirar pedido por el Local"))
            {
                Label4.Text = "Su/s producto/s lo estara esperando en nuestro local";
                Label5.Visible = false;
            }
            else
            {
                DateTime dt= (DateTime)Session["fechaCompra"];
                DateTime dt2=dt.AddDays(2);
                Label5.Text = dt2.ToString();
                Label5.Visible = true;
            }
            string mensaje = "Hola " + Session["usuariologeado"].ToString() + "!"+ "<br/>" + "Su pedido ha sido recibido con exito" +
                ""+ "<br/>" + pedido_correo() +""+
                    "<br/>" + "Fecha" + Session["fechaCompra"].ToString();
            Mail correo = new Mail(correo_receptor,mensaje, "Compra Realizada - Mi Huella Mosaicos");
            correo.enviar_mensaje();
        }

        protected void bn_volver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Envio.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Remove("total_pagar");
            Session.Remove("pedido");
            Session.Remove("modopago");
            Session.Remove("tpo_envio");
            Response.Redirect("Productos.aspx");
        }
    }
    }