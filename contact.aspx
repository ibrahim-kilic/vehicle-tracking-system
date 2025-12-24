<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true"
    CodeBehind="contact.aspx.cs" Inherits="ATS.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>İletişim</title>
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
        .contact-info {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        .contact-info p {
            margin: 10px 0;
            font-size: 1.1em;
        }
        .contact-form {
            margin-top: 20px;
        }
        .contact-form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .contact-form button {
            background-color: #e63946;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .contact-form button:hover {
            background-color: #d62839;
        }
        .footer {
            text-align: center;
            margin-top: 30px;
            font-size: 0.9em;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>İletişim</h1>
        <p>
            Bizimle iletişime geçmek için aşağıdaki bilgileri kullanabilirsiniz. 
            <span class="highlight">Her türlü soru ve geri bildirim için bize ulaşabilirsiniz.</span>
        </p>
        <div class="contact-info">
            <p><strong>Telefon:</strong> 0551 163 5621</p>
            <p><strong>Email:</strong> <a href="mailto:dmforibo@gmail.com">dmforibo@gmail.com</a></p>
        </div>

        <div class="footer">
            &copy; 2025 Tüm Hakları Saklıdır.
        </div>
    </div>
</body>

</html>

</asp:Content>
