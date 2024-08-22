<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="WebApplication.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <%//Contenedor de titulo, busqueda y botones volver e agregar articulo %>

            <div style="border:none; display:flex; align-items: center; justify-content: center">

                <div class="col-md-8" style="border: none; width: 300px">
                    <h5 class="card-title" style="font-size: 40px; margin-left: 40px">Productos</h5>
                    <asp:Button Text=" Buscar/Refrescar" CssClass="btn btn-primary" runat="server" Style=" width:150px ;border: solid 1px; margin-left: 60px; padding: 2px" OnClick="busquedaDeArticulos_TextChanged" />
                    <asp:TextBox ID="busquedaDeArticulos" runat="server" class="form-control" Style="margin: 5px; width: 16vw;" placeholder="Buscar : Codigo/Producto/Categoria" AutoPostBack="true" OnTextChanged="busquedaDeArticulos_TextChanged" />
                    <asp:Button Text="Volver" runat="server" CssClass="btn btn-primary" Style="margin: 4px; margin-left: 20px" OnClick="Unnamed_Click" />
                    <asp:Button Text="Agregar producto" runat="server" CssClass="btn btn-primary" OnClick="agregar_Click1" />

                </div>

            </div>

          
            <br />

            <%//Alerta de confirmacion de eliminado de articulos %>
            <div id="customAlert" class="custom-alert-content" style="display: none; position: fixed; left: 42%; top: 40%; background-color: rgba(241, 148, 138, 0.5); z-index: 1000; padding: 20px;">
                <div class="alert alert-danger" role="alert">
                    Desea eliminar este producto?
                </div>
                <div>
                    <asp:Button ID="btnEliminar" class="btn btn-danger" Style="position: relative; left: 20px; top: 40%;" Text="Eliminar" runat="server" OnClick="btnEliminar_Click" />
                    <asp:Button ID="btnCancelar" class="btn btn-danger" Style="position: relative; left: 44px" OnClientClick="return closeCustomAlert()" Text="Cancelar" runat="server" />
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


            <%//Mostrar listado de articulos :  %>




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

                    {%>


                <asp:Repeater ID="repetidor" runat="server">
                    <ItemTemplate>
                        <div class="card mb-3" style="max-width: 540px;">

                            <div class="row g-0" style="margin: 10px">

                                <div class="col-md-4">

                                    <img src="<%#Eval( "Imagen") %>" class="img-fluid rounded-start" alt="" style="margin-top: 20px;">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                        <p class="card-text">Marca: <%#Eval("Marca") %></p>
                                        <p class="card-text">Descripcion: <%#Eval("Descripcion") %></p>
                                        <p class="card-text"><small class="text-body-secondary">AR$: <%#Eval("Precio") %></small></p>
                                        <asp:Button Text="Modificar" runat="server" CssClass="btn btn-info" ID="modificarProducto" CommandArgument='<%#Eval("Id")%>' OnClick="modificarProducto_Click" />
                                        <asp:Button Text="Eliminar" runat="server" CssClass="btn btn-danger" ID="eliminarProducto" CommandArgument='<%#Eval("Id")%>' OnClientClick='<%# "return showCustomAlert(\"" + Eval("Id") + "\");" %>' />
                                        <br />
                                        <br />
                                        <div style="position: relative; left: 34px">
                                            <asp:Button Text="Ver detalles" CssClass="btn btn-primary" runat="server" ID="verDetalles" CommandArgument='<%#Eval("Id") %>' CommandName="IDComando" OnClick="verDetalles_Click" />
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>

                    </ItemTemplate>
                </asp:Repeater>
                <% }

                %>
            </div>


        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
