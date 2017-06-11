using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditVisiterMessageDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindVisiterMessageRptr();
        }
    }

    private void BindVisiterMessageRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblContact", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrVisiterMessageDetails.DataSource = dt;
                    rptrVisiterMessageDetails.DataBind();
                }

            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Id"] == string.Empty)
        {
            Response.Redirect("VisiterMessageDetails.aspx");
        }

        if (txtUserName.Text == string.Empty || txtEmail.Text == string.Empty || txtMobileNo.Text== string.Empty || txtMessage.Text == string.Empty )
        {
            lblMessage2.Text = "all the fields are required";
            lblMessage2.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            string Id = Request.QueryString["Id"];
            string CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_VisiterMessageUpdateDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramUpdateUserName = new SqlParameter()
                {
                    ParameterName = "@UserName",
                    Value = txtUserName.Text
                };
                cmd.Parameters.Add(paramUpdateUserName);
                SqlParameter paramUpdateMessage = new SqlParameter()
                {
                    ParameterName = "@Message",
                    Value = txtMessage.Text
                };
                cmd.Parameters.Add(paramUpdateMessage);

                SqlParameter paramUpdateEmail = new SqlParameter()
                {
                    ParameterName = "@Email",
                    Value = txtEmail.Text
                };
                cmd.Parameters.Add(paramUpdateEmail);
                SqlParameter paramUpdateMobileNo = new SqlParameter()
                {
                    ParameterName = "@MobileNo",
                    Value = txtMobileNo.Text
                };
                cmd.Parameters.Add(paramUpdateMobileNo);
               
                SqlParameter paramUpdateId = new SqlParameter()
                {
                    ParameterName = "@Id",
                    Value = Request.QueryString["Id"]
                };
                cmd.Parameters.Add(paramUpdateId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("EditVisiterMessageDetails.aspx");
            }
        }

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Id"] == string.Empty)
        {
            Response.Redirect("VisiterMessageDetails.aspx");
        }
        else
        {
            string Id = Convert.ToInt16(((Button)sender).CommandArgument).ToString();
            string CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_VisiterMessageDeleteDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramId = new SqlParameter()
                {
                    ParameterName = "@Id",
                    Value = Id
                };
                cmd.Parameters.Add(paramId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("EditVisiterMessageDetails.aspx");
            }
        }
    }


}