<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card h-100" >
                <img src="https://static.vecteezy.com/system/resources/previews/005/992/461/non_2x/electronics-store-that-sells-computers-tv-cellphones-and-buying-home-appliance-product-in-flat-background-illustration-for-poster-or-banner-vector.jpg"  class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Productos</h5>
                    <p class="card-text">Acceder a la lista completa de productos disponibles en tu inventario. Aquí podrás ver detalles, agregar nuevos productos, editar información existente y gestionar todo lo relacionado con tu catálogo de productos.</p>
                    <asp:Button Text="Stock de Productos" class="btn btn-primary" ID="botonStock" runat="server" OnClick="botonStock_Click" />
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://as1.ftcdn.net/v2/jpg/02/91/37/72/1000_F_291377253_pagHOuN0u74njvL3ksTEDZEEpx4qRis7.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Registros</h5>
                    <p class="card-text"> Consultar y gestionar todos los registros de ventas. Generar informes detallados para apoyar la toma de decisiones estratégicas.</p>
                    <asp:Button Text="Registro de ventas" class="btn btn-primary" ID="botonRegistros"  runat="server" />
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100 " >
                <img src="https://img.freepik.com/vector-gratis/gerentes-ventas-laptops-tabla-crecimiento-crecimiento-ventas-concepto-gestion-contabilidad-promocion-ventas-operaciones-sobre-fondo-blanco_335657-1704.jpg?w=360" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Reportes</h5>
                    <p class="card-text">Acceso a los informes y análisis detallados sobre el desempeño de tus productos y operaciones. Obtener recomendaciones basadas en datos para optimizar procesos y mejorar la rentabilidad.</p>
                    <asp:Button Text="Reportes de ventas" class="btn btn-primary" ID="botonReportes" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
