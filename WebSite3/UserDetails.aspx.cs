using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserDetails : System.Web.UI.Page
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
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["EmpID"] == string.Empty)
        {
            Response.Redirect("AddEmployees.aspx");
        }
        else
        {
            string Uid = Convert.ToInt16(((Button)sender).CommandArgument).ToString();
            string CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_DeleteUserDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramEmpID = new SqlParameter()
                {
                    ParameterName = "@Uid",
                    Value = Uid
                };
                cmd.Parameters.Add(paramEmpID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("UserDetails.aspx");
            }
        }
    }
}