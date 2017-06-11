using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditCategory : System.Web.UI.Page
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
            using (SqlCommand cmd = new SqlCommand("select * from tblcategories", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptrCategory.DataSource = dtBrands;
                    rptrCategory.DataBind();
                }

            }
        }
    }
    protected void btnEditCat_Click(object sender, EventArgs e)
    {
        int id;
        if (Request.QueryString["CatID"] == null)
        {
            Response.Redirect("AddCategory.aspx");
        }
        else
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            id = Convert.ToInt32(Request.QueryString["CatID"].ToString());
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update tblCategories SET CatName=@Param1 where CatID=@Param2", con);
                cmd.Parameters.AddWithValue("Param1", txtCatName.Text);
                cmd.Parameters.AddWithValue("Param2", id);

                cmd.ExecuteNonQuery();
                con.Close();
                txtCatName.Text = string.Empty;
            }
        }
    }
}