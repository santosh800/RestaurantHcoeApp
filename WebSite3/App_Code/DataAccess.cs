using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataAccess
/// </summary>
public static class DataAccess
{
public static string CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
public static SqlParameter AddParameter(string parameterName,object value,SqlDbType dbtype,int size)
    {

        SqlParameter param = new SqlParameter();
        param.ParameterName = parameterName;
        param.Value = value.ToString();
        param.SqlDbType = dbtype;
        param.Size = size;
        param.Direction = ParameterDirection.Input;
        return param;



    }

public static DataTable ExecuteDbByProcedure(string procedureName,SqlParameter[] param)
    {
        SqlConnection conn = new SqlConnection(CS);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = procedureName;
        cmd.Parameters.AddRange(param);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dtable = new DataTable();
        try
        {
            adapter.Fill(dtable);
        }
        catch (Exception ex)
        {
         
        }
        finally
        {
            adapter.Dispose();
            cmd.Parameters.Clear();
            cmd.Dispose();

        }
        return dtable;

    }
    

    












}