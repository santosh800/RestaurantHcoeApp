using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btSend_Click(object sender, EventArgs e)
    {


        DateTime locatDateTime = DateTime.Now;
        if (txtUName.Text != "" && txtEmail.Text != "" && txtMobileNo.Text != "" && txtMessage.Text != "")
        {

            string cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "insert into tblContact values('" + txtUName.Text + "','" + txtEmail.Text + "','" + txtMobileNo.Text + "','" + txtMessage.Text +"','"+locatDateTime+"')";
                    SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblMsg.Text = "Message Send Succssfull";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                                

            }
        }

        else
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Message not send try Again..";
        }
    }
}
