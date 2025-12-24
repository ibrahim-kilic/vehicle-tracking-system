<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ATS.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Giriş Yap</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('araba.jpg') no-repeat center center fixed;
            background-size: cover;
            
        }

        
        .overlay {
            background-color: rgba(255, 255, 255, 0.85);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .login-container {
            max-width: 400px;
            margin: 150px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-control {
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .btn {
            width: 96%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #337ab7;
        }

        .btn:active {
            background-color: #2e6da4;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="overlay"></div>
        <div class="login-container">
            <h2>Giriş Yap</h2>
            <asp:TextBox ID="tboxusername" runat="server" CssClass="form-control" Placeholder="Kullanıcı Adı"></asp:TextBox>
            <asp:TextBox ID="tboxpassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Parola"></asp:TextBox>
            <asp:Button ID="btnlogin" runat="server" Text="Giriş Yap" OnClick="btnlogin_Click" CssClass="btn" />
        </div>
    </form>
</body>
</html>
