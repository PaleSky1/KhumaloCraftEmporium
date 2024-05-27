using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KhumaloCraftEmporium
{
    public partial class AddProduct : System.Web.UI.Page
    {
        DataAccess da = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool isConnected = da.TestConnection();
                if (!isConnected)
                {
                    lblMessage.Text = "Database connection failed.";
                }
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            DataAccess da = new DataAccess();

            string productName = edtProductName.Text;
            string description = edtDescription.Text;
            decimal price = 0;
            if (!decimal.TryParse(edtPrice.Text, out price))
            {
                lblMessage.Text = "Invalid price.";
                return;
            }
            string imageUrl = edtImageUrl.Text;

            DataAccess dataAccess = new DataAccess();
            if (dataAccess.AddProduct(productName, description, price, imageUrl))
            {
                lblMessage.Text = "Product added successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Failed to add product.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}