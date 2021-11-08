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
    public partial class ComprasRealizadas : System.Web.UI.Page
    {
        //string usuariologeado = "";
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["TiendaVirtualMiHuellaConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuariologeado"] != null)
            {
                if (!IsPostBack)
                {
                    llenargv();
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
        public void llenargv()
        {
            try
            {
                conexion.Open();
                SqlCommand consulta = new SqlCommand(string.Format("select nombre_prod,precio_prod,f.descripcion from LFactura l inner join factura f on l.id_factura=f.id_factura where f.nombre_usuario=@nombre_usuario"), conexion);
                consulta.Parameters.AddWithValue("@nombre_usuario", Session["usuariologeado"].ToString());
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
    }
}