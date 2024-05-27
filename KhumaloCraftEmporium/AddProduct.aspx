<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="KhumaloCraftEmporium.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
    .add-product-container {
        max-width: 500px;
        margin: 0 auto;
        margin-top: 10%;
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

<div class="add-product-container">
    <h3>Add a New Product</h3>
    <div class="form-group">
        <asp:Label runat="server" Text="Product Name" AssociatedControlID="edtProductName" />
        <asp:TextBox runat="server" ID="edtProductName" CssClass="form-control" />
    </div>
    <div class="form-group">
        <asp:Label runat="server" Text="Description" AssociatedControlID="edtDescription" />
        <asp:TextBox runat="server" ID="edtDescription" TextMode="MultiLine" Rows="4" CssClass="form-control" />
    </div>
    <div class="form-group">
        <asp:Label runat="server" Text="Price" AssociatedControlID="edtPrice" />
        <asp:TextBox runat="server" ID="edtPrice" CssClass="form-control" />
    </div>
    <div class="form-group">
        <asp:Label runat="server" Text="Image URL" AssociatedControlID="edtImageUrl" />
        <asp:TextBox runat="server" ID="edtImageUrl" CssClass="form-control" />
    </div>
    <asp:Label runat="server" ID="lblMessage" ForeColor="Red" />
    <asp:Button runat="server" Text="Add Product" ID="btnAddProduct" OnClick="btnAddProduct_Click" CssClass="btn btn-primary" />
</div>
</asp:Content>

