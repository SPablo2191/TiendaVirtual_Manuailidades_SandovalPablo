using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace TiendaVirtual_Manuailidades_SandovalPablo
{
    /// <summary>
    /// Descripción breve de MostrarFoto
    /// </summary>
    public class MostrarFoto : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var codigo=context.Request.QueryString["Codigo"];

            var cn = new SqlConnection(@"Data Source = DESKTOP - VG0VGRD\SQLEXPRESS; Initial Catalog = TiendaVirtualMiHuella; Integrated Security = True");
            var cmd = new SqlCommand("select nombre,descripcion,precio,imagen from producto where imagen=" + codigo, cn);
            cn.Open();
            byte[] foto = (byte[])cmd.ExecuteScalar();
            cn.Close();

            context.Response.ContentType = "img/jpg";
            context.Response.OutputStream.Write(foto,78,foto.Length-78);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}