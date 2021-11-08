using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

namespace TiendaVirtual_Manuailidades_SandovalPablo
{
    public partial class Productos : System.Web.UI.Page
    {
        double total = 0;
        DataTable carrito_tabla = new DataTable();
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["TiendaVirtualMiHuellaConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //llenarGridView();
                llenarDataList();
                crearcarrito();
                Cargarddp();

            }
            if (Session["usuariologeado"] != null)
            {
                string usuariologeado = Session["usuariologeado"].ToString();
                LinkButton1.Visible = true;
                hl_login.Visible = false;
                hl_registro.Visible = false;
                lbl_titulo.Text = "Bienvenido " + usuariologeado + "!";
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
                lbl_titulo.Text = "Bienvenido!";
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

        public void crearcarrito()
        {
            carrito_tabla.Columns.Add("Nombre", System.Type.GetType("System.String"));
            carrito_tabla.Columns.Add("Precio", System.Type.GetType("System.Double"));
            Session["pedido"] = carrito_tabla;
        }
        public void AgregarItem(string nombre,double precio)
        {
            carrito_tabla = (DataTable)Session["pedido"];
            DataRow fila = carrito_tabla.NewRow();
            fila[0] = nombre;
            fila[1] = precio;
            carrito_tabla.Rows.Add(fila);
            Session["pedido"] = carrito_tabla;
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

        public void llenarDataList()
        {

            try
            {
                SqlDataAdapter da = new SqlDataAdapter("spGetProductList", conexion);
                DataSet ds = new DataSet();
                conexion.Open();
                da.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
            finally
            {
                conexion.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (Session["usuariologeado"] != null)
            {
                DataList1.SelectedIndex = e.Item.ItemIndex;
                Panel1.Visible = true;
                string nombre = "";
                double precio = 0;
                if (e.CommandName == "Seleccionar")
                {
                    DataList1.SelectedIndex = e.Item.ItemIndex;
                    nombre = ((Label)DataList1.SelectedItem.FindControl("lblnombre")).Text.ToString();
                    precio = double.Parse(((Label)this.DataList1.SelectedItem.FindControl("lblprecio")).Text);
                    AgregarItem(nombre,precio);
                }

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = (DataTable)Session["pedido"];
            dt.Rows.RemoveAt(e.RowIndex);

            //Guardo los nuevos valores
            Session["data"] = dt;

            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
            {
                Panel1.Visible = false;
            }

        }

        protected void btn_Siguiente_Click(object sender, EventArgs e)
        {
            Response.Redirect("MetodoPago.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (!string.IsNullOrEmpty(e.Row.Cells[2].Text))
                    total += Convert.ToDouble(e.Row.Cells[2].Text);
            }
            Session["total_pagar"] = total.ToString();
            lbl_total.Text = "Total: $" + total.ToString();
        }

        protected void ddlCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!ddlCategorias.SelectedItem.Value.Equals("0"))
            {
                try
                {
                    conexion.Open();
                    string consulta= "SELECT p.nombre,p.descripcion,precio,imagen FROM producto p inner join tpo_Producto t on t.id_tpoProd=p.id_tpoProd where t.nombre=@nombre";
                    SqlCommand comando = new SqlCommand(consulta,conexion);
                    comando.Parameters.AddWithValue("@nombre", ddlCategorias.SelectedItem.Text);
                    SqlDataReader sdr = comando.ExecuteReader();
                    /*SqlDataAdapter da = new SqlDataAdapter(consulta, conexion);
                    DataSet ds = new DataSet();
                    conexion.Open();
                    da.Fill(sdr);*/
                    DataList1.DataSource = sdr;
                    DataList1.DataBind();
                }
                finally
                {
                    conexion.Close();
                }
            }
            else
            {
                llenarDataList();
            }


        }
    }
    }


