<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="WebApplication.Registrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <script>
        function validacion() {

            const nombre = document.getElementById("barraNombre");
            const apellido = document.getElementById("barraApellido");
            const email = document.getElementById("barraEmail");
            const contraseña = document.getElementById("barraContraseña");

            if (nombre.value == "" || apellido.value == "" || email.value == "" || contraseña.value == "") {


                if (nombre.value == "") {

                    nombre.classList.add("is-invalid");
                    apellido.classList.remove("is-invalid");
                    email.classList.remove("is-invalid");
                    contraseña.classList.remove("is-invalid");
                    return false;

                } else if (apellido.value == "") {
                    apellido.classList.add("is-invalid");
                    nombre.classList.remove("is-invalid");
                    email.classList.remove("is-invalid");
                    contraseña.classList.remove("is-invalid");
                    return false;

                } else if (email.value == "") {
                    email.classList.add("is-invalid");
                    nombre.classList.remove("is-invalid");
                    apellido.classList.remove("is-invalid");
                    contraseña.classList.remove("is-invalid");
                    return false;

                } else if (contraseña.value == "") {
                    contraseña.classList.add("is-invalid");
                    nombre.classList.remove("is-invalid");
                    apellido.classList.remove("is-invalid");
                    email.classList.remove("is-invalid");
                    return false;
                }


            }


        }
    </script>


    <div class="card text-center" style="justify-content: center; display: flex; align-items: center; overflow: hidden; height: 500px">
        <div class="card-header">
        </div>
        <div class="card-body" style="width: 600px;">
            <h5 style="font-size: 30px" class="card-title">Registrarse </h5>

            <br />
            <br />
            <asp:Label Text="Nombre" runat="server" />
            <asp:TextBox ID="barraNombre" Style="margin: 4px" CssClass="form-control" runat="server" ClientIDMode="Static"></asp:TextBox>

            <asp:Label Text="Apellido" runat="server" />
            <asp:TextBox ID="barraApellido" Style="margin: 4px" CssClass="form-control" runat="server" ClientIDMode="Static"></asp:TextBox>


            <asp:Label Text="Email" runat="server" />
            <asp:TextBox ID="barraEmail" Type="Email" Style="margin: 4px" CssClass="form-control" runat="server" ClientIDMode="Static"></asp:TextBox>

            <asp:Label Text="Contraseña" runat="server" />
            <asp:TextBox ID="barraContraseña" Type="Password" Style="margin: 4px" CssClass="form-control" runat="server" ClientIDMode="Static"></asp:TextBox>
            <br />
            <asp:Button ID="botonRegistrarse" Style="margin: 2px" CssClass="btn btn-primary" Text="Registrarse" runat="server" OnClientClick="return validacion()" OnClick="botonRegistrarse_Click" />
            <asp:Button ID="botonCancelar" Style="margin: 2px" CssClass="btn btn-danger" Text="Cancelar" runat="server" OnClick="botonCancelar_Click" />



        </div>
    </div>



</asp:Content>
