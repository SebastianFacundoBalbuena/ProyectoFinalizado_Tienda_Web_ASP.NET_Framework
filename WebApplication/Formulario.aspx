<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="WebApplication.Formulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <% string ID = Request.QueryString["ID"];
        // si hay parametro, se presiono MODIFICAR: Cargara los datos...
        if (ID != null)
        {
            foreach (var item in Articulos)
            {
                if (item.Id.ToString() == ID.ToString())
                {
                    barracodigo.Text = item.Codigo;
                    barraproducto.Text = item.Nombre;
                    if (!IsPostBack)
                    {
                        barraimagen.Text = item.Imagen;
                        panelImagen.Src = item.Imagen;
                    }
                    barracategoria.Text = item.Categoria;
                    barramarca.Text = item.Marca;
                    barraprecio.Text = item.Precio.ToString();
                    barradescripcion.Text = item.Descripcion;
                }
            }
        }
    %>

    <%//Alerta de confirmacion de agregado/modificado de articulo %>
    <div id="customAlert" class="custom-alert-content" style="display: none; position: fixed; left: 42%; top: 40%; background-color: rgba(144, 238, 144, 0.5); z-index: 1000; padding: 20px;">
        <div class="alert alert-success" role="alert">
            ¡Agregado/Modificado exitosamente!
        </div>
        <div style="margin-top: 10px;">
            <asp:Button ID="btnAceptar" class="btn btn-success" Style="display: block; margin: 0 auto;" OnClick="botonagregarproducto_Click" Text="Aceptar" runat="server" />
        </div>
    </div>

    <script>
        //Validacion con JavaScript
        function validacion() {
            const codigo = document.getElementById("barracodigo");
            const producto = document.getElementById("barraproducto");
            const precio = document.getElementById("barraprecio");
            const imagen = document.getElementById("barraimagen");

            if (codigo.value === "" || producto.value === "" || precio.value === "" || imagen.value === "") {
                codigo.classList.remove("is-invalid");
                producto.classList.remove("is-invalid");
                precio.classList.remove("is-invalid");
                imagen.classList.remove("is-invalid");

                if (codigo.value === "") {
                    codigo.classList.add("is-invalid");
                }
                if (producto.value === "") {
                    producto.classList.add("is-invalid");
                }
                if (imagen.value === "") {
                    imagen.classList.add("is-invalid");
                }
                if (precio.value === "") {
                    precio.classList.add("is-invalid");
                }

                return false;
            }

            document.getElementById('customAlert').style.display = 'block';
            return false;
        }
    </script>

    <%//Formulario de agregar/modificar productos %>
    <div style="display: flex; justify-content: space-between; gap: 20px;">
        <div class="col" style="width: 60%; background-color: #f8f9fa; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <h1 style="color: #007bff; text-align: center;">Agregar Producto</h1>
            <br />
            <div class="mb-3">
                <label for="barracodigo" class="form-label" style="color: #343a40;">Codigo</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="barracodigo" ClientIDMode="Static" Style="border-color: #ced4da;" />
            </div>
            <div class="mb-3">
                <label for="barraproducto" class="form-label" style="color: #343a40;">Producto</label>
                <asp:TextBox runat="server" type="text" CssClass="form-control" ID="barraproducto" ClientIDMode="Static" Style="border-color: #ced4da;" />
            </div>
            <div class="mb-3">
                <label for="barraimagen" class="form-label" style="color: #343a40;">Imagen (URL)</label>
                <asp:TextBox runat="server" type="url" CssClass="form-control" ID="barraimagen" ClientIDMode="Static" AutoPostBack="true" OnTextChanged="barraimagen_TextChanged" Style="border-color: #ced4da;" />
            </div>
            <div class="mb-3">
                <label class="form-label" style="color: #343a40;">Categoria</label>
                <asp:DropDownList ID="barracategoria" runat="server" CssClass="form-select" Style="border-color: #ced4da;">
                    <asp:ListItem Text="Celulares" />
                    <asp:ListItem Text="Televisores" />
                    <asp:ListItem Text="Media" />
                    <asp:ListItem Text="Audio" />
                </asp:DropDownList>
            </div>
            <div class="mb-3">
                <label class="form-label" style="color: #343a40;">Marca</label>
                <asp:DropDownList ID="barramarca" runat="server" CssClass="form-select" Style="border-color: #ced4da;">
                    <asp:ListItem Text="Samsung" />
                    <asp:ListItem Text="Apple" />
                    <asp:ListItem Text="Sony" />
                    <asp:ListItem Text="Huawei" />
                    <asp:ListItem Text="Motorola" />
                </asp:DropDownList>
            </div>
            <br />
            <div style="text-align: center;">
                <asp:Button Text="Agregar producto" runat="server" CssClass="btn btn-primary" Style="margin-right: 10px;" ID="botonagregarproducto" OnClientClick="return validacion()" OnClick="botonagregarproducto_Click" />
                <asp:Button Text="Cancelar operacion" runat="server" CssClass="btn btn-secondary" ID="botonCancelar" OnClick="Cancelar_Click" />
            </div>
        </div>

        <div style="width: 35%; background-color: #f8f9fa; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <div class="mb-3">
                <label class="form-label" style="color: #343a40;">Precio</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="barraprecio" ClientIDMode="Static" type="number" min="1" Style="border-color: #ced4da;" />
            </div>
            <div class="mb-3">
                <label class="form-label" style="color: #343a40;">Descripcion</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="barradescripcion" Style="border-color: #ced4da;" />
            </div>
            <img src="https://img.freepik.com/vector-premium/icono-marco-fotos-foto-vacia-blanco-vector-sobre-fondo-transparente-aislado-eps-10_399089-1290.jpg" runat="server" style="width: 100%; border: 1px solid #ced4da; border-radius: 5px;" id="panelImagen" />
        </div>
    </div>

</asp:Content>

