<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="WebApplication.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card mb-3" style="width: 600px; height: 600px; position: relative; left: 25%; overflow:auto">
        <img src="https://img.freepik.com/vector-premium/advertencia-error-sistema-operativo-ventana-mensaje-emergente-ventana-dialogo-falla-sistema-diseno-plano_812892-54.jpg" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">Hubo un error.</h5>
            <p id="mensajeDeError" class="card-text" runat="server"></p>
            <p class="card-text"><small class="text-body-secondary">Volver al inicio</small></p>
            <asp:Button Text="Volver al inicio" runat="server" ID="volverAlInicio" OnClick="volverAlInicio_Click" CssClass="btn btn-primary" Style="margin: 2px" />
        </div>
    </div>
</asp:Content>
