<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="KhumaloCraftEmporium.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
    .signup-container {
        max-width: 400px;
        margin: 0 auto;
        margin-top: 10%;
        margin-bottom: 10%;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

</style>

<div class="signup-container">
    <h3>Welcome to KhumaloCraft Emporium. Please Sign Up Below.</h3>
    <div class="form-group">
        <asp:Label runat="server" Text="Name" AssociatedControlID="edtName" />
        <asp:TextBox runat="server" ID="edtName" CssClass="form-control" />
    </div>
    <div class="form-group">
        <asp:Label runat="server" Text="Email" AssociatedControlID="edtSignUpEmail" />
        <asp:TextBox runat="server" ID="edtSignUpEmail" CssClass="form-control" />
    </div>
    <div class="form-group">
        <asp:Label runat="server" Text="Password" AssociatedControlID="edtSignUpPassword" />
        <asp:TextBox runat="server" ID="edtSignUpPassword" TextMode="Password" CssClass="form-control" />
    </div>
    <div class="form-group">
        <asp:Label runat="server" Text="Confirm Password" AssociatedControlID="edtSignUpConfirm" />
        <asp:TextBox runat="server" ID="edtSignUpConfirm" TextMode="Password" CssClass="form-control" />
    </div>
    <asp:Label runat="server" ID="lblMessage" ForeColor="Red" />
    <asp:Button runat="server" Text="Sign Up!" ID="btnSignUp" OnClick="btnSignUp_Click" CssClass="btn btn-primary" />
    <asp:Button runat="server" Text="Already have an account? Login" ID="Button1" OnClick="btnLogin_Click" CssClass="btn btn-link" />
</div>
</asp:Content>
