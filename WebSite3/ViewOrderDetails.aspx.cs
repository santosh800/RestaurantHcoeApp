using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewOrderDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["TrackingID"]))
        {
            string TransactionNo = Request.QueryString["TrackingID"];
            OrderUserControl.TransactionNoText = TransactionNo;

        }
        if (!string.IsNullOrEmpty(Convert.ToString(Session["USERNAME"])))
        {
            OrderUserControl.IsAuthorizedToAddStatus = true;
        }
        else
        {
            OrderUserControl.IsAuthorizedToAddStatus = false;
            Response.Redirect("SignIn.aspx");
        }
    }
}