using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ShopingCart
/// </summary>
public class ShopingCart
{
    public string customerName;
    public string customerEmail;
    public string customerPhoneNo;
    public string customerAddress;
    public string productList;
    public string paymentMethod;
    public string orderStatus;
    public string orderNo;//TransactionNo
    public int totalProducts;
    public int totalPrice;
    public int customerID;
    public int productID;
    public int flag;
    
    public DataTable GetSetOrderStatus()
    {
        SqlParameter[] parameters = new SqlParameter[3];
        parameters[0] = DataAccess.AddParameter("@TransactionNo", Convert.ToInt32(orderNo), System.Data.SqlDbType.Int, 20);
        parameters[1] = DataAccess.AddParameter("@OrderStatus",orderStatus, System.Data.SqlDbType.VarChar,300);
        parameters[2] = DataAccess.AddParameter("@Flag", flag, System.Data.SqlDbType.Int, 10);
        DataTable dt = DataAccess.ExecuteDbByProcedure("SP_OrderStatus", parameters);
        return dt;
    }
    public DataTable GetOrderList()
    {
        SqlParameter[] parameters = new SqlParameter[1];
        parameters[0] = DataAccess.AddParameter("@Flag", flag, System.Data.SqlDbType.Int, 20);
        DataTable dt = DataAccess.ExecuteDbByProcedure("SP_GetOrderList", parameters);
        return dt;

    }
    public DataTable GetTransactionDetails()
    {
        SqlParameter[] parameters = new SqlParameter[1];
        parameters[0] = DataAccess.AddParameter("@TransationNo", flag, System.Data.SqlDbType.Int, 20);
        DataTable dt = DataAccess.ExecuteDbByProcedure("SP_GetTransactionDetails", parameters);
        return dt;
    }
    public DataTable SaveCustomerDetails()
    {

        SqlParameter[] parameters = new SqlParameter[7];
        parameters[0] = DataAccess.AddParameter("@CustomerName", customerName, SqlDbType.NVarChar, 100);
        parameters[1] = DataAccess.AddParameter("@CustomerEmailID", customerEmail, SqlDbType.NVarChar,100);
        parameters[2] = DataAccess.AddParameter("@CustomerPhoneNo", customerPhoneNo, SqlDbType.NVarChar, 10);
        parameters[3] = DataAccess.AddParameter("@CustomerAddress", customerAddress, SqlDbType.NVarChar, 500);
        parameters[4] = DataAccess.AddParameter("@TotalProducts", totalProducts, SqlDbType.Int, 100);
        parameters[5] = DataAccess.AddParameter("@TotalPrice", totalPrice, SqlDbType.Int, 100);
        parameters[6] = DataAccess.AddParameter("@PaymentMethod", paymentMethod, SqlDbType.NVarChar, 100);

        DataTable dt = DataAccess.ExecuteDbByProcedure("SP_SaveCustomerDetails", parameters);
        return dt;





    }
    public DataTable SaveCustomerProducts()
    {

        SqlParameter[] parameters = new SqlParameter[3];
        parameters[0] = DataAccess.AddParameter("@CustomerID",customerID, SqlDbType.Int, 20);
        parameters[1] = DataAccess.AddParameter("@ProductID", productID, SqlDbType.Int, 20);
        parameters[2] = DataAccess.AddParameter("@TotalProduct",totalProducts, SqlDbType.Int,10);
      

        DataTable dt = DataAccess.ExecuteDbByProcedure("[SP_SaveCustomerProducts]", parameters);
        return dt;





    }

}