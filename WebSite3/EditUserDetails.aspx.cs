using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditUserDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUserRptr();
        }
    }

    private void BindUserRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from Users", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrUserDetails.DataSource = dt;
                    rptrUserDetails.DataBind();
                }

            }
        }
    }



    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Uid"] == string.Empty)
        {
            Response.Redirect("UserDetails.aspx");
        }

        if (txtUserName.Text == string.Empty || txtEmail.Text == string.Empty || txtName.Text == string.Empty || txtPassword.Text == string.Empty || txtUserType.Text == string.Empty)
        {
            lblMessage.Text = "all the fields are required";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            string Uid = Request.QueryString["Uid"];
            string CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_UserUpdateDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramUpdateUserName = new SqlParameter()
                {
                    ParameterName = "@UserName",
                    Value = txtUserName.Text
                };
                cmd.Parameters.Add(paramUpdateUserName);
                SqlParameter paramUpdatePassword = new SqlParameter()
                {
                    ParameterName = "@Password",
                    Value = txtPassword.Text
                };
                cmd.Parameters.Add(paramUpdatePassword);

                SqlParameter paramUpdateEmail = new SqlParameter()
                {
                    ParameterName = "@Email",
                    Value = txtEmail.Text
                };
                cmd.Parameters.Add(paramUpdateEmail);
                SqlParameter paramUpdateNamae = new SqlParameter()
                {
                    ParameterName = "@Name",
                    Value = txtName.Text
                };
                cmd.Parameters.Add(paramUpdateNamae);
                SqlParameter paramUpdateUserType = new SqlParameter()
                {
                    ParameterName = "@UserType",
                    Value = txtUserType.Text.ToUpper()
                };
                cmd.Parameters.Add(paramUpdateUserType);
                SqlParameter paramUpdateUid = new SqlParameter()
                {
                    ParameterName = "@Uid",
                    Value = Request.QueryString["Uid"]
                };
                cmd.Parameters.Add(paramUpdateUid);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("EditUserDetails.aspx");
            }
        }
        
    }
}