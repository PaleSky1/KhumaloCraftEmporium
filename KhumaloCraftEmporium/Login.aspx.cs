using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KhumaloCraftEmporium
{
    public partial class Login : System.Web.UI.Page
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = edtLoginEmail.Text;
            string password = edtLoginPassword.Text;

            DataAccess dataAccess = new DataAccess();
            try
            {
                int userId = dataAccess.Login(email, password);
                if (userId != -1) 
                {
                    Session["UserID"] = userId;

                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password. Please try again.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignUp.aspx");
        }
    }
}
