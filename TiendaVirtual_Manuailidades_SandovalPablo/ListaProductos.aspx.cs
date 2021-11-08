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
    public partial class ListaProductos : System.Web.UI.Page
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
                    CargarddpCategorias();
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
                    Panel_botones.Visible = true;
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
                SqlCommand consulta = new SqlCommand("select p.id_producto,p.nombre,p.precio,p.cantidad,t.nombre as 'Tipo de Producto' from producto p inner join tpo_Producto t on p.id_tpoProd=t.id_tpoProd", conexion);
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
        public void CargarddpCategorias()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("select nombre from tpo_Producto"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conexion;
                    conexion.Open();
                    ddlCategorias.DataSource = cmd.ExecuteReader();
                    ddlCategorias.DataTextField = "nombre";
                    ddlCategorias.DataBind();
                }
            }
            finally
            {
                conexion.Close();
            }


        }

    public void Cargarddp(string consulta,string columna,DropDownList dropDownList1)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand(consulta))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conexion;
                    conexion.Open();
                    DropDownList1.DataSource = cmd.ExecuteReader();
                    DropDownList1.DataTextField = columna;
                    DropDownList1.DataBind();
                }
            }
            finally
            {
                conexion.Close();
            }


        }
        public void CargarddpNuevo()
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("select nombre from tpo_Producto"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conexion;
                    conexion.Open();
                    DropDownList2.DataSource = cmd.ExecuteReader();
                    DropDownList2.DataTextField = "nombre";
                    DropDownList2.DataBind();
                }
            }
            finally
            {
                conexion.Close();
            }


        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            //Panel_eliminar.Visible = false;
            Panel_nuevo.Visible = false;
            Cargarddp("select nombre from producto", "nombre",DropDownList1);
            Panel_cantidad.Visible = true;

        }

        protected void Btn_nuevo_Click(object sender, EventArgs e)
        {
            //Panel_eliminar.Visible = false;
            Panel_nuevo.Visible = true;
            Panel_cantidad.Visible = false;
            CargarddpNuevo();


        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            //Panel_eliminar.Visible = true;
            Panel_nuevo.Visible = false;
            Panel_cantidad.Visible = false;
            //CargarddpEliminar();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int cantidadfinal = 0;
            if (!DropDownList1.SelectedItem.Value.Equals("0") && !cantidad.Text.Equals(""))
            {
                string consulta = "update producto set cantidad=@cantidad where nombre=";
                try
                {
                    conexion.Open();
                    SqlCommand comando = new SqlCommand("select cantidad from producto where nombre=@nombre", conexion);
                    comando.Parameters.AddWithValue("@nombre", DropDownList1.SelectedItem.Text);
                    SqlDataReader sdr = comando.ExecuteReader();
                    if (sdr.Read())
                    {
                        cantidadfinal = sdr.GetInt32(0);
                    }
                    sdr.Close();

                    consulta = consulta + "@nombre";
                    comando = new SqlCommand(consulta, conexion);
                    comando.Parameters.AddWithValue("@nombre", DropDownList1.SelectedItem.Text);
                    comando.Parameters.AddWithValue("@cantidad",Convert.ToInt32( cantidad.Text)+cantidadfinal);
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

        protected void Button6_Click(object sender, EventArgs e)
        {
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string consulta = " insert into producto(id_producto, nombre, descripcion, precio, imagen, id_tpoProd, cantidad) values(@id_producto, @nombre, @descripcion, @precio, @imagen, @id_tpoProd, @cantidad)";
            int idtp = 0;
            int id_prod = 0;
            try
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand("select id_tpoProd from tpo_Producto where nombre=@nombre", conexion);
                comando.Parameters.AddWithValue("@nombre", DropDownList2.SelectedItem.Text);
                SqlDataReader sdr = comando.ExecuteReader();
                if (sdr.Read())
                {
                    idtp = sdr.GetInt32(0);
                }
                sdr.Close();
                comando = new SqlCommand("select max(id_producto) from producto", conexion);
                sdr = comando.ExecuteReader();
                if (sdr.Read())
                {
                    id_prod = sdr.GetInt32(0)+1;
                }
                sdr.Close();
                comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@id_producto",id_prod);
                comando.Parameters.AddWithValue("@nombre", Tb_nombre.Text);
                comando.Parameters.AddWithValue("@descripcion", tb_descp.Text);
                comando.Parameters.AddWithValue("@precio", tb_precio.Text);
                comando.Parameters.AddWithValue("@imagen", tb_imagen.Text);
                comando.Parameters.AddWithValue("@id_tpoProd", idtp);
                comando.Parameters.AddWithValue("@cantidad", tb_cantidad.Text);
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

        protected void ddlCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!ddlCategorias.SelectedItem.Value.Equals("0"))
            {
                try
                {
                    conexion.Open();
                    string consulta = "select p.id_producto,p.nombre,p.precio,p.cantidad,t.nombre as 'Tipo de Producto' from producto p inner join tpo_Producto t on p.id_tpoProd=t.id_tpoProd where t.nombre=@nombre";
                    SqlCommand comando = new SqlCommand(consulta, conexion);
                    comando.Parameters.AddWithValue("@nombre", ddlCategorias.SelectedItem.Text);
                    SqlDataReader sdr = comando.ExecuteReader();
                    /*SqlDataAdapter da = new SqlDataAdapter(consulta, conexion);
                    DataSet ds = new DataSet();
                    conexion.Open();
                    da.Fill(sdr);*/
                    GridView1.DataSource = sdr;
                    GridView1.DataBind();

                }
                finally
                {
                    conexion.Close();
                }
            }
            else
            {
                llenargv();
            }

        }
    }
}