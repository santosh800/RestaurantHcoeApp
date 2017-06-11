using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProductRepeater();
            HightLightCartProduct();
        }
    }
    private void BindProductRepeater()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("procBindAllProducts", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptrProducts.DataSource = dtBrands;
                    rptrProducts.DataBind();
                }

            }
        }
    }
    private void HightLightCartProduct()
    {
        //long id;
        //id = Convert.ToInt64(Request.QueryString["PID"].ToString());
        if (Session["MyCart"] != null)
        {
            DataTable dtProductAddedToCart = (DataTable)Session["MyCart"];
            if (dtProductAddedToCart.Rows.Count > 0)
            {
                foreach (RepeaterItem item in rptrProducts.Items)
                {
                    HiddenField htProductID = item.FindControl("htproductID") as HiddenField;
                    if (dtProductAddedToCart.AsEnumerable().Any(Row =>htProductID.Value == Row.Field<string>("ProductID")))
                    {
                        Button btnAddToCart = item.FindControl("btnAddToCart") as Button;
                        btnAddToCart.BackColor = System.Drawing.Color.Green;
                        btnAddToCart.Text = "Added to Cart";
                        //Image imgGreenStar = item.FindControl("imgstar") as Image;
                        //imageGreen.visible = true;
                    }
                }
            }
        }

    }








}