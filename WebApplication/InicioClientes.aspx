<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InicioClientes.aspx.cs" Inherits="WebApplication.InicioClientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="height: 380px" id="carouselExampleIndicators" class="carousel slide">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div style="height: 400px" class="carousel-inner">
            <div class="carousel-item active">
                <img style="height: 400px" src="https://academia.nubimetrics.com/hubfs/Produtos%20eletr%C3%B4nicos%20mais%20vendidos%20do%20Mercado%20Livre.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img style="height: 400px" src="https://www.grundig.com/content/dam/grundig/es/image/gama-electrodomesticos-significado.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img style="height: 400px" src="https://linea3cocinas.com/wp-content/uploads/2023/03/electrodomesticos-apilados.jpeg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <div class="card text-center">
        <div class="card-header">
            ¡Inicia sesión para acceder a la lista de Stock!
        </div>
        <div class="card-body">
            <h5 class="card-title">New Origins</h5>
            <p class="card-text">¡Conoce ya mismo los productos disponible en nuestra tienda!. </p>
            <asp:Button CssClass="btn btn-primary" Text="Productos disponibles" runat="server" ID="IrAProductos" OnClick="IrAProductos_Click" />
            <asp:Button CssClass="btn btn-primary" Text="Registrarse" runat="server" ID="botonRegistarse" OnClick="botonRegistarse_Click" />
        </div>
        <div class="card-footer text-body-secondary">
            Provincia de Bs As.
        </div>
    </div>

</asp:Content>
