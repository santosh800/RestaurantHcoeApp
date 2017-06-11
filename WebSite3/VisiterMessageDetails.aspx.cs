using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VisiterMessageDetails : System.Web.UI.Page
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