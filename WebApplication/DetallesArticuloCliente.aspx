<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallesArticuloCliente.aspx.cs" Inherits="WebApplication.DetallesArticuloCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% if (Request.QueryString["ID"] != null)
        {
            string id = Request.QueryString["ID"];
            int ID = int.Parse(id);

            Dominio.Articulos Articulo = Lista.Find(x => x.Id == ID);
    %>

    <div style="width: 90%; max-width: 400px; margin: 0 auto; background-color: #f0f4f8; padding: 20px;">
        <h1 style="color: #000; text-align: center; font-size: 1.5rem;">Detalles del producto</h1>
        <br />
        <div style="background-color: #ffffff; border: 1px solid #ddd; border-radius: 8px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); padding: 10px;">
            <div style="display: flex; justify-content: center">
                <img src="<%: Articulo.Imagen %>" style="width: 50%; height: auto; border-radius: 8px;" alt="Producto">
            </div>
            <div style="padding: 10px;">
                <h5 style="color: #000; font-size: 1.2rem;">Producto: <%: Articulo.Nombre %></h5>
                <p style="color: #555; font-size: 0.9rem;">Descripción: <%: Articulo.Descripcion %></p>
                <p style="color: #555; font-size: 0.9rem;"><small>Categoría: <%: Articulo.Categoria %></small></p>
                <p style="color: #555; font-size: 0.9rem;"><small>Marca: <%: Articulo.Marca %></small></p>
                <p style="color: #555; font-size: 0.9rem;"><small>AR$<%: Articulo.Precio %></small></p>
                <asp:Button Text="Volver a la Pag. principal" Style="background-color: #007bff; border: none; color: #fff; padding: 8px 16px; text-align: center; text-decoration: none; display: inline-block; font-size: 0.9rem; border-radius: 5px; cursor: pointer;" runat="server" ID="botonVolverde" OnClick="botonVolverde_Click" />
            </div>
        </div>
    </div>

    <% } %>
</asp:Content>


