using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaVirtual_Manuailidades_SandovalPablo
{
    public partial class ListaEmpleados : System.Web.UI.Page
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
                    ConexionBDD coon = new ConexionBDD();
                    string aux = coon.Consulta(usuariologeado, "select tpo_usuario from Usuario where nombre_usuario=");

                    if (aux.Equals("Administrador"))
                    {
                        Panel2.Visible = true;
                    }
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
                SqlCommand consulta = new SqlCommand("select * from Usuario", conexion);
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ConexionBDD coon = new ConexionBDD();
            string aux = coon.Consulta(Session["usuariologeado"].ToString(), "select tpo_usuario from Usuario where nombre_usuario=");
            if (aux.Equals("Administrador"))
            {
                GridViewRow row = GridView1.SelectedRow;
                if (row != null)
                {
                    //Change the cell index(1) of column as per your design
                    //Get the Selected row cell values here
                    GridViewRow gr = GridView1.SelectedRow;
                    string nom_usuario = gr.Cells[1].Text;
                    string consulta = "update Usuario set tpo_usuario='Empleado' where nombre_usuario=";
                    try
                    {
                        //evaluar si el usuario esta en la bdd
                        conexion.Open();
                        consulta = consulta + "@nombre_usuario";
                        SqlCommand comando = new SqlCommand(consulta, conexion);
                        comando.Parameters.AddWithValue("@nombre_usuario", nom_usuario);
                        comando.ExecuteNonQuery();
                        Page.Response.Redirect(Page.Request.Url.ToString(), true);

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

            }
            else
            {
                Label1.Visible = true;
            }
        }
        public void Cargarddp()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("select nombre_usuario as 'empleados' from Usuario where tpo_usuario='Empleado' or tpo_usuario='Administrador'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conexion;
                    conexion.Open();
                    DropDownList1.DataSource = cmd.ExecuteReader();
                    DropDownList1.DataTextField = "empleados";
                    DropDownList1.DataBind();
                }
            }
            finally
            {
                conexion.Close();
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Cargarddp();
            Panel1.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (!DropDownList1.SelectedItem.Value.Equals("0") && !sueldo.Text.Equals(""))
            {
                string consulta = "update Usuario set sueldo=@sueldo where nombre_usuario=";
                try
                {
                    //evaluar si el usuario esta en la bdd
                    conexion.Open();
                    consulta = consulta + "@nombre_usuario";
                    SqlCommand comando = new SqlCommand(consulta, conexion);
                    comando.Parameters.AddWithValue("@nombre_usuario", DropDownList1.SelectedItem.Text);
                    comando.Parameters.AddWithValue("@sueldo", sueldo.Text);
                    comando.ExecuteNonQuery();
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);

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
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }
        public void CargarddpUsuario()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("select nombre_usuario as 'usuarios' from Usuario"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conexion;
                    conexion.Open();
                    DropDownList2.DataSource = cmd.ExecuteReader();
                    DropDownList2.DataTextField = "usuarios";
                    DropDownList2.DataBind();
                }
            }
            finally
            {
                conexion.Close();
            }


        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            CargarddpUsuario();
            Panel3.Visible = true;
        }
       public DataTable CrearDt(string nombre)
        {
            DataTable dt = new DataTable();
            try
            {
                conexion.Open();
                string query = "SELECT * FROM Usuario";
                SqlCommand cmd = new SqlCommand(query, conexion);
                dt.Load(cmd.ExecuteReader());
                conexion.Close();

            }
            finally
            {
                conexion.Close();
            }
            return dt;

        }
        public void crearTxT(DataTable dt,string nombre)
        {
            string ruta = "C:/Users/pablo/Desktop/informacion/" + nombre + ".txt";
            using (StreamWriter file = new StreamWriter(ruta, true))
            {
                foreach (DataRow row in dt.Rows)
                {
                    List<string> items = new List<string>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        items.Add(row[col.ColumnName].ToString());
            
        }
                    string linea = string.Join("|", items.ToArray());
                    file.WriteLine(linea);
                }
                file.WriteLine("|"+DateTime.Now);
            }
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (!DropDownList2.SelectedValue.Equals("0"))
            {
                string nombre = DropDownList2.SelectedItem.Text;
                DataTable infousuario = CrearDt(nombre);
                crearTxT(infousuario,nombre);
                Label3.Visible = true;
            }
        }
    }
}
