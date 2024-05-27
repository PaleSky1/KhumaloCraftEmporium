<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyWork.aspx.cs" Inherits="KhumaloCraftEmporium.MyWork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .product-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .product-item {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }

        .product-item img {
            max-width: 100px;
            margin-right: 20px;
        }

        .product-details {
            flex-grow: 1;
        }

        .product-name {
            font-size: 18px;
            font-weight: bold;
        }

        .product-price {
            font-size: 16px;
            color: #007bff;
        }

        .btn-add-to-cart {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            background-color: #28a745;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-add-to-cart:hover {
            background-color: #218838;
        }
    </style>

    <div class="product-container">
        <h3>Available Products</h3>
        <asp:Repeater ID="ProductsRepeater" runat="server">
            <ItemTemplate>
                <div class="product-item">
                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("ProductName") %>' />
                    <div class="product-details">
                        <div class="product-name"><%# Eval("ProductName") %></div>
                        <div class="product-description"><%# Eval("Description") %></div>
                        <div class="product-price">R<%# Eval("Price") %></div>
                    </div>
                    <asp:Button runat="server" Text="Add to Cart" CommandArgument='<%# Eval("ProductID") %>' OnClick="AddToCart_Click" CssClass="btn-add-to-cart" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
