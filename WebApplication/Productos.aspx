<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="WebApplication.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <!-- Contenedor de título, búsqueda y botones volver e agregar artículo -->
            <div class="card text-center mb-4" style="border: 1px solid #dee2e6; border-radius: 0.5rem; background-color: #ffffff;">
                <div class="card-header" style="background-color: #007bff; color: white;">
                    <h5 class="card-title" style="margin: 0;">Lista de productos:</h5>
                </div>
                <div class="card-body" style="padding: 1rem;">
                    <div class="d-flex flex-column flex-md-row justify-content-center align-items-center gap-2">
                        <asp:TextBox ID="busquedaDeArticulos" CssClass="form-control"
                            Style="margin: 6px; width: 300px; max-width: 100%;" runat="server"
                            placeholder="Buscar por: Codigo/Producto/Marca/Categoria" AutoPostBack="true"
                            OnTextChanged="busquedaDeArticulos_TextChanged" />
                        <asp:Button Text="Buscar/Refrescar" CssClass="btn btn-primary" runat="server"
                            OnClick="busquedaDeArticulos_TextChanged"
                            Style="border-radius: 0.25rem; background-color: #007bff; border-color: #007bff;" />

                    </div>
                    <asp:Button Text="Agregar producto" runat="server" CssClass="btn btn-success"
                        OnClick="agregar_Click1"
                        Style="border-radius: 0.25rem; background-color: #28a745; border-color: #28a745;" />
                    <asp:Button Text="Volver al inicio" CssClass="btn btn-secondary" runat="server"
                        OnClick="Unnamed_Click"
                        Style="border-radius: 0.25rem; background-color: #6c757d; border-color: #6c757d;" />
                </div>
            </div>

            <br />

            <!-- Alerta de confirmación de eliminado de artículos -->
            <div id="customAlert" class="custom-alert-content" style="display: none; position: fixed; left: 50%; top: 40%; transform: translate(-50%, -50%); background-color: rgba(241, 148, 138, 0.5); z-index: 1000; padding: 20px; border-radius: 0.5rem;">
                <div class="alert alert-danger" role="alert" style="margin-bottom: 1rem;">
                    Desea eliminar este producto?
               
                </div>
                <div>
                    <asp:Button ID="btnEliminar" class="btn btn-danger" Style="border-radius: 0.25rem; padding: 0.5rem 1rem;"
                        Text="Eliminar" runat="server" OnClick="btnEliminar_Click" />
                    <asp:Button ID="btnCancelar" class="btn btn-secondary" Style="border-radius: 0.25rem; padding: 0.5rem 1rem;"
                        OnClientClick="return closeCustomAlert()" Text="Cancelar" runat="server" />
                </div>
            </div>

            <asp:HiddenField ID="hiddenFieldId" runat="server" />

            <script>
                function showCustomAlert(ID) {
                    if (ID != null || ID != "") {
                        document.getElementById('<%= hiddenFieldId.ClientID %>').value = ID;
                    }
                    document.getElementById('customAlert').style.display = 'block';
                    return false;
                }

                function closeCustomAlert() {
                    document.getElementById('customAlert').style.display = 'none';
                    return false;
                }
            </script>

            <!-- Mostrar listado de artículos -->
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <%
                    List<Dominio.Articulos> NewLista = new List<Dominio.Articulos>();

                    if (NuevaLista != null)
                    {
                        NewLista = NuevaLista;
                    }
                    else
                    {
                        NewLista = Lista;
                    }

                    if (NewLista != null)
                    {
                %>
                <asp:Repeater ID="repetidor" runat="server">
                    <ItemTemplate>
                        <div class="card mb-4" style="border: 1px solid #dee2e6; border-radius: 0.5rem; box-shadow: 0 4px 8px rgba(0,0,0,0.2); overflow: hidden; height: 420px; width: 330px;">
                            <div class="row g-0" style="display: flex; justify-content: center;">
                                <div class="col-md-12" style="overflow: hidden; width: 70%; height: 160px;">
                                    <img src="<%#Eval("Imagen") %>" class="img-fluid" alt="Error de carga"
                                        style="width: 100%; height: 100%; object-fit: contain;" />
                                </div>
                                <div class="col-md-12" style="padding: 1rem;">
                                    <div class="card-body" style="background-color: #ffffff; color: #333;">
                                        <h5 class="card-title" style="margin-bottom: 0.5rem;"><%#Eval("Nombre") %></h5>
                                        <p class="card-text" style="margin-bottom: 0.5rem;">Marca: <%#Eval("Marca") %></p>
                                        <p class="card-text" style="margin-bottom: 0.5rem;">Descripcion: <%#Eval("Descripcion") %></p>
                                        <p class="card-text"><small class="text-muted" style="color: #6c757d;">AR$<%#Eval("Precio") %></small></p>
                                        <div class="d-flex gap-2">
                                            <asp:Button Text="Modificar" runat="server" CssClass="btn btn-info" ID="modificarProducto"
                                                CommandArgument='<%#Eval("Id")%>' OnClick="modificarProducto_Click"
                                                Style="border-radius: 0.25rem; background-color: #17a2b8; border-color: #17a2b8;" />
                                            <asp:Button Text="Eliminar" runat="server" CssClass="btn btn-danger" ID="eliminarProducto"
                                                CommandArgument='<%#Eval("Id")%>' OnClientClick='<%# "return showCustomAlert(\"" + Eval("Id") + "\");" %>'
                                                Style="border-radius: 0.25rem; background-color: #dc3545; border-color: #dc3545;" />

                                        </div>
                                        <asp:Button Text="Ver detalles" CssClass="btn btn-primary" runat="server" ID="verDetalles"
                                            CommandArgument='<%#Eval("Id") %>' CommandName="IDComando" OnClick="verDetalles_Click"
                                            Style="border-radius: 0.25rem; background-color: #007bff; border-color: #007bff; margin: 5px" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <% } %>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
