using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows;

namespace TiendaVirtual_Manuailidades_SandovalPablo
{
    public partial class Registro : System.Web.UI.Page
    {
        SqlConnection conexion=new SqlConnection("server=DESKTOP-VG0VGRD\\SQLEXPRESS ; database=TiendaVirtualMiHuella ; integrated security = true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuariologeado"] != null)
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
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

        }
        public void CerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuariologeado");
            LinkButton1.Visible = false;
            hl_login.Visible = true;
            hl_registro.Visible = true;
            Response.Redirect("Inicio.aspx");
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
        protected void Registrarse_Click(object sender, EventArgs e)
        {
            if (tb_password.Text.Equals(tb_confirm_password.Text))
            {
                string consulta = "INSERT INTO  Usuario(nombre_usuario,nombre_apellido,DNI,email,contraseña,num_celular,direccion,sueldo,tpo_usuario) VALUES(@nombre_usuario,@nombre_apellido,@DNI,@email,@contraseña,@num_celular,@direccion,@sueldo,@tpo_usuario)";
                try
                {
                    //evaluar si el usuario esta en la bdd
                    conexion.Open();
                    SqlCommand comando = new SqlCommand("select nombre_usuario from Usuario where nombre_usuario=@nombre_usuario", conexion);
                    comando.Parameters.AddWithValue("@nombre_usuario", tb_username.Text);
                    SqlDataReader sdr = comando.ExecuteReader();
                    if (sdr.Read())
                    {
                        lbl_mensajeerrorUsuario.Visible = true;

                    }
                    else
                    {
                        sdr.Close();
                        comando.Parameters.Clear();
                         comando = new SqlCommand("select email from Usuario where email=@email", conexion);
                        comando.Parameters.AddWithValue("@email", tb_email.Text);
                         sdr = comando.ExecuteReader();
                        if (sdr.Read())
                        {
                            Lbl_correoerror.Visible = true;
                            tb_email.Text = "";
                        }
                        else
                        {
                            sdr.Close();
                            comando = new SqlCommand(consulta, conexion);
                            comando.Parameters.AddWithValue("@nombre_usuario", tb_username.Text);
                            comando.Parameters.AddWithValue("@nombre_apellido", Tb_nya.Text);
                            comando.Parameters.AddWithValue("@DNI", tb_dni.Text);
                            comando.Parameters.AddWithValue("@email", tb_email.Text);
                            comando.Parameters.AddWithValue("@contraseña", tb_password.Text);
                            comando.Parameters.AddWithValue("@num_celular", tb_celular.Text);
                            comando.Parameters.AddWithValue("@direccion", tb_direccion.Text);
                            comando.Parameters.AddWithValue("@sueldo", 0.0);
                            comando.Parameters.AddWithValue("@tpo_usuario", "Cliente");
                            comando.ExecuteNonQuery();
                            Mail correo_confirmacion = new Mail(tb_email.Text, "Su registro ha sido completado con exito! Bienvenido a Mi Huella Mosaicos, ya puede realizar pedidos por nuestra tienda virtual.", "Bienvenido a Mi Huella Mosaicos");
                            correo_confirmacion.enviar_mensaje();
                            conexion.Close();
                            Panel1.Visible = false;
                            Panel2.Visible = true;

                        }


                    }
                }
                catch (Exception)
                {
                    throw;
                }
            }
            else
            {
                Lbl_Error_contraseña.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");

        }
    }
}