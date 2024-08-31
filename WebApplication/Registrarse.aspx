<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="WebApplication.Registrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="card text-center" style="justify-content: center; display: flex; align-items: center; overflow: hidden; height: 500px">
        <div class="card-header">
        </div>
        <div class="card-body" style="width: 600px;">
            <h5 style="font-size: 30px" class="card-title">Registrarse </h5>

            <br />
            <br />
            <asp:Label Text="Nombre" runat="server" />
            <asp:TextBox ID="barraNombre" Style="margin: 4px" CssClass="form-control" runat="server"></asp:TextBox>

            <asp:Label Text="Apellido" runat="server" />
            <asp:TextBox ID="barraApellido" Style="margin: 4px" CssClass="form-control" runat="server"></asp:TextBox>


            <asp:Label Text="Email" runat="server" />
            <asp:TextBox ID="barraEmail" Type="Email" Style="margin: 4px" CssClass="form-control" runat="server"></asp:TextBox>

            <asp:Label Text="Contraseña" runat="server" />
            <asp:TextBox ID="barraContraseña" Type="Password" Style="margin: 4px" CssClass="form-control" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="botonRegistrarse" Style="margin: 2px" CssClass="btn btn-primary" Text="Registrarse" runat="server" OnClick="botonRegistrarse_Click" />
            <asp:Button ID="botonCancelar" Style="margin: 2px" CssClass="btn btn-danger" Text="Cancelar" runat="server" OnClick="botonCancelar_Click" />



        </div>
    </div>

</asp:Content>
