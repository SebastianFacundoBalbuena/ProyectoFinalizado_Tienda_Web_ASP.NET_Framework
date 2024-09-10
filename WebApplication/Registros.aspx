<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registros.aspx.cs" Inherits="WebApplication.Registros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%// Barra inicio de registro %>
    <div class="card text-center" style="border-radius: 8px; border: 1px solid #dee2e6; background-color: white;">
        <div class="card-header" style="background-color: #007bff; color: white;">
            <h2 class="card-title">Registro de ventas</h2>
        </div>
        <div class="card-body" style="background-color: white;">
            <asp:Button Text="Volver" CssClass="btn" runat="server" ID="Button1" OnClick="Inicio_Click"
                Style="background-color: #007bff; border-color: #007bff; color: white; margin: 6px;" />
        </div>

    </div>

    <br />
    <br />

    <%//Alerta de confirmacion de agregado de registro %>
    <div id="customAlert" class="custom-alert-content" style="display: none; position: fixed; left: 42%; top: 40%; background-color: rgba(144, 238, 144, 0.5); z-index: 1000; padding: 20px;">
        <div class="alert alert-success" role="alert">
            ¡Agregado al registro exitosamente!
        </div>
        <div>
            <asp:Button ID="btnAceptar" class="btn btn-success" Style="display: block; margin: 0 auto;" OnClick="botonagregar_Click" Text="Aceptar" runat="server" />
        </div>
    </div>

    <script>
        function validacion() {
            const codigo = document.getElementById("barracodigo");
            if (codigo.value == "") {
                codigo.classList.add("is-invalid");
                return false;
            }

            document.getElementById('customAlert').style.display = "block";
            return false;
        }
    </script>

    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <%//Área de ventas a seleccionar... %>
            <div class="row row-cols-1 row-cols-md-3 g-4" style="height: 50vw; display: flex; justify-content: center; flex-wrap: wrap; overflow: auto; background-color: #f8f9fa; padding: 20px; border-radius: 8px;">

                <br />

                <div class="row" style="width: 100%;">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <div class="card" style="border-radius: 8px; border: 1px solid #dee2e6; background-color: white;">
                            <div class="card-body">
                                <h5 class="card-title">Código:</h5>
                                <asp:TextBox ID="barracodigo" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="barracodigo_TextChanged" ClientIDMode="Static" Style="border: 1px solid #dee2e6;" />
                                <h5 class="card-title">Cantidad:</h5>
                                <asp:TextBox ID="barracantidad" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="barracantidad_TextChanged" Style="border: 1px solid #dee2e6;" />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card" style="border-radius: 8px; border: 1px solid #dee2e6; background-color: white;">
                            <div class="card-body">
                                <h5 class="card-title">Producto:</h5>
                                <asp:DropDownList ID="barraproducto" CssClass="form-control" runat="server" Style="border: 1px solid #dee2e6;"></asp:DropDownList>
                                <asp:Label ID="labelpreciototal" runat="server" Style="font-size: 20px; margin: 6px; color: #333333;" Text="Precio total: AR$"></asp:Label>
                                <br />
                                <asp:Button ID="botonagregar" CssClass="btn" Text="Agregar al registro" runat="server" Style="margin: 6px; background-color: #007bff; border-color: #007bff; color: white;" OnClientClick="return validacion()" OnClick="botonagregar_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <br />
                <br />

                <%//Panel de los registros %>
                <div class="card text-center" style="border-radius: 8px; border: 1px solid #dee2e6; background-color: white; width: 100%;">
                    <div class="card-header" style="background-color: #007bff; color: white;">
                        Listado del registro
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Buscar por:</h5>

                        <div class="card-footer" style="display: flex; justify-content: center; background-color: #f8f9fa; border-top: 1px solid #dee2e6;">
                            <asp:DropDownList ID="tipoDeFecha" CssClass="form-control" Style="width: 120px; margin: 6px; border: 1px solid #dee2e6;" runat="server">
                                <asp:ListItem Text="Mes" />
                                <asp:ListItem Text="Año" />
                                <asp:ListItem Text="Dia-Mes-Año" />
                            </asp:DropDownList>
                            <asp:TextBox ID="barraFecha" CssClass="form-control" Style="width: 200px; margin: 6px; height: 40px; border: 1px solid #dee2e6;" runat="server" />
                            <asp:Button ID="botonBuscarxFecha" CssClass="btn" Text="Buscar/Refrescar" runat="server" Style="margin: 6px; background-color: #007bff; border-color: #007bff; color: white;" OnClick="botonBuscarxFecha_Click" />
                        </div>

                    </div>
                    <br />

                    <div style="max-height: 300px; overflow-y: auto; border: 1px solid #dee2e6; border-radius: 8px;">
                        <asp:GridView class="table" ID="panelderegistro" AutoGenerateColumns="false" runat="server" OnRowCommand="panelderegistro_RowCommand" Style="border: none;">
                            <Columns>
                                <asp:BoundField HeaderText="Código" DataField="Codigo" />
                                <asp:BoundField HeaderText="Producto" DataField="Producto" />
                                <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" />
                                <asp:BoundField HeaderText="Fecha" DataField="Fecha" />
                                <asp:BoundField HeaderText="Precio" DataField="Precio" />
                                <asp:TemplateField HeaderText="Eliminar">
                                    <ItemTemplate>
                                        <asp:Button ID="botonEliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("ID") %>' Text="Eliminar" CssClass="btn" Style="background-color: #dc3545; border-color: #dc3545; color: white;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div class="card-footer" style="background-color: #007bff; color: white;"></div>
                </div>
                <br />
                <br />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


