<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true"
    CodeBehind="vehicles.aspx.cs" Inherits="ATS.Vehicles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>

        .content-card{
            background: rgba(255,255,255,0.85);
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,.15);
            padding: 24px;
            margin: 20px 0;
        }

        .page-header {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 10px auto 24px;
            font-family: Arial, sans-serif;
            color: #333;
            background-color: rgba(255, 255, 255, 0.7);
            padding: 20px;
            border-radius: 12px;
            max-width: 110%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .page-header h1 {
            font-size: 2em;
            color: #222;
            margin-bottom: 8px;
            text-align: center;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }
        .page-header p {
            font-size: 1.1em;
            color: #555;
            margin-bottom: 0;
            text-align: center;
        }

        .car-listing {
            position: relative;
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif;
            color: #333;
        }
        .car-listing h3 { margin: 0 0 10px; color: #444; font-size: 1.5em; }
        .car-listing p { margin: 5px 0; line-height: 1.6; }
        .car-listing .label { font-weight: bold; color: #555; }
        .car-listing .value { color: #333; }
        .car-listing hr { border: 0; border-top: 1px solid #e0e0e0; margin: 15px 0; }

        .delete-button {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #ff4d4d;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 0.9em;
        }
        .delete-button:hover { background-color: #ff1a1a; }
    </style>

    <div class="content-card">
        <div class="page-header">
            <h1>Araç Listesi</h1>
            <p>Bu sayfada mevcut araçları görebilir ve istediğiniz araçları silebilirsiniz.</p>
        </div>

        <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" OnItemDataBound="DataList1_ItemDataBound">
            <ItemTemplate>
                <div class="car-listing" id="car_<%# Eval("Id") %>">
                    <asp:Button 
                        ID="DeleteButton" 
                        runat="server" 
                        CommandArgument='<%# Eval("ID") %>' 
                        Text="Sil" 
                        OnCommand="DeleteButton_Command" 
                        CssClass="delete-button"
                        OnClientClick="return confirm('Bu aracı silmek istediğinize emin misiniz?');" />
                    <h3>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("MarkaAdi") %>'></asp:Label>
                        &nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ArabaModeli") %>'></asp:Label>
                    </h3>
                    <p>
                        <span class="label">Plaka:</span>
                        <span class="value">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("ArabaPlakasi") %>'></asp:Label>
                        </span>
                    </p>
                    <p>
                        <span class="label">Yakıt Tipi:</span>
                        <span class="value">
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("ArabaYakitTipi") %>'></asp:Label>
                        </span>
                    </p>
                    <hr />
                    <p>
                        <span class="label">Açıklama:</span>
                        <span class="value">
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("ArabaAciklama") %>'></asp:Label>
                        </span>
                    </p>
                    <hr />
                    <p>
                        <span class="label">Sahip:</span>
                        <span class="value">
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("SahipIsim") %>'></asp:Label>
                        </span>
                        &nbsp;&nbsp;
                        <span class="label">Tel:</span>
                        <span class="value">
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("SahipTel") %>'></asp:Label>
                        </span>
                    </p>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>

</asp:Content>
