<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registros.aspx.cs" Inherits="WebApplication.Registros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="justify-content: center; display: flex; height: 100px">
        <h1 style="font-size: 40px">Registros de ventas</h1>
        <asp:Button Style="top: 60px; position: relative; height:40px; right:210px" Text="Volver" CssClass="btn btn-primary" runat="server" ID="Inicio" OnClick="Inicio_Click" />
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
            <div class="row row-cols-1 row-cols-md-3 g-4" style="height: 50vw; display: flex; justify-content: center; flex-wrap: wrap;">
                <div style="border: none; margin-left: 30px; height: 13vw; position: sticky; overflow: auto; min-width: 20vw">
                    <label style="font-size: 30px">Codigo : </label>
                    <asp:TextBox ID="barracodigo" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="barracodigo_TextChanged" ClientIDMode="Static" />

                    <label style="font-size: 30px">Cantidad : </label>
                    <asp:TextBox ID="barracantidad" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="barracantidad_TextChanged" />
                </div>
                <br />
                <div style="border: none; margin-left: 30px; height: 13vw; position: sticky; overflow: auto; min-width: 20vw;">
                    <label style="font-size: 30px">Producto : </label>
                    <asp:DropDownList ID="barraproducto" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:Label ID="labelpreciototal" runat="server" Style="font-size: 30px" Text="Precio total: AR$"></asp:Label>
                    <br />
                    <asp:Button ID="botonagregar" CssClass="btn btn-primary" Text="Agregar al registro" runat="server" Style="margin-top: 20px; margin-left: 120px;" OnClientClick="return validacion()" OnClick="botonagregar_Click" />
                </div>

                <br />
                <br />

                <%//Panel de los registros :  %>
                <div style="height: 30vw; width: 70vw; overflow: scroll; border: outset">
                    <div style="display: flex">
                        <asp:Label Text="Buscar por : " runat="server" Style="font-size: 25px" />
                        <asp:DropDownList ID="tipoDeFecha" CssClass="form-control" Style="width: 120px; margin: 6px;" runat="server">
                            <asp:ListItem Text="Mes" />
                            <asp:ListItem Text="Año" />
                            <asp:ListItem Text="Dia-Mes-Año" />
                        </asp:DropDownList>
                        <asp:TextBox ID="barraFecha" CssClass="form-control" Style="width: 200px; margin: 6px; height: 40px" runat="server" />
                        <asp:Button ID="botonBuscarxFecha" CssClass="btn btn-primary" Style="padding: 3px; height: 40px; width: 122px; margin: 6px" Text="Buscar/Refrescar" runat="server" OnClick="botonBuscarxFecha_Click" />
                    </div>
                    <asp:GridView class="table" ID="panelderegistro" AutoGenerateColumns="false" runat="server" OnRowCommand="panelderegistro_RowCommand">
                        <Columns>
                            <asp:BoundField HeaderText="Codigo" DataField="Codigo"/>
                            <asp:BoundField HeaderText="Producto" DataField="Producto"/>
                            <asp:BoundField HeaderText="Cantidad" DataField="Cantidad"/>
                            <asp:BoundField HeaderText="Fecha" DataField="Fecha"/>
                            <asp:BoundField HeaderText="Precio" DataField="Precio"/>
                            <asp:CommandField ControlStyle-CssClass="btn btn-danger" HeaderText="Eliminar" ShowSelectButton="true" SelectText="Eliminar"/>
                            
                        </Columns>
                    </asp:GridView>
                </div>
                <br />
                <br />
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
