<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ATS.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <div class="register-container" style="max-width: 400px; margin: 0 auto; padding: 20px; background-color: #f9f9f9; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <h2 class="text-center" style="margin-bottom: 20px;">Kayıt Ekle</h2>
            
            <asp:TextBox ID="tboxusername" runat="server" CssClass="form-control" Placeholder="Kullanıcı Adı"></asp:TextBox>
            <br />
            <asp:TextBox ID="tboxpassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Parola"></asp:TextBox>
            <br />
            <asp:DropDownList ID="statu" runat="server" CssClass="form-control">
    <asp:ListItem Text="Usta" Value="usta" />
    <asp:ListItem Text="Çırak" Value="cirak" />
    <asp:ListItem Text="Kalfa" Value="kalfa" />
</asp:DropDownList>
<br />

            <asp:Button ID="btnregister" runat="server" OnClick="btnregister_Click" Text="Kullanıcı Ekle" CssClass="btn btn-primary btn-block" />
            
            
            <asp:Label ID="lblMessage" runat="server" CssClass="text-center" style="display:block; margin-top: 10px; font-weight: bold; color: green;"></asp:Label>
        </div>
  
</asp:Content>
