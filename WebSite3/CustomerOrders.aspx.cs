using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetOrdersList();
        }
    }

    private void GetOrdersList()
    {
        ShopingCart k = new ShopingCart()
        {
            flag = 0
        };
        DataTable dt = k.GetOrderList();
        rptrCustomerOrder.DataSource = dt;
        rptrCustomerOrder.DataBind();
    }
}