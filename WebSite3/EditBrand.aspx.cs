using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class EditBrand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindBrandsRptr();
        }
    }
    private void BindBrandsRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblBrands", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptrBrands.DataSource = dtBrands;
                    rptrBrands.DataBind();
                }

            }
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        int id;
        if (Request.QueryString["BrandId"] == null)
        {
            Response.Redirect("AddBrand.aspx");
        }
        else
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            id = Convert.ToInt32(Request.QueryString["BrandID"].ToString());
            using (SqlConnection con = new SqlConnection(CS))
             {
                con.Open();
                SqlCommand cmd = new SqlCommand("update tblBrands SET Name=@Param1 where BrandID=@Param2", con);
                cmd.Parameters.AddWithValue("Param1", txtBrandName.Text);
                cmd.Parameters.AddWithValue("Param2", id);
                cmd.ExecuteNonQuery();
                con.Close();
                txtBrandName.Text = string.Empty;
            }
            BindBrandsRptr();
        }
    }
}