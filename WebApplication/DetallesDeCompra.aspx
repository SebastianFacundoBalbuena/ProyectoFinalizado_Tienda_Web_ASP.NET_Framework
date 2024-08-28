<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallesDeCompra.aspx.cs" Inherits="WebApplication.DetallesDeCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card text-center" style="justify-content: center; display: flex; align-items: center; overflow: hidden">
        <div class="card-header">
        </div>
        <div class="card-body" style="width: 600px;">
            <h5 class="card-title">Tu lista de productos a comprar : </h5>

            <asp:Button Text="Confirmar compra" CssClass="btn btn-info" runat="server" ID="AceptarCompra" OnClick="AceptarCompra_Click" />
            <asp:Button Text="Volver al Stock" CssClass="btn btn-primary" runat="server" ID="VolverInicio" OnClick="VolverInicio_Click" />
            <br />
            <asp:Label ID="labelPrecioTotal" style="font-size:20px" Text="Precio total : AR$0" runat="server" />
            <br />
            
            <a href="#">
                <img src="https://cdn-icons-png.flaticon.com/512/3225/3225209.png" alt="Carrito de Compras" style=" width: 35px; height: auto; margin: 8px">
            </a>
            <asp:Label ID="labelCantidad" Style="color: black; font-size: 20px;" Text="0" runat="server" />
        </div>
    </div>

    <br />

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <asp:Repeater ID="repetidor" runat="server">
            <ItemTemplate>

                <div class="card mb-3" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="<%#Eval("Imagen") %>" class="img-fluid rounded-start" alt="ErrorDeCarga" style="margin-top: 20px">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body" style="overflow:hidden">
                                <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                <p class="card-text"><%#Eval("Marca") %>.</p>
                                <p class="card-text"><%#Eval("Descripcion") %>.</p>
                                <p class="card-text"><small class="text-body-secondary">AR$<%#Eval("Precio") %></small></p>
                                <asp:Button ID="EliminarDelCarrito" CssClass="btn btn-danger" Text="Eliminar del Carrito" runat="server" Style="margin: 6px" CommandArgument='<%#Eval("Id")%>' OnClick="EliminarDelCarrito_Click" />
                                <div style="position: relative; left: 35px">
                                    <asp:Button CssClass="btn btn-primary" Text="Ver detalles" runat="server" ID="detalles" CommandArgument='<%#Eval("Id") %>' OnClick="detalles_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
