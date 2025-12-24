<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="ATS.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hakkımızda</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.8;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            font-size: 2.2em;
            color: #444;
            text-align: center;
        }
        p {
            font-size: 1.2em;
            margin: 15px 0;
        }
        .highlight {
            color: #e63946;
            font-weight: bold;
        }
        .image-container {
            text-align: center;
            margin-top: 20px;
        }
        .image-container img {
            width: 70%;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hakkımızda</h1>
        <p>
            Araba tamircileri için özel olarak geliştirdiğimiz bu uygulama ile 
            <span class="highlight">tamir işlemlerini kolayca takip edebilir</span>, 
            geçmiş tamir kayıtlarına hızlıca ulaşabilirsiniz.
        </p>
        <p>
            Amacımız, tamir süreçlerini daha düzenli ve verimli hale getirerek hem 
            <span class="highlight">müşteri memnuniyetini artırmak</span> 
            hem de iş yükünüzü hafifletmektir.
        </p>
        <p>
            Kullanıcı dostu arayüzümüz ile araçların hangi işlemlerden geçtiğini detaylı bir şekilde kaydedebilir, 
            dilediğiniz zaman bu bilgilere kolayca ulaşabilirsiniz.
        </p>
        <p>
            Daha iyi bir servis deneyimi için sürekli olarak gelişiyor ve yenilikler sunmaya devam ediyoruz.
        </p>
        <div class="image-container">
            <img src="An_artistic_digital_illustration_showing_a_clean_a.png" alt="Tamirhane Görseli">
        </div>
    </div>
</body>

</html>

</asp:Content>
