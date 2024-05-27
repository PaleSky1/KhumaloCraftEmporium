using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KhumaloCraftEmporium
{
    public partial class SignUp : System.Web.UI.Page
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

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Button clicked";

            string username = edtName.Text;
            string email = edtSignUpEmail.Text;
            string password = edtSignUpPassword.Text;
            string confirmPassword = edtSignUpConfirm.Text;

            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            try
            {
                bool signUpSuccess = da.SignUp(username, email, password);
                if (signUpSuccess)
                {
                    lblMessage.Text = "Sign up successful!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Sign up failed. Please try again.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}