using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderSuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int TrackingNo;
        if (Request.QueryString["TrackingID"] == null)
        {
            Response.Redirect("OrderSuccess.aspx");
        }
        else
        {

            TrackingNo = Convert.ToInt32(Request.QueryString["TrackingID"].ToString());
            lblTrackNo.Text = Convert.ToString(TrackingNo);
          

        }
    }









    protected void trackYourOrder_Click(object sender, EventArgs e)
    {
        int TrackingNo;
        if (Request.QueryString["TrackingID"] == null)
        {
            Response.Redirect("OrderSuccess.aspx");
        }
        else
        {
          
            TrackingNo = Convert.ToInt32(Request.QueryString["TrackingID"].ToString());
            lblTrackNo.Text = Convert.ToString(TrackingNo);
            Response.Redirect("TrackYourOrder.aspx?TrackID=" + TrackingNo);

        }
    }
}