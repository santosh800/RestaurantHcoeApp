using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEmployees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindEmployeesRptr();
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        HttpPostedFile postedFile = txtEmpImage.PostedFile;
        string fileName = Path.GetFileName(postedFile.FileName);
        string fileExtention = Path.GetExtension(fileName);//gives the extention of the uploaded file
        int fileSize = postedFile.ContentLength;//gives the size of uploded image

        if (txtEmpName.Text==string.Empty && txtEmpEmail.Text==string.Empty && txtEmpAddress.Text==string.Empty && txtEmpDescription.Text==string.Empty && txtEmpSalary.Text==string.Empty && txtEmpPhoneNo.Text==string.Empty && txtEmpSpec.Text==string.Empty && txtEmpType.Text==string.Empty && !(txtEmpImage.HasFile))
        {



            lblEmpError.Text = "All the fields are required";
            lblEmpError.ForeColor = System.Drawing.Color.Red;

           

          
        }
        if(fileExtention.ToLower() == ".jpg" || fileExtention.ToLower() == ".bmp" || fileExtention.ToLower() == ".png" || fileExtention.ToLower() == ".gif")
        {
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
            string CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_EmpInsertDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramEmpName = new SqlParameter()
                {
                    ParameterName = "@EmpName",
                    Value = txtEmpName.Text
                };
                cmd.Parameters.Add(paramEmpName);
                SqlParameter paramEmpEmail = new SqlParameter()
                {
                    ParameterName = "@EmpEmail",
                    Value = txtEmpEmail.Text
                };
                cmd.Parameters.Add(paramEmpEmail);
                SqlParameter paramEmpAddress = new SqlParameter()
                {
                    ParameterName = "@EmpAddress",
                    Value = txtEmpAddress.Text
                };
                cmd.Parameters.Add(paramEmpAddress);
                SqlParameter paramEmpPhoneNo = new SqlParameter()
                {
                    ParameterName = "@EmpPhoneNo",
                    Value = txtEmpPhoneNo.Text
                };
                cmd.Parameters.Add(paramEmpPhoneNo);
                SqlParameter paramEmpDescription = new SqlParameter()
                {
                    ParameterName = "@EmpDescription",
                    Value = txtEmpDescription.Text
                };
                cmd.Parameters.Add(paramEmpDescription);
                SqlParameter paramEmpSalary = new SqlParameter()
                {
                    ParameterName = "@EmpSalary",
                    Value = txtEmpSalary.Text
                };
                cmd.Parameters.Add(paramEmpSalary);
                SqlParameter paramEmpType = new SqlParameter()
                {
                    ParameterName = "@EmpType",
                    Value = txtEmpType.Text
                };
                cmd.Parameters.Add(paramEmpType);
                SqlParameter paramEmpSpec = new SqlParameter()
                {
                    ParameterName = "@EmpSpec",
                    Value = txtEmpSpec.Text
                };
                cmd.Parameters.Add(paramEmpSpec);
                SqlParameter paramEmpImageName = new SqlParameter()
                {
                    ParameterName = "@EmpImageName",
                    Value = fileName
                };
                cmd.Parameters.Add(paramEmpImageName);
                SqlParameter paramEmpImageSize = new SqlParameter()
                {
                    ParameterName = "@EmpImageSize",
                    Value = fileSize
                };
                cmd.Parameters.Add(paramEmpImageSize);
                SqlParameter paramEmpImageData = new SqlParameter()
                {
                    ParameterName = "@ImageData",
                    Value = bytes
                };
                cmd.Parameters.Add(paramEmpImageData);
                SqlParameter paramEmpNewID = new SqlParameter()
                {
                    ParameterName = "@NewID",
                    Value = -1,
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(paramEmpNewID);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblEmpError.Text = "Upload Successfull";
                lblEmpError.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("AddEmployees.aspx");
                    
            }



        }
        else
        {
            lblEmpError.Text = "uploaded image is should be .jpg or .bmp or .png or .gif";
            lblEmpError.ForeColor = System.Drawing.Color.Red;
        }

    }


    private void BindEmployeesRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from EmployeesDetails", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrEmployeesDetails.DataSource = dt;
                    rptrEmployeesDetails.DataBind();
                }

            }
        }
    }

    protected void btnDelete_Click(object sender,EventArgs e)
    {
        string empID = Convert.ToInt16(((Button)sender).CommandArgument).ToString();
        string CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("SP_EmpDeleteDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
          
            SqlParameter paramEmpID = new SqlParameter()
            {
                ParameterName = "@EmpID",
                Value =empID
            };
            cmd.Parameters.Add(paramEmpID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("AddEmployees.aspx");
        }
   }



   
}