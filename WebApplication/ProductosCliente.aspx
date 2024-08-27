<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductosCliente.aspx.cs" Inherits="WebApplication.ProductosCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%//Barra de busqueda y boton agregar art. y volver al inicio %>
    <div class="card text-center" style="justify-content: center; display: flex; align-items: center; overflow: hidden">       
        <div class="card-header">
        </div>
        <div class="card-body" style="width: 600px;">
            <h5 class="card-title">Lista de productos : </h5>
            <asp:TextBox ID="barraBuscar" CssClass="form-control" Style="margin: 6px; padding-left: 140px" runat="server" placeholder="Buscar por : Produco/Marca/Categoria" />
            <asp:Button Text="Buscar/Refrescar" CssClass="btn btn-primary" runat="server" ID="BuscarArticulos" OnClick="BuscarArticulos_Click" />
            <asp:Button Text="Volver al inicio" CssClass="btn btn-primary" runat="server" ID="VolverInicio" OnClick="VolverInicio_Click" />
        </div>
        <a href="#"> <img src="https://cdn-icons-png.flaticon.com/512/3225/3225209.png" alt="Carrito de Compras" style=" position:sticky;left:500px ;width: 35px; height: auto; margin:8px"> 
            <asp:Label ID="labelCantidad" style="color:black; font-size:20px;" Text="0" runat="server" />
        </a>
    </div>

    <br />

    <%//Cargar todos los articulos disponibles  %>

    <div class="row row-cols-1 row-cols-md-3 g-4">

        <asp:Repeater ID="repetidor" runat="server">
            <ItemTemplate>

                <div class="card mb-3" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="<%#Eval("Imagen") %>" class="img-fluid rounded-start" alt="ErrorDeCarga" style="margin-top: 20px">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                <p class="card-text"><%#Eval("Marca") %>.</p>
                                <p class="card-text"><%#Eval("Descripcion") %>.</p>
                                <p class="card-text"><small class="text-body-secondary">AR$<%#Eval("Precio") %></small></p>
                                <asp:Button ID="AgregarCarrito" CssClass="btn btn-info" Text="Agregar al carrito" runat="server" style="margin:6px" CommandArgument='<%#Eval("Id")%>' OnClick="AgregarCarrito_Click" />
                                <div style="position:relative; left:25px">                                    
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
