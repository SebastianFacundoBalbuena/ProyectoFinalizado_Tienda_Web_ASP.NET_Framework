<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PerfilDeUsuario.aspx.cs" Inherits="WebApplication.PerfilDeUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card text-center" style="border-radius: 8px; border: 1px solid #dee2e6; background-color: white;">
        <div class="card-header" style="background-color: #007bff; color: white;">
            <h5 class="card-title">Perfil de usuario</h5>
        </div>
        <div class="card-body" style="background-color: white;">
            <asp:Button Text="Guardar cambios"
                CssClass="btn"
                Style="background-color: #17a2b8; border-color: #17a2b8; color: white; margin: 6px;"
                runat="server"
                ID="GuardarCambios"
                OnClientClick="return validacion()"
                OnClick="GuardarCambios_Click" />
            <asp:Button Text="Volver"
                CssClass="btn"
                Style="background-color: #007bff; border-color: #007bff; color: white; margin: 6px;"
                runat="server"
                ID="VolverAtras"
                OnClick="VolverAtras_Click" />
            <p style="margin-left: 40px; color: #333;">Los cambios realizados se verán reflejados la próxima vez que inicies sesión...</p>
        </div>
        <div class="card-footer" style="background-color: #007bff; color: white;">
        </div>
    </div>

    <br />

    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <div class="row" style="flex-wrap: wrap;">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <div class="card" style="border-radius: 8px; border: 1px solid #dee2e6; background-color: white;">
                        <div class="card-body" style="background-color: white;">
                            <asp:Label Text="Nombre" runat="server" />
                            <asp:TextBox CssClass="form-control" ID="barraNombre"
                                Style="margin: 6px;"
                                runat="server"
                                ClientIDMode="Static" />
                            <br />
                            <asp:Label Text="Apellido" runat="server" />
                            <asp:TextBox CssClass="form-control" ID="barraApellido"
                                Style="margin: 6px;"
                                runat="server"
                                ClientIDMode="Static" />
                            <br />
                            <asp:Label Text="Contraseña" runat="server" />
                            <asp:TextBox CssClass="form-control" ID="barraContraseña"
                                Style="margin: 6px;"
                                runat="server"
                                ClientIDMode="Static"
                                type="password"
                                AutoPostBack="true"
                                OnTextChanged="CheckContraseñaVisible_CheckedChanged" />
                            <% if (Pass != "" && Pass != null)
                                { %>
                            <p style="margin: 6px; color: #333;"><%: Pass %></p>
                            <% } %>
                            <asp:CheckBox Text="_Mostrar contraseña"
                                runat="server"
                                AutoPostBack="true"
                                ID="CheckContraseñaVisible"
                                OnCheckedChanged="CheckContraseñaVisible_CheckedChanged" />
                            <br />
                            <asp:Button CssClass="btn"
                                Style="background-color: #dc3545; border-color: #dc3545; color: white; margin: 6px;"
                                Text="Cerrar sesión"
                                runat="server"
                                ID="cerrarSesion"
                                OnClick="cerrarSesion_Click" />
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="overflow: hidden;">
                    <div class="card" style="border-radius: 8px; border: 1px solid #dee2e6; background-color: white;">
                        <div class="card-body" style="background-color: white; overflow: hidden;">
                            <asp:Label Text="Imagen del perfil" runat="server" />
                            <asp:TextBox CssClass="form-control" ID="barraImagen"
                                Style="margin: 6px;"
                                runat="server"
                                ClientIDMode="Static"
                                OnTextChanged="barraImagen_TextChanged"
                                AutoPostBack="true" />
                            <br />
                            <img style="height: 300px; width: 300px; display: block; margin-left: auto; margin-right: auto;"
                                src="https://img.freepik.com/vector-premium/icono-marco-fotos-foto-vacia-blanco-vector-sobre-fondo-transparente-aislado-eps-10_399089-1290.jpg"
                                alt="Alternate Text"
                                runat="server"
                                id="panelImagen" />
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

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
