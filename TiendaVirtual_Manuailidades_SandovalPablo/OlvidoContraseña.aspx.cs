using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaVirtual_Manuailidades_SandovalPablo
{
    public partial class OlvidoContraseña : System.Web.UI.Page
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["TiendaVirtualMiHuellaConnectionString"].ToString());
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            ConexionBDD conn = new ConexionBDD();
            string nom_usuario=conn.Consulta(txt_email.Text, "select nombre_usuario from Usuario where email=");
            if(nom_usuario.Equals("No se encontro"))
            {
                lbl_error.Visible = true;
                this.txt_email.Text = "";
            }
            else
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
                Session["usuario_nom"] = nom_usuario;
                Label4.Text = "Bienvenido " + nom_usuario + "!";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals(TextBox2.Text))
            {
                string consulta = "update Usuario set contraseña=@contraseña where nombre_usuario=@nombre_usuario";
                try
                {
                    conexion.Open();
                    SqlCommand comando = new SqlCommand(consulta, conexion);
                    comando.Parameters.AddWithValue("@contraseña", TextBox1.Text);
                    comando.Parameters.AddWithValue("@nombre_usuario", Session["usuario_nom"].ToString());
                    comando.ExecuteNonQuery();
                }
                finally
                {
                    conexion.Close();
                }
                Panel2.Visible = false;
                Mail correo = new Mail(txt_email.Text, "Se pudo Actuanilizar la contraseña con Exito! <br/> Su nueva Contraseña es: " + TextBox1.Text, "Actualizacion de contraseña -  Mi Huella Mosaicos");
                correo.enviar_mensaje();
                Panel3.Visible = true;
            }
            else
            {
                Label5.Visible = true;
                TextBox1.Text = "";
                TextBox2.Text = "";

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session.Remove("usuario_nom");
            Response.Redirect("Inicio.aspx");
        }
    }
}