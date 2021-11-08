using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace TiendaVirtual_Manuailidades_SandovalPablo
{
    public class Mail
    {
        public string emisor= "mihuellamosaicos@gmail.com";
        public string receptor;
        public string mensaje;
        public string asunto;

        public Mail(string receptor,string mensaje,string asunto)
        {
            this.receptor = receptor;
            this.mensaje = mensaje;
            this.asunto = asunto;
        }
        public void enviar_mensaje()
        {
            //armar el correo
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(this.emisor);
            msg.To.Add(this.receptor);
            msg.Subject = this.asunto;
            msg.Body = this.mensaje;
            msg.IsBodyHtml = true;
            //enviar el correo
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            System.Net.NetworkCredential NetworkCred = new
           System.Net.NetworkCredential();
            NetworkCred.UserName = "mihuellamosaicos@gmail.com";
            NetworkCred.Password = "belenypablo";
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Send(msg);
        }
    }
}