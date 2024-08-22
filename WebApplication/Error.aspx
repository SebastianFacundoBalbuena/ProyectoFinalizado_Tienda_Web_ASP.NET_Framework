<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="WebApplication.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card mb-3" style="width: 700px; position:relative; left:25%">
        <img src="https://img.freepik.com/vector-premium/advertencia-error-sistema-operativo-ventana-mensaje-emergente-ventana-dialogo-falla-sistema-diseno-plano_812892-54.jpg" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">Hubo un error en el formato</h5>
            <p class="card-text">Hubo un error en la escritura del formato ingresado, compruebe bien los datos a ingresar antes de aceptar por favor... </p>
            <p class="card-text"><small class="text-body-secondary">Volver al formulario</small></p>
            <asp:Button Text="Volver al formulario" runat="server" ID="volverAlFormulario" OnClick="volverAlFormulario_Click"  CssClass="btn btn-primary" style="margin:2px" />
            <br />
            <asp:Button Text="Volver al inicio" runat="server" ID="volverInicio"  OnClick="volverInicio_Click"  CssClass="btn btn-primary" style="margin:2px"/>
        </div>
    </div>
</asp:Content>
