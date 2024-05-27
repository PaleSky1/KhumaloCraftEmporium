<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shoping Cart.aspx.cs" Inherits="KhumaloCraftEmporium.Shoping_Cart" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .cart-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .cart-item {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .cart-item-name {
            font-size: 18px;
        }

        .cart-item-price {
            font-size: 16px;
            color: #007bff;
        }

        .btn-remove {
            padding: 5px 10px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            background-color: #dc3545;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-remove:hover {
            background-color: #c82333;
        }

        .total-price {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
        }

        .btn-order {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
            display: block;
            margin: 20px 0;
        }

        .btn-order:hover {
            background-color: #0056b3;
        }
    </style>

    <div class="cart-container">
        <h3>Your Shopping Cart</h3>
        <asp:Repeater ID="CartRepeater" runat="server">
            <ItemTemplate>
                <div class="cart-item">
                    <div class="cart-item-name"><%# Eval("ProductName") %></div>
                    <div class="cart-item-price">$<%# Eval("Price") %></div>
                    <asp:Button runat="server" Text="Remove" CommandArgument='<%# Eval("ProductID") %>' OnClick="RemoveFromCart_Click" CssClass="btn-remove" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="total-price">
            Total: R<asp:Label runat="server" ID="lblTotalPrice" />
        </div>
        <asp:Button runat="server" Text="Place Order" OnClick="PlaceOrder_Click" CssClass="btn-order" />
    </div>
</asp:Content>
