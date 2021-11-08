using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TiendaVirtual_Manuailidades_SandovalPablo
{
    public class ConexionBDD
    {
        SqlConnection conexion = new SqlConnection("server=DESKTOP-VG0VGRD\\SQLEXPRESS ; database=TiendaVirtualMiHuella ; integrated security = true");
        public string Consulta(string usuariologeado,string consulta)
        {
            try
            {
                //evaluar si el usuario esta en la bdd
                conexion.Open();
                consulta = consulta + "@nombre_usuario";
                SqlCommand comando = new SqlCommand(consulta, conexion);
                comando.Parameters.AddWithValue("@nombre_usuario", usuariologeado);
                SqlDataReader sdr = comando.ExecuteReader();
                if (sdr.Read())
                {
                    return sdr.GetString(0);

                }
                else
                {
                    return "No se encontro";
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
    }
}