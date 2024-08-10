<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="WebApplication.Formulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="col" style="width: 600px; position: relative; left: 30%; width:500px">
        <div style="">
            <h1 style="position:relative;left:75px">Agregar Producto</h1>
            <br />
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Codigo</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="barracodigo" />
            </div>
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Producto</label>
                <asp:TextBox runat="server" type="text" CssClass="form-control" ID="barraproducto" />
            </div>
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Imagen(Url)</label>
                <asp:TextBox runat="server" type="url" CssClass="form-control" ID="barraimagen" />
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
                <asp:TextBox runat="server" CssClass="form-control" ID="barraprecio" />
            </div>
            <div class="mb-3">
                <label class="form-label">Descripcion</label>
                <asp:TextBox runat="server" CssClass="form-control"  ID="barradescripcion" />
            </div>
            <br />
            <asp:Button Text="Agregar producto" runat="server" CssClass="btn btn-primary" Style="position: relative; left: 55px" ID="botonagregarproducto" OnClick="botonagregarproducto_Click" />
            <asp:Button Text="Cancelar operacion" runat="server" CssClass="btn btn-primary" Style="position: relative; left: 110px" OnClick="Cancelar_Click" />
            <br />
            <br />
        </div>
    </div>

</asp:Content>
