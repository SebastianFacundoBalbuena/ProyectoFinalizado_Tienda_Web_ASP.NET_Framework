<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card text-center" style="max-width: 600px; margin: 0 auto; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); overflow: hidden;">
        <div class="card-header" style="background-color: #007bff; color: white; border-bottom: 1px solid #dee2e6; border-top-left-radius: 8px; border-top-right-radius: 8px;">
            <h5 style="margin: 0;">Iniciar sesión</h5>
        </div>
        <div class="card-body" style="padding: 20px; background-color: #fff;">
            <asp:Label Text="Email" runat="server" Style="font-weight: bold; color: #333;" />
            <asp:TextBox ID="barraEmail" Type="Email" Style="margin: 8px 0; border-radius: 4px; border: 1px solid #dee2e6; padding: 10px;" CssClass="form-control" runat="server"></asp:TextBox>

            <asp:Label Text="Contraseña" runat="server" Style="font-weight: bold; color: #333;" />
            <asp:TextBox ID="barraContraseña" Type="Password" Style="margin: 8px 0; border-radius: 4px; border: 1px solid #dee2e6; padding: 10px;" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="CheckContraseñaVisible_CheckedChanged"></asp:TextBox>

            <% if (!string.IsNullOrEmpty(Pass))
                { %>
            <p style="color: #dc3545; margin: 8px 0;"><%: Pass %></p>
            <% } %>

            <asp:CheckBox Text="Mostrar contraseña" runat="server" AutoPostBack="true" ID="CheckContraseñaVisible" OnCheckedChanged="CheckContraseñaVisible_CheckedChanged"
                Style="margin: 10px 0; accent-color: #007bff;" />
            <br />
            <asp:Button Style="margin: 8px; background-color: #007bff; border-color: #007bff; color: white; border-radius: 4px; padding: 10px 20px; font-size: 16px;"
                CssClass="btn" Text="Iniciar sesión" runat="server" ID="BtnIniciarSesion" OnClick="BtnIniciarSesion_Click" />
            <asp:Button ID="botonRegistrarse" Style="margin: 8px; background-color: #17a2b8; border-color: #17a2b8; color: white; border-radius: 4px; padding: 10px 20px; font-size: 16px;"
                CssClass="btn" Text="Registrarse" runat="server" OnClick="botonRegistrarse_Click" />
            <br />
            <asp:Button Style="margin: 8px; background-color: #dc3545; border-color: #dc3545; color: white; border-radius: 4px; padding: 10px 20px; font-size: 16px;"
                CssClass="btn" Text="Cancelar" runat="server" ID="botonCancelar" OnClick="botonCancelar_Click" />
        </div>
    </div>

</asp:Content>
