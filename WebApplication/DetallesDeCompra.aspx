<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallesDeCompra.aspx.cs" Inherits="WebApplication.DetallesDeCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <!-- Barra inicio -->
            <div class="card text-center mb-4" style="border: 1px solid #dee2e6; border-radius: 0.5rem; background-color: #ffffff;">
                <div class="card-header" style="background-color: #007bff; color: white;">
                    <h5 class="card-title" style="margin: 0;">Tu lista de productos a comprar:</h5>
                </div>
                <div class="card-body" style="padding: 1rem;">
                    <div class="d-flex justify-content-center align-items-center gap-2 mb-3">
                        <asp:Button Text="Confirmar compra" CssClass="btn btn-info" runat="server" ID="AceptarCompra" OnClientClick="return Confirmacion()"
                            Style="border-radius: 0.25rem; background-color: #17a2b8; border-color: #17a2b8; padding: 0.5rem 1rem;" />
                        <asp:Button Text="Volver al Stock" CssClass="btn btn-primary" runat="server" ID="VolverInicio" OnClick="VolverInicio_Click"
                            Style="border-radius: 0.25rem; background-color: #007bff; border-color: #007bff; padding: 0.5rem 1rem;" />
                    </div>
                    <asp:Label ID="labelPrecioTotal" Style="font-size: 20px; color: #333;" Text="Precio total : AR$0" runat="server" />
                    <br />
                    <a href="#" class="d-inline-block" style="margin: 8px;">
                        <img src="https://cdn-icons-png.flaticon.com/512/3225/3225209.png" alt="Carrito de Compras" class="img-fluid"
                            style="width: 35px; height: auto;" />
                    </a>
                    <asp:Label ID="labelCantidad" CssClass="d-inline-block ms-2" Style="font-size: 20px; color: black;" Text="0" runat="server" />
                </div>
            </div>

            <br />

            <!-- Lista a comprar -->
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <asp:Repeater ID="repetidor" runat="server">
                    <ItemTemplate>
                        <div class="card mb-4" style="border: 1px solid #dee2e6; border-radius: 0.5rem; box-shadow: 0 4px 8px rgba(0,0,0,0.2); overflow: hidden; height: 380px; width: 330px">
                            <div class="row g-0" style="display: flex; justify-content: center">
                                <div class="col-md-12" style="overflow: hidden; width: 70%; height: 160px">
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
                                            <asp:Button ID="EliminarDelCarrito" CssClass="btn btn-danger" Text="Eliminar del Carrito" runat="server"
                                                CommandArgument='<%#Eval("Id")%>' OnClick="EliminarDelCarrito_Click"
                                                Style="background-color: #dc3545; border-color: #dc3545; border-radius: 0.25rem; padding: 0.5rem 1rem;" />
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

    <!-- Div alerta: confirmación de compra -->
    <div id="customAlert" class="custom-alert-content" style="display: none; position: fixed; left: 50%; top: 40%; transform: translate(-50%, -50%); background-color: rgba(144, 238, 144, 0.5); z-index: 1000; padding: 20px; border-radius: 0.5rem;">
        <div class="alert alert-success" role="alert" style="margin-bottom: 1rem;">
            ¡Compra realizada exitosamente!
        </div>
        <div>
            <asp:Button ID="btnAceptar" class="btn btn-success" Style="border-radius: 0.25rem; padding: 0.5rem 1rem;" OnClick="btnAceptar_Click" Text="Aceptar" runat="server" />
        </div>
    </div>

    <script>
        function Confirmacion() {
            document.getElementById('customAlert').style.display = 'block';
            return false;
        }
    </script>

</asp:Content>
