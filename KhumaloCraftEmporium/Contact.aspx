<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="KhumaloCraftEmporium.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .contact-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .contact-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .contact-header h1 {
            font-size: 36px;
            color: #333;
        }

        .contact-info, .contact-form {
            margin-bottom: 20px;
        }

        .contact-info h2, .contact-form h2 {
            font-size: 24px;
            color: #007bff;
            margin-bottom: 20px;
        }

        .contact-info p, .contact-form p {
            font-size: 16px;
            color: #555;
        }

        .form-group label {
            font-size: 16px;
            color: #333;
        }

        .form-control {
            margin-bottom: 15px;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            font-size: 18px;
            padding: 10px 20px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .contact-image {
            width: 100%;
            height: auto;
            border-radius: 20px;
            margin-top: 20px;
        }
    </style>

    <div class="container contact-container">
        <div class="contact-header">
            <h1>Contact Us</h1>
            <p>Have a question or want to get in touch? We'd love to hear from you! You can reach us using the details below:</p>
        </div>
        <div class="row">
            <div class="col-md-6 contact-info">
                <h2>Location</h2>
                <p>123 Unknown Street</p>
                <p>NoWhere, Country</p>
                <h2>Contact Information</h2>
                <p>Email: info@craftsshop.com</p>
                <p>Phone: 000 000 0000</p>
                <img src="imgLibrary/pexels-wallace-chuck-2974110.jpg" alt="Sewing" class="contact-image">
            </div>
            <div class="col-md-6 contact-form">
                <h2>Send us a Message</h2>
                <form>
                    <div class="form-group">
                        <label for="name">Your Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter your name">
                    </div>
                    <div class="form-group">
                        <label for="email">Your Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter your email">
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea class="form-control" id="message" rows="5" placeholder="Enter your message"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Send Message</button>
                </form>
            </div>
        </div>
    </div>
</asp:Content>

