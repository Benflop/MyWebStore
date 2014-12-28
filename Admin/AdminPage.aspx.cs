using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace MyWebStore.Admin
{
    public partial class AdminPage : System.Web.UI.Page
    {
        string connString =
                ConfigurationManager.ConnectionStrings["WebStoreCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        { 
        }

        protected void AddProductButton_Click(object sender, EventArgs e)
        {
            Boolean fileOk = false;
            String path = Server.MapPath("~/Catalog/Images/");
            if (ProductImage.HasFile)
            {
                String fileExtension =
                    System.IO.Path.GetExtension(ProductImage.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    fileOk = true;
                }
            }
            if (fileOk)
            {
                try
                {
                    //Save to Images folder.
                    ProductImage.PostedFile.SaveAs(path + ProductImage.FileName);
                }
                catch (Exception ex)
                {
                    LabelAddProductStatus.Text = ex.Message;
                }
            }
            else
            {
                LabelAddProductStatus.Text = "Unable to accept file type.";
            }
        }

        protected void AddCategoryButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connString);

            string sqlString = "INSERT INTO CATEGORIES (CategoryName, Description) ";
            sqlString += "VALUES(@Name, @Description)";
            SqlCommand sqlCmd = new SqlCommand(sqlString, conn);

            //There are 2 ways to add the parameterized command.
            //One is used the AddWithValue method that will automatically
            //detect the parameter type. This can be used for simple SQL data types.
            sqlCmd.Parameters.AddWithValue("@Name", AddCategoryName.Text);

            //One is to specifically indicate what is the SQL data type first
            //before assigning the value.
            sqlCmd.Parameters.Add("@Description", SqlDbType.NVarChar);
            sqlCmd.Parameters["@Description"].Value = AddCategoryDescription.Text;

            try
            {
                conn.Open();
                int result = sqlCmd.ExecuteNonQuery();

                if (result == 1)
                {
                    LabelAddCategoryStatus.Text = "Category added successfully.";
                    DropDownAddCategory.DataBind();
                }
                else
                {
                    LabelAddCategoryStatus.Text = "Category could not be added to the database.";
                }

            }
            catch (SqlException er)
            {
                LabelAddCategoryStatus.Text = er.Message;
            }
            finally
            {
                //Close the connection
                conn.Close();
            }
        }


    }
}