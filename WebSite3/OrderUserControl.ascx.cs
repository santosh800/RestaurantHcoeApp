using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderUserControl : System.Web.UI.UserControl
{
    public bool CanIUpDatesStatus;
    public string TransactionNoText
    {
        get { return txtTransactionNo.Text; }
        set { txtTransactionNo.Text = value; }
    }
    public bool IsAuthorizedToAddStatus
    {
        set { CanIUpDatesStatus = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if(txtTransactionNo.Text != string.Empty)
            {
                ShowOrderDetails(rblOrderDetails.SelectedValue, Convert.ToInt32(txtTransactionNo.Text));
            }
            else
            {
                rblOrderDetails.Visible = false;
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = false;
                Panel4.Visible = false;
            }
        }

    }

    private void ShowOrderDetails(string PanelId, int orderNo)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        if (IsOrderNoValid(orderNo))
        {
            rblOrderDetails.Visible = true;
            if (PanelId == "1")
            {
                ShopingCart k = new ShopingCart()
                {
                    flag = orderNo
                };
                DataTable dtCustomerDetails = k.GetOrderList();
                if (dtCustomerDetails.Rows.Count > 0)
                {
                    Panel1.Visible = true;
                    lblCustomerName.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerName"]);
                    lblCustomerPhoneNo.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerPhoneNo"]);
                    lblCustomerEmailId.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerEmailD"]);
                    lblTotalPrice.Text = Convert.ToString(dtCustomerDetails.Rows[0]["TotalPrice"]);
                    lblTotalProducts.Text = Convert.ToString(dtCustomerDetails.Rows[0]["TotalProducts"]);
                    lblCustomerAddress.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerAddress"]);
                    lblPayMentMethod.Text = Convert.ToString(dtCustomerDetails.Rows[0]["PaymentMethod"]);
                }
            }
            if (PanelId == "2")
            {
                Panel2.Visible = true;
                ShopingCart k = new ShopingCart()
                {
                    flag = orderNo
                };
                dlProducts.DataSource = k.GetTransactionDetails();
                dlProducts.DataBind();            
           }
            if (PanelId == "3")
            {
                Panel3.Visible = true;
                txtStatus.Visible = CanIUpDatesStatus;
                btnAdd.Visible = CanIUpDatesStatus;
                
                GetSetOrderStatus(0);
            }
            
        }
        else
            {
                Panel4.Visible = true;
            }

    }

    private void GetSetOrderStatus(int Flag)
    {
        ShopingCart k = new ShopingCart()
        {
            orderStatus = txtStatus.Text,
            orderNo=txtTransactionNo.Text,
            flag = Flag
        };
        DataTable dt = k.GetSetOrderStatus();
        rptrDelivery.DataSource = dt;
        rptrDelivery.DataBind();
        txtStatus.Text = string.Empty;
    }

    private bool IsOrderNoValid(int orderNo)
    {
        ShopingCart k = new ShopingCart()
        {
            flag = orderNo
        };
        DataTable dtCustomerDetails = k.GetOrderList();
        if (dtCustomerDetails.Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void btnGo_click(object sender, EventArgs e)
    {
        if (txtTransactionNo.Text != string.Empty)
        {
            rblOrderDetails.Visible = true;
            ShowOrderDetails(rblOrderDetails.SelectedValue, Convert.ToInt32(txtTransactionNo.Text));
        }
        else
        {
            rblOrderDetails.Visible = false;
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        GetSetOrderStatus(1);
    }

    protected void rblOrderDetail_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (txtTransactionNo.Text != string.Empty)
        {
            ShowOrderDetails(rblOrderDetails.SelectedValue, Convert.ToInt32(txtTransactionNo.Text.Trim()));
        }
    }







}