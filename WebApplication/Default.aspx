<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col">
            <div class="card h-100" >
                <img src="https://media.istockphoto.com/id/1284455691/pt/foto/young-couple-in-shopping.jpg?s=612x612&w=0&k=20&c=KdqFtgtzTk8VHLh98f3s6GesASrqE6aKUndFAId0qKA=" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Productos</h5>
                    <p class="card-text">Acceder a la lista completa de productos disponibles en tu inventario. Aquí podrás ver detalles, agregar nuevos productos, editar información existente y gestionar todo lo relacionado con tu catálogo de productos.</p>
                    <asp:Button style="top:30px" Text="Stock de Productos" class="btn btn-primary" ID="botonStock" runat="server" OnClick="botonStock_Click" />
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100">
                <img src="https://cdn.euroinnova.edu.es/img/subidasEditor/19-1611787074.webp" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Registros</h5>
                    <p class="card-text"> Consultar y gestionar todos los registros de ventas. Generar informes detallados para apoyar la toma de decisiones estratégicas.</p>
                    <asp:Button Text="Registro de ventas" class="btn btn-primary" ID="botonRegistros"  runat="server" OnClick="botonRegistros_Click" />
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100 " >
                <img src="https://estudiocontablevmc.pe/wp-content/uploads/2015/01/registro-de-ventas-e-ingresos-1.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Reportes</h5>
                    <p class="card-text">Acceso a los informes y análisis detallados sobre el desempeño de tus productos y operaciones. Obtener recomendaciones basadas en datos para optimizar procesos y mejorar la rentabilidad.</p>
                    <asp:Button Text="Reportes de ventas" class="btn btn-primary" ID="botonReportes" runat="server" OnClick="botonReportes_Click" />
                </div>
            </div>
        </div>
    </div>
    <br />
    <asp:Button CssClass="btn btn-primary" Text="Modo cliente" runat="server"  ID="ModoCliente" OnClick="ModoCliente_Click"/>
</asp:Content>
