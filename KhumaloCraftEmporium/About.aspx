<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="KhumaloCraftEmporium.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .about-container {
            padding: 30px 0;
        }
        .about-header {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .about-text {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        .about-image {
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .highlight {
            color: #007bff;
            font-weight: bold;
        }
      
        .artist-highlight {
            font-style: italic;
            color: #ff5722;
        }
    </style>

    <div class="container about-container">
        <div class="row">
            <div class="col-md-6">
                <h1 class="about-header">About Us</h1>
                <p class="about-text">Welcome to <span class="highlight"> KhumaloCraft Emporium</span>! Our platform is a vibrant community where artists and crafters come together to showcase and sell their unique creations. We are dedicated to supporting and promoting the incredible talent within our community.</p>
                <p class="about-text">At <span class="highlight"> KhumaloCraft Emporium</span>, we believe in the power of creativity and the beauty of handmade art. Our mission is to provide a space where artists can share their passion, connect with like-minded individuals, and reach customers who appreciate the value of artisanal work.</p>
                <p class="about-text">Whether you're an artist looking to display your work, or a buyer searching for that perfect piece, you'll find something special here. From stunning paintings to intricate jewelry, our collection is diverse and ever-growing.</p>
                <p class="about-text"><span class="artist-highlight">Join us</span> in celebrating the world of handmade art. Discover new artists, support their craft, and maybe even find your own inspiration along the way.</p>
                <a class="nav-link" runat="server" href="~/MyWork" style="color: #007bff; text-decoration: underline; font-size: 18px;">Explore Our Artists</a>
            </div>
            <div class="col-md-6">
                <img src="imgLibrary/pexels-cottonbro-studio-7482640.jpg" class="img-fluid about-image" alt="About Us Image">
            </div>
        </div>
    </div>
</asp:Content>

