<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true"
    CodeBehind="vehicleregister.aspx.cs" Inherits="ATS.VehicleRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="page-header">
        <h1>Araç Kayıt Formu</h1>
        <p>Yeni bir aracı sisteme eklemek için aşağıdaki formu doldurabilirsiniz.</p>
    </div>

    <div class="form-container">
        <div class="form-group">
            <label for="combobox">Araç Markası:</label>
            <asp:DropDownList ID="combobox" runat="server" CssClass="form-control dropdown-large" />
        </div>
        <div class="form-group">
            <label for="tboxmodel">Araç Modeli:</label>
            <asp:TextBox ID="tboxmodel" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="tboxplaka">Araç Plakası:</label>
            <asp:TextBox ID="tboxplaka" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="tboxyakit">Yakıt Tipi:</label>
            <asp:TextBox ID="tboxyakit" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="tboxaciklama">Açıklama - İşlem:</label>
            <asp:TextBox ID="tboxaciklama" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
        </div>
        <div class="form-group">
            <label for="tboxisim">Araç Sahibi İsim:</label>
            <asp:TextBox ID="tboxisim" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label for="tboxtel">Araç Sahibi Telefon:</label>
            <asp:TextBox ID="tboxtel" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <asp:Button ID="btnsend" runat="server" OnClick="btnsend_Click" Text="Ekle" CssClass="btn btn-primary" />
        </div>
    </div>

    <style>
        .page-header {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 20px auto;
            font-family: Arial, sans-serif;
            color: #333;
            background-color: rgba(255, 255, 255, 0.7); 
            padding: 30px;
            border-radius: 12px; 
            max-width: 110%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
        }

        .page-header h1 {
            font-size: 2.5em;
            color: #222;
            margin-bottom: 15px;
            text-align: center;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .page-header p {
            font-size: 1.3em;
            color: #555;
            margin-bottom: 0;
            text-align: center;
        }

        .form-container {
            width: 60%;
            margin: auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            height: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .dropdown-large {
            width: 100%;
            max-width: 100%;
            padding: 10px;
            font-size: 16px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            color: white;
            padding: 10px 15px;
            text-align: center;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>

</asp:Content>
