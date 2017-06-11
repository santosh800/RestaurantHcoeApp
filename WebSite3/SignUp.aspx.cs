using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btSubmit_Click(object sender, EventArgs e)
    {
        if (tbName.Text !="" && tbEmail.Text !="" && tbPass.Text !=""  && tbCPass.Text !="")
        {
            if (tbPass.Text == tbCPass.Text)
            {
                string cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "insert into Users values('" + tbUname.Text + "','" + tbPass.Text + "','" + tbEmail.Text + "','" + tbName.Text + "','U')";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Text = "Register Succssfull";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("~/SignIn.aspx");

                }
            }
            else
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Password not Match";
            }
        }
        else
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "All filds are Required";
        }


        }
        
    


}
