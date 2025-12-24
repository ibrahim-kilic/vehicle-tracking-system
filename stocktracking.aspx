<%@ Page Title="Stok Takip" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="stocktracking.aspx.cs" Inherits="ATS.StockTracking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <style>
    .page-header {
      display:flex; flex-direction:column; align-items:center; justify-content:center;
      margin:20px auto; color:#333; background:rgba(255,255,255,.85);
      padding:24px; border-radius:12px; max-width:960px;
      box-shadow:0 4px 8px rgba(0,0,0,.15);
    }
    .page-header h1 { margin:0 0 8px; }


    .content-card{
      background:#fff; border-radius:12px; box-shadow:0 4px 12px rgba(0,0,0,.12);
      max-width:960px; margin:20px auto; padding:24px;
    }

    .form-group{ margin-bottom:12px; }
    .form-control{ width:100%; }
    .action-bar{ margin-bottom:12px; }


    .table { width:100%; border-collapse:collapse; }
    .table th, .table td { text-align:center; }
    .col-actions{ width:90px; }


    .success-message{
      margin-top:12px; padding:10px; background:#d4edda; border:1px solid #c3e6cb;
      color:#155724; border-radius:6px; display:block;
    }
  </style>

  <div class="page-header">
    <h1>Stok Takibi</h1>
    <p>Sistemdeki parça ve malzemelerin stok miktarını buradan görüntüleyebilirsiniz.</p>
  </div>

  <div class="content-card">
    <asp:Button ID="btnYeniParca" runat="server" Text="+ Yeni Parça"
                CssClass="btn btn-primary action-bar" OnClick="btnYeniParca_Click" />

    <asp:Panel ID="panelParcaEkle" runat="server" Visible="false">
      <h2 class="section-title">Yeni Parça Ekle</h2>
      <div class="form-group">
        <label>Parça Adı:</label>
        <asp:TextBox ID="txtParcaAdi" runat="server" CssClass="form-control" />
      </div>
      <div class="form-group">
        <label>Marka:</label>
        <asp:TextBox ID="txtMarka" runat="server" CssClass="form-control" />
      </div>
      <div class="form-group">
        <label>Miktar:</label>
        <asp:TextBox ID="txtMiktar" runat="server" CssClass="form-control" TextMode="Number" />
      </div>
      <div class="form-group">
        <label>Fiyat:</label>
        <asp:TextBox ID="txtFiyat" runat="server" CssClass="form-control" TextMode="Number" />
      </div>
      <asp:Button ID="btnEkle" runat="server" Text="Ekle" CssClass="btn btn-primary" OnClick="btnEkle_Click" />
      <hr />
    </asp:Panel>

    <asp:GridView ID="gvParcalar" runat="server"
                  AutoGenerateColumns="false"
                  CssClass="table table-bordered"
                  OnRowCommand="gvParcalar_RowCommand"
                  OnRowDataBound="gvParcalar_RowDataBound">
      <Columns>
        <asp:BoundField DataField="ParcaAdi" HeaderText="Parça" />
        <asp:BoundField DataField="Marka" HeaderText="Marka" />
        <asp:BoundField DataField="Fiyat" HeaderText="Fiyat (₺)" />
        <asp:BoundField DataField="StokDurumu" HeaderText="Stok Durumu" />
        <asp:TemplateField HeaderText="İşlem">
          <ItemStyle CssClass="col-actions" />
          <ItemTemplate>
            <asp:Button ID="btnSil" runat="server" Text="Sil" CommandName="Sil"
                        CommandArgument='<%# Eval("ParcaID") %>'
                        CssClass="btn btn-danger btn-sm"
                        OnClientClick="return confirm('Bu parçayı silmek istiyor musunuz?');" />
          </ItemTemplate>
        </asp:TemplateField>
      </Columns>
    </asp:GridView>


    <asp:Panel ID="panelHareket" runat="server">
         <h2 class="section-title">Parça Hareketi Ekle</h2>
      <div class="form-group">
        <label>Parça Seç:</label>
        <asp:DropDownList ID="ddlParcalar" runat="server" CssClass="form-control" />
      </div>
      <div class="form-group">
        <label>İşlem Türü:</label>
        <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
          <asp:ListItem Text="Giriş" Value="Giris" />
          <asp:ListItem Text="Çıkış" Value="Cikis" />
        </asp:DropDownList>
      </div>
      <div class="form-group">
        <label>Miktar:</label>
        <asp:TextBox ID="txtHareketMiktar" runat="server" CssClass="form-control" TextMode="Number" />
      </div>
      <asp:Button ID="btnHareketEkle" runat="server" Text="Hareket Ekle"
                  CssClass="btn btn-primary" OnClick="btnHareketEkle_Click" />
      <asp:Label ID="lblHareketMesaj" runat="server" CssClass="success-message" Visible="false"></asp:Label>
    </asp:Panel>
  </div>

</asp:Content>
