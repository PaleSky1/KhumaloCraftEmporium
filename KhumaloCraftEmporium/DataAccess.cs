using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace KhumaloCraftEmporium
{
    public class DataAccess
    {
        static string connectionString = "Server=tcp:loganserver1234.database.windows.net,1433;Initial Catalog=LogansDataBase;Persist Security Info=False;User ID=LoganAdmin;Password=Admin@7Admin;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
        static SqlConnection databaseConnection = new SqlConnection(connectionString);

        public bool SignUp(string username, string email, string password)
        {
            try
            {
                databaseConnection.Open();
                string sql = "INSERT INTO Users (Username, Email, Password) VALUES (@Username, @Email, @Password)";
                using (SqlCommand command = new SqlCommand(sql, databaseConnection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);
                    command.ExecuteNonQuery();
                }
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while signing up", ex);
            }
            finally
            {
                if (databaseConnection.State == System.Data.ConnectionState.Open)
                {
                    databaseConnection.Close();
                }
            }
        }
        public int Login(string email, string password)
        {
            int userId = -1;

            try
            {
                databaseConnection.Open();
                string sql = "SELECT UserID FROM Users WHERE Email = @Email AND Password = @Password";
                using (SqlCommand command = new SqlCommand(sql, databaseConnection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        userId = Convert.ToInt32(reader["UserID"]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while logging in", ex);
            }
            finally
            {
                if (databaseConnection.State == System.Data.ConnectionState.Open)
                {
                    databaseConnection.Close();
                }
            }

            return userId;
        }
        public bool AddProduct(string productName, string description, decimal price, string imageUrl)
        {
            try
            {
                databaseConnection.Open();
                string sql = "INSERT INTO Products (ProductName, Description, Price, ImageUrl, DateAdded) VALUES (@ProductName, @Description, @Price, @ImageUrl, GETDATE())";
                using (SqlCommand command = new SqlCommand(sql, databaseConnection))
                {
                    command.Parameters.AddWithValue("@ProductName", productName);
                    command.Parameters.AddWithValue("@Description", description);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@ImageUrl", imageUrl);
                    command.ExecuteNonQuery();
                }
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding the product", ex);
            }
            finally
            {
                if (databaseConnection.State == System.Data.ConnectionState.Open)
                {
                    databaseConnection.Close();
                }
            }
        }
        public bool TestConnection()
        {
            try
            {
                databaseConnection.Open();
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Database connection failed: " + ex.Message);
                return false;
            }
            finally
            {
                if (databaseConnection.State == System.Data.ConnectionState.Open)
                {
                    databaseConnection.Close();
                }
            }
        }
    }
}