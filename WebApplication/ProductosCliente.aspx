<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductosCliente.aspx.cs" Inherits="WebApplication.ProductosCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <!-- Barra de búsqueda y botones -->
            <div class="card text-center mb-4" style="border: 1px solid #dee2e6; border-radius: 0.5rem; background-color: #ffffff;">
                <div class="card-header" style="background-color: #007bff; color: white;">
                    <h5 class="card-title" style="margin: 0;">Lista de productos:</h5>
                </div>
                <div class="card-body" style="padding: 1rem;">
                    <div class="d-flex justify-content-center align-items-center gap-2 mb-3">
                        <asp:TextBox ID="barraBuscar" CssClass="form-control" runat="server" placeholder="Buscar por: Producto/Marca/Categoría"
                            Style="width: 400px; border-radius: 0.25rem; border: 1px solid #ced4da;" />
                        <asp:Button Text="Buscar/Refrescar" CssClass="btn btn-primary" runat="server" ID="BuscarArticulos" OnClick="BuscarArticulos_Click"
                            Style="border-radius: 0.25rem; background-color: #007bff; border-color: #007bff; padding: 0.5rem 1rem;" />
                        <asp:Button Text="Volver al inicio" CssClass="btn btn-secondary" runat="server" ID="VolverInicio" OnClick="VolverInicio_Click"
                            Style="border-radius: 0.25rem; background-color: #6c757d; border-color: #6c757d; padding: 0.5rem 1rem;" />
                    </div>
                    <a href="DetallesDeCompra.aspx" class="d-inline-block" style="margin: 8px;">
                        <img src="https://cdn-icons-png.flaticon.com/512/3225/3225209.png" alt="Carrito de Compras" class="img-fluid"
                            style="width: 35px; height: auto;" />
                    </a>
                    <asp:Label ID="labelCantidad" CssClass="d-inline-block ms-2" Style="font-size: 20px; color: black;" Text="0" runat="server" />
                </div>
            </div>

            <!-- Cargar todos los artículos disponibles -->
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <asp:Repeater ID="repetidor" runat="server">
                    <ItemTemplate>
                        <div class="card mb-4" style="border: 1px solid #dee2e6; border-radius: 0.5rem; box-shadow: 0 4px 8px rgba(0,0,0,0.2); overflow: hidden; height: 380px; width: 330px">
                            <div class="row g-0" style="display: flex; justify-content: center">
                                <div class="col-md-12" style="overflow: hidden; width: 70%; height: 160px;">
                                    <img src="<%#Eval("Imagen") %>" class="img-fluid" alt="Error de carga"
                                        style="width: 100%; height: 100%; object-fit: contain;" />
                                </div>
                                <div class="col-md-12" style="height: 210px">
                                    <div class="card-body" style="background-color: #ffffff; color: #333;">
                                        <h5 class="card-title" style="margin-bottom: 0.5rem;"><%#Eval("Nombre") %></h5>
                                        <p class="card-text" style="margin-bottom: 0.5rem;"><%#Eval("Marca") %></p>
                                        <p class="card-text" style="margin-bottom: 0.5rem;"><%#Eval("Descripcion") %></p>
                                        <p class="card-text"><small class="text-muted" style="color: #6c757d;">AR$<%#Eval("Precio") %></small></p>
                                        <div class="d-flex gap-2">
                                            <asp:Button ID="AgregarCarrito" CssClass="btn btn-info" Text="Agregar al carrito" runat="server" CommandArgument='<%#Eval("Id")%>' OnClick="AgregarCarrito_Click"
                                                Style="background-color: #17a2b8; border-color: #17a2b8; border-radius: 0.25rem; padding: 0.5rem 1rem;" />
                                            <asp:Button CssClass="btn btn-primary" Text="Ver detalles" runat="server" ID="detalles" CommandArgument='<%#Eval("Id") %>' OnClick="detalles_Click"
                                                Style="background-color: #007bff; border-color: #007bff; border-radius: 0.25rem; padding: 0.5rem 1rem;" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
