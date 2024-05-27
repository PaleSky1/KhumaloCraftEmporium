using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KhumaloCraftEmporium
{
    public partial class MyWork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            string connectionString = "Server=tcp:loganserver1234.database.windows.net,1433;Initial Catalog=LogansDataBase;Persist Security Info=False;User ID=LoganAdmin;Password=Admin@7Admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
            string query = "SELECT ProductID, ProductName, Description, Price, ImageUrl FROM Products";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable productsTable = new DataTable();
                adapter.Fill(productsTable);

                ProductsRepeater.DataSource = productsTable;
                ProductsRepeater.DataBind();
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int productId = Convert.ToInt32(button.CommandArgument);

            DataTable cart;
            if (Session["Cart"] == null)
            {
                cart = new DataTable();
                cart.Columns.Add("ProductID", typeof(int));
                cart.Columns.Add("ProductName", typeof(string));
                cart.Columns.Add("Price", typeof(decimal));
            }
            else
            {
                cart = (DataTable)Session["Cart"];
            }

            string connectionString = "Server=tcp:loganserver1234.database.windows.net,1433;Initial Catalog=LogansDataBase;Persist Security Info=False;User ID=LoganAdmin;Password=Admin@7Admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
            string query = "SELECT ProductID, ProductName, Price FROM Products WHERE ProductID = @ProductID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ProductID", productId);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    DataRow row = cart.NewRow();
                    row["ProductID"] = reader["ProductID"];
                    row["ProductName"] = reader["ProductName"];
                    row["Price"] = reader["Price"];
                    cart.Rows.Add(row);
                }
            }

            Session["Cart"] = cart;
        }
    }
}