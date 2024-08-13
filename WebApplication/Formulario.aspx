<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="WebApplication.Formulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%string ID = Request.QueryString["ID"];
    // si hay parametro, se presiono MODIFICAR: Cargara los datos...
    if(ID != null)
    {

        foreach (var item in Articulos)
        {
            if(item.Id.ToString() == ID.ToString())
            {
                
                barracodigo.Text = item.Codigo;
                barraproducto.Text = item.Nombre;
                barraimagen.Text = item.Imagen;
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

    <div class="col" style=" position: relative; left: 30%; width: 500px">
        <div >
            <h1 style="position: relative; left: 75px">Agregar Producto</h1>
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
                <asp:TextBox runat="server" type="url" CssClass="form-control" ID="barraimagen" ClientIDMode="Static" />
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
            <div class="mb-3">
                <label class="form-label">Precio</label>
               <asp:TextBox runat="server" CssClass="form-control" ID="barraprecio" ClientIDMode="Static" type="number" min="1"/>
                Solo numeros sin coma/punto.               
            </div>
            <div class="mb-3">
                <label class="form-label">Descripcion</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="barradescripcion" />
            </div>
            <br />
            <asp:Button Text="Agregar producto" runat="server" CssClass="btn btn-primary" Style="position: relative; left: 55px" ID="botonagregarproducto"  OnClientClick="return validacion()" OnClick="botonagregarproducto_Click" />
            <asp:Button Text="Cancelar operacion" runat="server" CssClass="btn btn-primary" Style="position: relative; left: 110px" OnClick="Cancelar_Click" />
            <br />
            <br />
        </div>
    </div>

</asp:Content>
