<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="WebApplication.Formulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%string ID = Request.QueryString["ID"];
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

    <script>
        //Validacion con JavaScript
        function validacion() {
            const codigo = document.getElementById("barracodigo");
            const producto = document.getElementById("barraproducto");
            const precio = document.getElementById("barraprecio");
            const imagen = document.getElementById("barraimagen");


            if ((codigo.value == "" || producto.value == "" || precio.value == "" || imagen.value == "")) {

                if (codigo.value == "") {
                    codigo.classList.add("is-invalid");
                    producto.classList.remove("is-invalid");
                    precio.classList.remove("is-invalid");
                    imagen.classList.remove("is-invalid");

                    return false;

                } else if (producto.value == "") {
                    producto.classList.add("is-invalid");
                    imagen.classList.remove("is-invalid");
                    precio.classList.remove("is-invalid");
                    codigo.classList.remove("is-invalid");
                    return false;

                } else if (imagen.value == "") {
                    imagen.classList.add("is-invalid");
                    precio.classList.remove("is-invalid");
                    codigo.classList.remove("is-invalid");
                    producto.classList.remove("is-invalid");
                    return false;

                } else if (precio.value == "") {
                    precio.classList.add("is-invalid");
                    producto.classList.remove("is-invalid");
                    codigo.classList.remove("is-invalid");
                    imagen.classList.remove("is-invalid");

                    return false;
                }

            }
        }
    </script>

    <div class="col" style="position: relative; left: 10%; width: 500px; height: 600px; padding-bottom: 20px">

        <h1 style="position: relative; left: 350px">Agregar Producto</h1>
        <br />
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Codigo</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="barracodigo" ClientIDMode="Static" />
        </div>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Producto</label>
            <asp:TextBox runat="server" type="text" CssClass="form-control" ID="barraproducto" ClientIDMode="Static" />
        </div>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Imagen(Url)</label>
            <asp:TextBox runat="server" type="url" CssClass="form-control" ID="barraimagen" ClientIDMode="Static" AutoPostBack="true" OnTextChanged="barraimagen_TextChanged" />
        </div>
        <div class="mb-3">
            <label class="form-label">Categoria</label>
            <asp:DropDownList ID="barracategoria" runat="server" CssClass="form-select">
                <asp:ListItem Text="Celulares" />
                <asp:ListItem Text="Televisores" />
                <asp:ListItem Text="Media" />
                <asp:ListItem Text="Audio" />
            </asp:DropDownList>
        </div>
        <div class="mb-3">
            <label class="form-label">Marca</label>
            <asp:DropDownList ID="barramarca" runat="server" CssClass="form-select">
                <asp:ListItem Text="Samsung" />
                <asp:ListItem Text="Apple" />
                <asp:ListItem Text="Sony" />
                <asp:ListItem Text="Huawei" />
                <asp:ListItem Text="Motorola" />
            </asp:DropDownList>
        </div>
        <br />
        <asp:Button Text="Agregar producto" runat="server" CssClass="btn btn-primary" Style="position: relative; left: 55px;" ID="botonagregarproducto" OnClientClick="return validacion()" OnClick="botonagregarproducto_Click" />
        <asp:Button Text="Cancelar operacion" runat="server" CssClass="btn btn-primary" Style="position: relative; left: 110px;" OnClick="Cancelar_Click" />


        <div style="position: relative; left: 600px; bottom: 495px; width: 500px;">
            <div class="mb-3">
                <label class="form-label">Precio</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="barraprecio" ClientIDMode="Static" type="number" min="1" />               
            </div>
            <div class="mb-3">
                <label class="form-label">Descripcion</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="barradescripcion" />
            </div>

            <img src="https://img.freepik.com/vector-premium/icono-marco-fotos-foto-vacia-blanco-vector-sobre-fondo-transparente-aislado-eps-10_399089-1290.jpg" runat="server" style="width: 300px; position: relative; left: 100px" id="panelImagen" />


        </div>

    </div>



</asp:Content>
