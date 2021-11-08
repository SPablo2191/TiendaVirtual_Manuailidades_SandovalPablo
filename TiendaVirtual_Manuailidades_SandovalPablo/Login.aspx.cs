using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace TiendaVirtual_Manuailidades_SandovalPablo
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conexion = new SqlConnection("server=DESKTOP-VG0VGRD\\SQLEXPRESS ; database=TiendaVirtualMiHuella ; integrated security = true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuariologeado"] != null)
            {
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
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
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

        public void CerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuariologeado");
            LinkButton1.Visible = false;
            hl_login.Visible = true;
            hl_registro.Visible = true;
            Response.Redirect("Inicio.aspx");
        }
        protected void Ingresar_Click(object sender, EventArgs e)
        {
            try
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand("select nombre_usuario,contraseña from Usuario where nombre_usuario=@nombre_usuario and contraseña=@contraseña", conexion);
                comando.Parameters.AddWithValue("@nombre_usuario", NombreUsuario.Text);
                comando.Parameters.AddWithValue("@contraseña", ContraseñaUsuario.Text);
                SqlDataReader sdr = comando.ExecuteReader();
                if (sdr.Read())
                {
                    Session["usuariologeado"] = NombreUsuario.Text;
                    Response.Redirect("Inicio.aspx");
                }
                else
                {
                    Mensaje_Error.Visible = true;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}