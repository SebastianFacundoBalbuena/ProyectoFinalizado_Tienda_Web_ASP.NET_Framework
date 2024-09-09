<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="WebApplication.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="display: flex; justify-content: center; align-items: center; height: 70vh; background-color: #f0f2f5; padding: 20px;">
        <div style="max-width: 400px; width: 100%; background-color: #ffffff; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; padding: 20px;">
            <img src="https://img.freepik.com/vector-premium/advertencia-error-sistema-operativo-ventana-mensaje-emergente-ventana-dialogo-falla-sistema-diseno-plano_812892-54.jpg"
                alt="Error"
                style="max-width: 100%; height: auto; border-radius: 8px; margin-bottom: 15px;" />
            <h1 style="font-size: 24px; color: #333; margin-bottom: 15px;">¡Ups! Algo salió mal.</h1>
            <p id="mensajeDeError" class="card-text" runat="server" style="font-size: 16px; color: #666; margin-bottom: 15px;"></p>
            <p style="font-size: 14px; color: #999; margin-bottom: 20px;"><small>Lo sentimos por los inconvenientes. Por favor, regresa a la página principal.</small></p>
            <asp:Button Text="Volver al inicio" runat="server" ID="volverAlInicio" OnClick="volverAlInicio_Click"
                CssClass="btn btn-primary"
                Style="background-color: #007bff; border-color: #007bff; color: #fff; border-radius: 4px; padding: 8px 16px; font-size: 14px; cursor: pointer;" />
        </div>
    </div>


</asp:Content>
