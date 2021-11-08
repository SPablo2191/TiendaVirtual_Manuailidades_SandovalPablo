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
    public partial class ListaPedidos : System.Web.UI.Page
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["TiendaVirtualMiHuellaConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuariologeado"] != null)
            {
                if (!IsPostBack)
                {
                    llenargv();
                    Label2.Text = "Total de Pedidos No entregados: " + cantidadPedidos().ToString();
                }
                string usuariologeado = Session["usuariologeado"].ToString();
                LinkButton1.Visible = true;
                hl_login.Visible = false;
                hl_registro.Visible = false;
                if (tipousuario(usuariologeado))
                {
                    hl_empleados.Visible = true;
                    hl_listaproductos.Visible = true;
                    hl_pedidos.Visible = true;
                    hl_informacion.Visible = false;
                    hl_contactenos.Visible = false;
                }
                else
                {
                    hl_comprasrealizadas.Visible = true;

                }

            }
            else
            {
                Response.Redirect("Inicio.aspx");

            }
        }
        public int cantidadPedidos()
        {
            int totalfactura = 0;
            string consulta = "select count(*) from factura where estado='no entregado'";
            try
            {
                this.conexion.Open();
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@nombre_usuario", Session["usuariologeado"].ToString());
                SqlDataReader sdr = comando.ExecuteReader();
                if (sdr.Read())
                {
                    totalfactura = sdr.GetInt32(0);
                }
            }
            finally
            {
                conexion.Close();
            }
            return totalfactura;

        }

        public void llenargv()
        {
            try
            {
                conexion.Open();
                SqlCommand consulta = new SqlCommand("select id_factura,f.descripcion,total,f.nombre_usuario,m.descripcion as 'Modo de Pago',t.descripcion as 'Tipo de Envio',estado,case when t.descripcion = 'Envio a domicilio' then u.direccion else null end as 'Direccion' from factura f inner join ModoDePago m on f.modo_pago = m.id_mp inner join tpo_Envio t on f.id_tpoenvio = t.id_tpoEnvio inner join Usuario u on f.nombre_usuario = u.nombre_usuario", conexion);
                SqlDataAdapter da = new SqlDataAdapter(consulta);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            finally
            {
                conexion.Close();
            }
        }
        public Boolean tipousuario(string usuariologeado)
        {
            ConexionBDD coon = new ConexionBDD();
            string aux = coon.Consulta(usuariologeado, "select tpo_usuario from Usuario where nombre_usuario=");
            if (aux.Equals("Administrador") || aux.Equals("Empleado"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public void CerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuariologeado");
            LinkButton1.Visible = false;
            hl_login.Visible = true;
            hl_registro.Visible = true;
            Response.Redirect("Inicio.aspx");
        }
        public int ConsultaCant(string nombre, string consulta)
        {
            try
            {
                //evaluar si el usuario esta en la bdd
                conexion.Open();
                consulta = consulta + "@nombre";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@nombre", nombre);
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            if (row != null)
            {
                GridViewRow gr = GridView1.SelectedRow;
                int nro_factura = Convert.ToInt32(gr.Cells[1].Text);
                string consulta = "update factura set estado='entregado' where id_factura=";
                DataTable dt = new DataTable();
                try
                {
                    //evaluar si el usuario esta en la bdd
                    conexion.Open();
                    consulta = consulta + "@id_factura";
                    SqlCommand comando = new SqlCommand(consulta, conexion);
                    comando.Parameters.AddWithValue("@id_factura",nro_factura);
                    comando.ExecuteNonQuery();

                }
                catch (Exception)
                {
                    throw;
                }
                finally
                {
                    conexion.Close();
                }
                Page.Response.Redirect(Page.Request.Url.ToString(), true);






            }
        }

            protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}