<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KhumaloCraftEmporium.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
        .login-container {
            max-width: 400px;
            margin:0 auto;
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
    <div class="login-container">
        <h3>Welcome to KhumaloCraft Emporium. Please Log In Below.</h3>
        <div class="form-group">
            <asp:Label runat="server" Text="Email" AssociatedControlID="edtLoginEmail" />
            <asp:TextBox runat="server" ID="edtLoginEmail" CssClass="form-control" />
        </div>
        <div class="form-group">
            <asp:Label runat="server" Text="Password" AssociatedControlID="edtLoginPassword" />
            <asp:TextBox runat="server" ID="edtLoginPassword" TextMode="Password" CssClass="form-control" />
        </div>
        <asp:Label runat="server" ID="lblMessage" ForeColor="Red" />
        <asp:Button runat="server" Text="Login" ID="btnLogin" OnClick="btnLogin_Click" CssClass="btn btn-primary" />
        <asp:Button runat="server" Text="Don't have an account? Sign Up" ID="Button1" OnClick="btnSignUp_Click" CssClass="btn btn-link" />
    </div>
</asp:Content>
