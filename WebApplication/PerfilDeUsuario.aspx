<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PerfilDeUsuario.aspx.cs" Inherits="WebApplication.PerfilDeUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card text-center">
        <div class="card-header">
        </div>
        <div class="card-body">
            <h5 class="card-title">Perfil de usuario</h5>

            <asp:Button Text="Guardar cambios" CssClass="btn btn-info" runat="server" ID="GuardarCambios" OnClientClick="return validacion()" OnClick="GuardarCambios_Click" />
            <asp:Button Text="Volver" CssClass="btn btn-primary" runat="server" ID="VolverAtras" OnClick="VolverAtras_Click" />
            <p style="margin-left: 40px">Los cambios realizados se veran reflejados la proxima vez que inicies sesión...</p>
        </div>
        <div class="card-footer text-body-secondary">
        </div>
    </div>

    <br />

    <div class="row" style="flex-wrap: wrap;">
        <div class="col-sm-6 mb-3 mb-sm-0">
            <div class="card">
                <div class="card-body">
                    <asp:Label Text="Nombre" runat="server" />
                    <asp:TextBox ID="barraNombre" CssClass="form-control" runat="server"  ClientIDMode="Static"/>
                    <br />
                    <asp:Label Text="Apellido" runat="server" />
                    <asp:TextBox ID="barraApellido" CssClass="form-control" runat="server" ClientIDMode="Static"/>
                    <br />
                    <asp:Label Text="Contraseña" runat="server" />
                    <asp:TextBox ID="barraContraseña" CssClass="form-control" runat="server" ClientIDMode="Static"/>
                    <br />
                    <asp:Button CssClass="btn btn-danger" Text="Cerrar sesión" runat="server" ID="cerrarSesion" OnClick="cerrarSesion_Click" />
                </div>
            </div>
        </div>
        <div class="col-sm-6" style="overflow: hidden">
            <div class="card">
                <div class="card-body" style="overflow: hidden">
                    <asp:Label Text="Imagen del perfil" runat="server" />
                    <asp:TextBox ID="barraImagen" CssClass="form-control" runat="server" ClientIDMode="Static" OnTextChanged="barraImagen_TextChanged" AutoPostBack="true"  />
                    <br />
                    <img style="height: 300px; width: 300px; margin-left: 150px" src="https://img.freepik.com/vector-premium/icono-marco-fotos-foto-vacia-blanco-vector-sobre-fondo-transparente-aislado-eps-10_399089-1290.jpg" alt="Alternate Text" runat="server" id="panelImagen" />
                </div>
            </div>
        </div>
    </div>



    <script>
        function validacion() {

            const nombre = document.getElementById("barraNombre");
            const apellido = document.getElementById("barraApellido");
            const imagen = document.getElementById("barraImagen");
            const contraseña = document.getElementById("barraContraseña");

            if (nombre.value == "" || apellido.value == "" || imagen.value == "" || contraseña.value == "") {


                if (nombre.value == "") {

                    nombre.classList.add("is-invalid");
                    apellido.classList.remove("is-invalid");
                    imagen.classList.remove("is-invalid");
                    contraseña.classList.remove("is-invalid");
                    return false;

                } else if (apellido.value == "") {
                    apellido.classList.add("is-invalid");
                    nombre.classList.remove("is-invalid");
                    imagen.classList.remove("is-invalid");
                    contraseña.classList.remove("is-invalid");
                    return false;

                } else if (imagen.value == "") {
                    imagen.classList.add("is-invalid");
                    nombre.classList.remove("is-invalid");
                    apellido.classList.remove("is-invalid");
                    contraseña.classList.remove("is-invalid");
                    return false;

                } else if (contraseña.value == "") {
                    contraseña.classList.add("is-invalid");
                    nombre.classList.remove("is-invalid");
                    apellido.classList.remove("is-invalid");
                    imagen.classList.remove("is-invalid");
                    return false;
                }


            }


        }
    </script>


</asp:Content>
