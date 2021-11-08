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
    public partial class Envio : System.Web.UI.Page
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["TiendaVirtualMiHuellaConnectionString"].ToString());
        //string usuariologeado = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cargarddp();
            }
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
        public void Cargarddp()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("select * from tpo_Envio"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conexion;
                    conexion.Open();
                    DropDownList1.DataSource = cmd.ExecuteReader();
                    DropDownList1.DataTextField = "descripcion";
                    DropDownList1.DataBind();
                }
            }
            finally
            {
                conexion.Close();
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["tpo_envio"] = DropDownList1.SelectedItem.Text;
            if(DropDownList1.SelectedItem.Text.Equals("Envio a domicilio"))
            {
                Label1.Visible = true;
                ConexionBDD con = new ConexionBDD();
                string consulta = "select direccion from Usuario where nombre_usuario=";
                string aux = con.Consulta(Session["usuariologeado"].ToString(), consulta);
                Label1.Text = "Entregar en "+aux;
                Session["Destino"] = aux;
            }
            if(DropDownList1.SelectedItem.Text.Equals("Retirar pedido por el Local"))
            {
                Label1.Visible = true;
                Label1.Text = "Retirar en Caseros 1100";

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Remove("tpo_envio");
            Response.Redirect("MetodoPago.aspx");

        }

        protected void btn_siguiente_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value.Equals("0"))
            {
                Label2.Visible = true;
            }
            else
            {
                Response.Redirect("Factura.aspx");

            }

        }
    }
}