using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetMyCart();
        }
    }
    private void GetMyCart()
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
            txtTotalProducts.Text = dtProducts.Rows.Count.ToString();
            //btnShoppingHeart.Text == dtProducts.Rows.Count.ToString();
            repeater1.DataSource = dtProducts;
            repeater1.DataBind();
            UpDateTotatBill();
           






            //pnlMyCart.Visible = true;
            //pnlCheckOut.Visible = true;
            //pnlEnptyCart.Visible = false;
            //pnlProduct.Visible = false;
            //pnlOrderPlacedSuccssfully.Visible = false;

        }
        else
        {
            //pnlEmptyCart.Visible = true;
            //pnlMyCart.Visible = false;
            //pnlCheckout.Visible = false;
            // pnlCategory.Visible = false;
            //pnlProduct.Visible = false;
            //pnlOrderPlaceSuccfully.Visible = false;
            // dlCartProduct.DataSource = null;
            //dlCartProduct.DataBind();
            repeater1.DataSource = null;
            repeater1.DataBind();
            txtTotalProducts.Text = "0";
            txtTotalPrice.Text = "0";
           // btnShoppingHeart.Text = "0";
        }
    }
    protected void txtProductQuantity_TextChanged_Click(object sender,EventArgs e)
    {
        TextBox txtQuantity = (sender as TextBox);
        RepeaterItem currentItem = (sender as TextBox).NamingContainer as RepeaterItem;
        Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;
        HiddenField ProductID = currentItem.FindControl("hfProductID") as HiddenField;
        if (txtQuantity.Text == string.Empty || txtQuantity.Text == "0" || txtQuantity.Text == "1")
        {
            txtQuantity.Text = "1";
        }
        else
        {
            if (Session["MyCart"] != null)
            {
                if (Convert.ToInt32(txtQuantity.Text) <= Convert.ToInt32(lblAvailableStock.Text))
                {
                    DataTable dt = (DataTable)Session["MyCart"];
                    DataRow[] rows = dt.Select("ProductID='" + ProductID.Value+ "'");
                    int index = dt.Rows.IndexOf(rows[0]);
                    dt.Rows[index]["ProductQuantity"] = txtQuantity.Text;
                    Session["MyCart"] = dt;

                }
                else
                {
                    lblAvailableStockAlert.Text = "Alert product out of stock";
                    txtQuantity.Text = "1";
                }
            }
        }
       UpDateTotatBill();
      



    }

    private void UpDateTotatBill()
    {
        long  TotalPrice = 0;
        long TotalProduct = 0;
        long txtQuantity1;
        long priceLabel1;
        foreach(RepeaterItem item in repeater1.Items)
        {
            Label priceLabel = item.FindControl("lblPrice") as Label;
            TextBox txtQuantity = item.FindControl("txtQuantity") as TextBox;
            if(Int64.TryParse(txtQuantity.Text,out txtQuantity1))
            {
                if(Int64.TryParse(priceLabel.Text,out priceLabel1)) {

               long productPrice = Convert.ToInt64(priceLabel1) * Convert.ToInt64(txtQuantity1);
                TotalPrice = TotalPrice + productPrice;
                TotalProduct = TotalProduct + Convert.ToInt64(txtQuantity.Text);

                }

             


            }
            
        }
        txtTotalPrice.Text = Convert.ToString(TotalPrice);
        txtTotalProducts.Text = Convert.ToString(TotalProduct);
    }
    protected void btnRemoveFromCart_Click(Object sender ,EventArgs e)
    {
       string productID=Convert.ToInt16(((Button)sender).CommandArgument).ToString();
        if (Session["MyCart"] != null)
        {
            DataTable dt = (DataTable)Session["MyCart"];
            DataRow drr = dt.Select("ProductID=" + productID + "").FirstOrDefault();
            if (drr != null)
            {
                dt.Rows.Remove(drr);
            }
            Session["MyCart"] = dt;
        }
        GetMyCart();
    }

protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        string productid = string.Empty;
        DataTable dt;
        if (Session["MyCart"] != null)
        {
            dt = (DataTable)Session["MyCart"];
            ShopingCart k = new ShopingCart()
            {
                customerName = txtName.Text,
                customerEmail = txtEmail.Text,
                customerPhoneNo = txtPhoneNo.Text,
                customerAddress = txtAddress.Text,
                totalProducts = Convert.ToInt32(txtTotalProducts.Text),
                totalPrice = Convert.ToInt32(txtTotalPrice.Text),
                productList = productid,
                paymentMethod = chkBoxList.SelectedItem.Text,
              };
            DataTable dtResult = k.SaveCustomerDetails();
            for(int i = 0; i < dt.Rows.Count; i++)
            {
                ShopingCart saveProducts = new ShopingCart()
                {
                    customerID = Convert.ToInt32(dtResult.Rows[0][0]),
                    productID = Convert.ToInt32(dt.Rows[i]["ProductID"]),
                    totalProducts = Convert.ToInt32(dt.Rows[i]["ProductQuantity"])
                };
                saveProducts.SaveCustomerProducts();


            }

            //Session.Clear();
            GetMyCart();
            //SendOrderPlaceAlert(txtName.Text, txtEmail.Text, Convert.ToString(dtResult.Rows[0][0]));
            Response.Redirect("OrderSuccess.aspx?TrackingID=" + dtResult.Rows[0][0]);
          

        }














    }
    private String PopulateOrderEmailBody(string customerName,string transationNo)
    {
        string body = string.Empty;
        using(StreamReader reader=new StreamReader(Server.MapPath("~/OrderTemplate.htm")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{CustomerName}", customerName);
        body = body.Replace("{OrderNo}", transationNo);
        body = body.Replace("{TransationURL}", "http://localhost:53271/TrackYourOrder.aspx?TrackingID=" + transationNo);
        return body;
    }

    private void SendOrderPlaceAlert(string customerName, string customerEmail,string transationNo)
    {
        string body = this.PopulateOrderEmailBody(customerName, transationNo);
        EmailSender.SendEmail(customerEmail, "www.eshop.com --your Order Details", body);
    }











    
}//end of the code behind file