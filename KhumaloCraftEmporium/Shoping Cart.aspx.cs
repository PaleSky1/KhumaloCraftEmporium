using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KhumaloCraftEmporium
{
    public partial class Shoping_Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            if (Session["Cart"] != null)
            {
                DataTable cart = (DataTable)Session["Cart"];
                CartRepeater.DataSource = cart;
                CartRepeater.DataBind();

                decimal totalPrice = 0;
                foreach (DataRow row in cart.Rows)
                {
                    totalPrice += Convert.ToDecimal(row["Price"]);
                }
                lblTotalPrice.Text = totalPrice.ToString("0.00");
            }
        }

        protected void RemoveFromCart_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int productId = Convert.ToInt32(button.CommandArgument);

            if (Session["Cart"] != null)
            {
                DataTable cart = (DataTable)Session["Cart"];
                DataRow[] rows = cart.Select("ProductID=" + productId);
                if (rows.Length > 0)
                {
                    cart.Rows.Remove(rows[0]);
                    Session["Cart"] = cart;
                }
                LoadCart();
            }
        }

        protected void PlaceOrder_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                    return;
                }
                DataTable cart = (DataTable)Session["Cart"];

                string connectionString = "Server=tcp:loganserver1234.database.windows.net,1433;Initial Catalog=LogansDataBase;Persist Security Info=False;User ID=LoganAdmin;Password=Admin@7Admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlTransaction transaction = connection.BeginTransaction();

                    try
                    {
                        string insertOrderQuery = "INSERT INTO Orders (UserID, OrderDate, TotalPrice) OUTPUT INSERTED.OrderID VALUES (@UserID, @OrderDate, @TotalPrice)";
                        SqlCommand orderCommand = new SqlCommand(insertOrderQuery, connection, transaction);
                        orderCommand.Parameters.AddWithValue("@UserID", Session["UserID"]);
                        orderCommand.Parameters.AddWithValue("@OrderDate", DateTime.Now);

                        decimal totalPrice = 0;
                        foreach (DataRow row in cart.Rows)
                        {
                            totalPrice += Convert.ToDecimal(row["Price"]);
                        }
                        orderCommand.Parameters.AddWithValue("@TotalPrice", totalPrice);

                        int orderId = (int)orderCommand.ExecuteScalar();

                        foreach (DataRow row in cart.Rows)
                        {
                            string insertOrderItemQuery = "INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) VALUES (@OrderID, @ProductID, @Quantity, @Price)";
                            SqlCommand orderItemCommand = new SqlCommand(insertOrderItemQuery, connection, transaction);
                            orderItemCommand.Parameters.AddWithValue("@OrderID", orderId);
                            orderItemCommand.Parameters.AddWithValue("@ProductID", row["ProductID"]);
                            orderItemCommand.Parameters.AddWithValue("@Quantity", 1);
                            orderItemCommand.Parameters.AddWithValue("@Price", row["Price"]);

                            orderItemCommand.ExecuteNonQuery();
                        }

                        transaction.Commit();
                        Session["Cart"] = null;
                        Response.Redirect("MyWork");
                    }
                    catch (Exception)
                    {

                    }
                }
            }
        }
    }
}