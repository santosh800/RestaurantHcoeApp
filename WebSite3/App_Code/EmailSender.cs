using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for EmailSender
/// </summary>
public static class EmailSender
{
   public static void SendEmail(string recepientEmail,string subject,string body)
    {

        using(MailMessage mailMessage=new MailMessage())
        {
           
            
                mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["Username"]);
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;
                mailMessage.To.Add(new MailAddress(recepientEmail));
                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                smtp.EnableSsl = true;
                System.Net.NetworkCredential networkCred = new System.Net.NetworkCredential();
                networkCred.UserName = ConfigurationManager.AppSettings["Username"];
                networkCred.Password = ConfigurationManager.AppSettings["Password"];
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = networkCred;
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
                smtp.Send(mailMessage);
           
           
            
               
            

        }
    }
}