<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registros.aspx.cs" Inherits="WebApplication.Registros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%//Barra inicio de registro %>
    <div class="card text-center">
        <div class="card-header"></div>
        <div class="card-body">
            <h2 class="card-title">Registro de ventas</h2>
            <asp:Button Text="Volver" CssClass="btn btn-primary" runat="server" ID="Button1" OnClick="Inicio_Click" />
        </div>
        <div class="card-footer text-body-secondary"></div>
    </div>

    <br />
    <br />

    <%//Alerta de confirmacion de agregado de registro %>
    <div id="customAlert" class="custom-alert-content" style="display: none; position: fixed; left: 42%; top: 40%; background-color: rgba(144, 238, 144, 0.5); z-index: 1000; padding: 20px;">
        <div class="alert alert-success" role="alert">
            ¡Agregado al registro exitosamente!
        </div>
        <div>
            <asp:Button ID="btnAceptar" class="btn btn-success" Style="position: relative; left: 37%" OnClick="botonagregar_Click" Text="Aceptar" runat="server" />
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

            <%//Area de ventas a seleccionar... %>
            <div class="row row-cols-1 row-cols-md-3 g-4" style="height: 50vw; display: flex; justify-content: center; flex-wrap: wrap; overflow:auto">

                <br />

                <div class="row" style="width: 300vw">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Codigo : </h5>
                                <asp:TextBox ID="barracodigo" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="barracodigo_TextChanged" ClientIDMode="Static" />
                                <h5 class="card-title">Cantidad : </h5>
                                <asp:TextBox ID="barracantidad" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="barracantidad_TextChanged" />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Producto : </h5>
                                <asp:DropDownList ID="barraproducto" CssClass="form-control" runat="server"></asp:DropDownList>
                                <asp:Label ID="labelpreciototal" runat="server" Style="font-size: 20px; margin: 6px" Text="Precio total: AR$"></asp:Label>
                                <br />
                                <asp:Button ID="botonagregar" CssClass="btn btn-primary" Text="Agregar al registro" runat="server" Style="margin: 6px" OnClientClick="return validacion()" OnClick="botonagregar_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <br />
                <br />

                <%//Panel de los registros :  %>
                <div class="card text-center" style=" width: 300vw">
                    <div class="card-header">
                        Listado del registro
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Buscar por : </h5>

                        <div class="card-footer text-body-secondary" style=" display: flex; justify-content: center">

                            <asp:DropDownList ID="tipoDeFecha" CssClass="form-control" Style="width: 120px; margin: 6px;" runat="server">
                                <asp:ListItem Text="Mes" />
                                <asp:ListItem Text="Año" />
                                <asp:ListItem Text="Dia-Mes-Año" />
                            </asp:DropDownList>
                            <asp:TextBox ID="barraFecha" CssClass="form-control" Style="width: 200px; margin: 6px; height: 40px" runat="server" />
                            <asp:Button ID="botonBuscarxFecha" CssClass="btn btn-primary" Text="Buscar/Refrescar" runat="server" style="margin:6px" OnClick="botonBuscarxFecha_Click" />
                        </div>


                    </div>
                    <br />

                    <asp:GridView class="table" ID="panelderegistro" AutoGenerateColumns="false" runat="server" OnRowCommand="panelderegistro_RowCommand">
                        <Columns>
                            <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
                            <asp:BoundField HeaderText="Producto" DataField="Producto" />
                            <asp:BoundField HeaderText="Cantidad" DataField="Cantidad" />
                            <asp:BoundField HeaderText="Fecha" DataField="Fecha" />
                            <asp:BoundField HeaderText="Precio" DataField="Precio" />


                            <asp:TemplateField HeaderText="Eliminar">
                                <ItemTemplate>
                                    <asp:Button ID="botonEliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("ID") %>' Text="Eliminar" CssClass="btn btn-danger" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

                    <div class="card-footer text-body-secondary"></div>
                </div>
                <br />
                <br />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
