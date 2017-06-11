using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductView : System.Web.UI.Page
{
    String PName, PPrice, PSelPrice, PDescription, PProductDetail,PMaterialCare ;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["PID"] != null)
        {
            if (!IsPostBack)
            {
                BindProductImages();
                BindProductDetails();
            }
        }
        else
        {
            Response.Redirect("~/Products.aspx");
        }
    }

    private void BindProductDetails()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblProducts where PID=" + PID + "", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptrProductDetails.DataSource = dtBrands;
                    rptrProductDetails.DataBind();
                }

            }
        }
    }

    private void BindProductImages()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblProductImages where PID=" + PID + "", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    rptrImages.DataSource = dtBrands;
                    rptrImages.DataBind();
                }

            }
        }
    }
    protected string GetActiveClass(int ItemIndex)
    {
        if (ItemIndex == 0)
        {
            return "active";
        }
        else
        {
            return "";
        }
    }

    protected void rptrProductDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string BrandID = (e.Item.FindControl("hfBrandID") as HiddenField).Value;
            string CatID = (e.Item.FindControl("hfCatID") as HiddenField).Value;
            string SubCatID = (e.Item.FindControl("hfSubCatID") as HiddenField).Value;
            string GenderID = (e.Item.FindControl("hfGenderID") as HiddenField).Value;

            RadioButtonList rblSize = e.Item.FindControl("rblSize") as RadioButtonList;

            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblSizes where BrandID=" + BrandID +
                    " and CategoryID=" + CatID + " and SubCategoryID=" + SubCatID +
                    " and GenderID=" + GenderID + "", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sda.Fill(dtBrands);
                        rblSize.DataSource = dtBrands;
                        rblSize.DataTextField = "sizename";
                        rblSize.DataValueField = "sizeid";
                        rblSize.DataBind();
                    }

                }
            }

        }
    }
    


    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        long id;
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        id = Convert.ToInt64(Request.QueryString["PID"].ToString());
        string productQuantity ="1";
        
        //DataListItem currentItem = (sender as Button).NamingContainer as DataListItem;
       // Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;
        if (Session["MyCart"] != null)//if we already added one product to Session["MyCart"] then this bolck of code will run
        {
            DataTable dt = (DataTable)Session["MyCart"];//store the item of session["MyCart"] to DataTable dt
            var checkProduct = dt.AsEnumerable().Where(r =>r.Field<string>("ProductID") == id.ToString());//check that ProductID==ID
            if (checkProduct.Count() == 0)//if the product is not added in the cart then this if condition is and code block runs
            {
                //string sizeid = ",dbo.getSizeName(" + SizeID + ") as SizeNamee," + SizeID + " as SizeIDD,";
                string query1 = "select A.*,ImageData.Name,ImageData.Extention from tblProducts A cross apply(select top 1 B.Name,Extention from tblProductImages B where B.PID=A.PID)ImageData where A.PID=" + id + "";
                //string query = "select * from tblProducts where PID=" + id + "";
                DataTable dtProducts = GetData(query1);
                DataRow dr = dt.NewRow();//DataTable is already Created by esle block we are only adding the rows
                dr["ProductID"] = id;//ProductID we are storing  querystring PID
                dr["PName"] = Convert.ToString(dtProducts.Rows[0]["PName"]);//Name column we are storing Name
                dr["PPrice"] = Convert.ToString(dtProducts.Rows[0]["PPrice"]);
                dr["PSelPrice"] = Convert.ToSingle(dtProducts.Rows[0]["PSelPrice"]);
                dr["PDescription"] = Convert.ToString(dtProducts.Rows[0]["PDescription"]);
                dr["ProductDetails"] = Convert.ToString(dtProducts.Rows[0]["PProductDetails"]);
                dr["ProductQuantity"] = productQuantity;
                dr["ImageName"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
                dr["ImageExtention"] = Convert.ToString(dtProducts.Rows[0]["Extention"]);

                //dr["AvailableStock"] = lblAvailableStock.Text;
                dt.Rows.Add(dr);//dt is global variable 
                Session["MyCart"] = dt;//Session now contain two product 
                btnShoppingHeart.Text = dt.Rows.Count.ToString();//update the text of btnShoppingHeart with new rows added
           }

        }

        else
        { //write the code for showing the product from the lplproduct table 
            //string query = "select * from tblProducts where PID=" + id + "";
            string query1 = "select A.*,ImageData.Name,ImageData.Extention from tblProducts A cross apply(select top 1 B.Name,Extention from tblProductImages B where B.PID=A.PID)ImageData where A.PID=" + id + "";
            DataTable dtProducts = GetData(query1);
            DataTable dt = new DataTable();//assigning the memory to the data table
            dt.Columns.Add("ProductID", typeof(string));//adding the column to the temp table
            dt.Columns.Add("PName", typeof(string));
            dt.Columns.Add("PPrice", typeof(string));
            dt.Columns.Add("PSelPrice", typeof(string));
            dt.Columns.Add("PDescription", typeof(string));
            dt.Columns.Add("ProductDetails", typeof(string));
            dt.Columns.Add("ProductQuantity", typeof(string));
            dt.Columns.Add("ImageName", typeof(string));
            dt.Columns.Add("ImageExtention", typeof(string));
            DataRow dr = dt.NewRow();//for each product we are assigning new row
            dr["ProductID"] = id;
            dr["PName"] = Convert.ToString(dtProducts.Rows[0]["PName"]);//adding the name to data row
            dr["PPrice"] = Convert.ToString(dtProducts.Rows[0]["PPrice"]);//Row[0]["Price"] price here is a database column not temp database column
            dr["PSelPrice"] = Convert.ToString(dtProducts.Rows[0]["PSelPrice"]);
            dr["PDescription"] = Convert.ToString(dtProducts.Rows[0]["PDescription"]);
            dr["ProductDetails"] = Convert.ToString(dtProducts.Rows[0]["PProductDetails"]);
            dr["ProductQuantity"] = productQuantity;
            dr["ImageName"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
            dr["ImageExtention"] = Convert.ToString(dtProducts.Rows[0]["Extention"]);
            // dr["AvailableStock"] = lblAvailableStock.Text;
            dt.Rows.Add(dr);
            Session["MyCart"] = dt;//assigning the DataTable To the Session["MyCart"]
           btnShoppingHeart.Text = dt.Rows.Count.ToString();//setting the dtnShoppingHeart Text property to number of row
        }
        HightLightCartProduct();
}//end of the btnAddToCart_Click

    

    public DataTable GetData(string query)
    {
        DataTable dt = new DataTable();
        String conn = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(conn);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        da.Fill(dt);
        con.Close();
        return dt;
    }
    private void HightLightCartProduct()
    {
             long id;
             id = Convert.ToInt64(Request.QueryString["PID"].ToString());
        if (Session["MyCart"] != null)
        {
            DataTable dtProductAddedToCart = (DataTable)Session["MyCart"];
            if (dtProductAddedToCart.Rows.Count > 0)
             {
                foreach (RepeaterItem item in rptrProductDetails.Items)
                {
                    //HiddenField htProductID = item.FindControl("htproductID") as HiddenField;
                    if (dtProductAddedToCart.AsEnumerable().Any(Row => id.ToString()== Row.Field<string>("ProductID")))
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
    protected void btnShoppingHeart_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewCart.aspx");
       // GetMyCart();//display all the items in the cart
    }
/*private void GetMyCart()
    {
        DataTable dtProducts;
        if (Session["MyCart"] != null)
        {
            dtProducts = (DataTable)Session["Mycart"];

        }
        else
        {
            dtProducts = new DataTable();
        }
        if (dtProducts.Rows.Count > 0)
        {
            txtTotalProduct.Text = dtProducts.Rows.Count.ToString();
            btnShoppingHeart.Text == dtProducts.Rows.Count.ToString();
            dlCartProduct.Datasource = dtProducts;
            dlcartProduct.DataBind();
            UpdateTotalBill();
            pnlMyCart.Visible = true;
            pnlCheckOut.Visible = true;
            pnlEnptyCart.Visible = false;
            pnlProduct.Visible = false;
            pnlOrderPlacedSuccssfully.Visible = false;

        }
        else
        {
            pnlEmptyCart.Visible = true;
            pnlMyCart.Visible = false;
            pnlCheckout.Visible = false;
            pnlCategory.Visible = false;
            pnlProduct.Visible = false;
            pnlOrderPlaceSuccfully.Visible = false;
            dlCartProduct.DataSource = null;
            dlCartProduct.DataBind();
            txtTotalProduct.Text = "0";
            txtTotalPrice.Text = "0";
            btnShoppingHeart.Text = "0";
        }
    }*/
    








}//end of the the code behind file
