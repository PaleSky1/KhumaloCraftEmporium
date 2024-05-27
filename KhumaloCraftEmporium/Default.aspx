<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KhumaloCraftEmporium._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" align="center">
    <div class="container" align="center">
        <div class="row" id="craftProjects">
            <div class="col-md-12">
                <div>
                    <h1>Welcome to KhumaloCraft Emporium</h1>
                    <img id="recommendedImage" src="/imgLibrary/pexels-conojeghuo-175709.jpg" alt="Recommended Image" style="width: 100%; max-height: 550px; border-radius: 20px; display: block; margin: 0 auto;"/>
                </div>
            </div>    
        </div>
    </div>

    <div class="container-fluid">
        <div class="row text-center g-3 mt-4">
            <h1>Browse Categories</h1>
            <div class="col-md-4" style="margin-bottom: 15px;">
                <h3>Browse Sculptures</h3>
                <img src="/imgLibrary/pexels-thepaintedsquare-1652405.jpg" alt="Browse Sculptures" class="img-fluid" style="border-radius: 10px; width: 90%;">
            </div>
            <div class="col-md-4" style="margin-bottom: 15px;">
                <h3>Browse Paintings</h3>
                <img src="/imgLibrary/pexels-daiangan-102127 (1).jpg" alt="Browse Paintings" class="img-fluid" style="border-radius: 10px; width: 90%;">
            </div>
            <div class="col-md-4" style="margin-bottom: 15px;">
                <h3>Browse Carpentry</h3>
                <img src="/imgLibrary/pexels-conojeghuo-175709.jpg" alt="Browse Carpentry" class="img-fluid" style="border-radius: 10px; width: 90%;">
            </div>
        </div>
    </div>
    <script>
        var imageUrls = [
            "/imgLibrary/pexels-thepaintedsquare-1652405.jpg",
            "/imgLibrary/pexels-daiangan-102127 (1).jpg",
            "/imgLibrary/pexels-conojeghuo-175709.jpg"
        ];

        var currentIndex = 0;

        function changeImage() {
            var imageElement = document.getElementById("recommendedImage");
            imageElement.src = imageUrls[currentIndex];
            currentIndex = (currentIndex + 1) % imageUrls.length;
        }

        setInterval(changeImage, 10000);
    </script>
</asp:Content>
