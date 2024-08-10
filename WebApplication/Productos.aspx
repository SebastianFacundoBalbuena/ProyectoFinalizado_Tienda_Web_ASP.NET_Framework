<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="WebApplication.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1 style="position: absolute; left: 700px">Productos </h1>
    <br />
    <br />
    <br />
    <asp:Button Text="Volver" runat="server" CssClass="btn btn-primary" Style="position: absolute; left: 680px" OnClick="Unnamed_Click" />
    <asp:Button Text="Agregar producto" runat="server" CssClass="btn btn-primary" Style="position: absolute; left: 755px" OnClick="agregar_Click1" />


    <br />
    <br />
    <br />

    <div class="row row-cols-1 row-cols-md-3 g-4" >
        <%
            if (Lista != null)

            {%>


        <asp:Repeater ID="repetidor" runat="server">
            <ItemTemplate>
                <div class="card mb-3" style="max-width: 540px;">

                    <div class="row g-0" style="margin:10px">
                        <div class="col-md-4">
                            <img src="<%#Eval( "Imagen") %>" class="img-fluid rounded-start" alt="..." style="margin-top: 20px;">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                <p class="card-text">Marca: <%#Eval("Marca") %></p>
                                <p class="card-text">Descripcion: <%#Eval("Descripcion") %></p>
                                <p class="card-text"><small class="text-body-secondary">AR$: <%#Eval("Precio") %></small></p>
                                <asp:Button Text="Ver detalles" CssClass="btn btn-primary" runat="server" ID="verDetalles" CommandArgument='<%#Eval("Id") %>' CommandName="IDComando" OnClick="verDetalles_Click" />
                            </div>
                        </div>
                    </div>

                </div>
            </ItemTemplate>
        </asp:Repeater>








        <% } %>
    </div>

</asp:Content>
