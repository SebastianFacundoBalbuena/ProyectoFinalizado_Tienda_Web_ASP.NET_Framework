<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallesArticulo.aspx.cs" Inherits="WebApplication.DetallesArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%if (Request.QueryString["ID"] != null)
        {
            string id = Request.QueryString["ID"];
            int ID = int.Parse(id);

            Dominio.Articulos Articulo = Lista.Find(x => x.Id == ID);





    %>

    <div class="col" style="width: 600px; position: relative; left: 27%;">
        <h1 style="position:relative;left:80px">Detalles del producto</h1>
        <br />
        <div class="card" style="width:500px; border:none">
            <div style="width: 50%; position: relative; left: 150px; ">
                <img src="<%:Articulo.Imagen %>" class="card-img-top" alt="...">
            </div>

            <div class="card-body" style="position:relative; left:140px">
                <h5 class="card-title">Producto: <%:Articulo.Nombre %></h5>
                <p class="card-text">Descripcion : <%:Articulo.Descripcion %></p>
                <p class="card-text"><small class="text-body-secondary">Categoria : <%:Articulo.Categoria %></small></p>
                <p class="card-text"><small class="text-body-secondary">Marca : <%:Articulo.Marca %></small></p>
                <p class="card-text"><small class="text-body-secondary">AR$<%:Articulo.Precio %></small></p>
                <p class="card-text"><small class="text-body-secondary">Codigo: <%: Articulo.Codigo %></small></p>
                <asp:Button Text="Volver a la Pag. principal" CssClass="btn btn-primary" runat="server" ID="botonVolverdeDetalles" OnClick="botonVolverdeDetalles_Click" />
            </div>
        </div>
    </div>


    <%  } %>
</asp:Content>
