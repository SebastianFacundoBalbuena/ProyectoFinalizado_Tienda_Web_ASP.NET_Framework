﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controllers;
using DataBase;
using Dominio;

namespace WebApplication
{
    public partial class Formulario : System.Web.UI.Page
    {
        public List<Marca> listaMarca { get; set; }
        public List<Categoria> listaCategoria { get; set; }

        public List<Articulos> Articulos { get; set; }



        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UsuarioActivo"] != null)
                {
                    Usuarios newUsuario = Session["UsuarioActivo"] as Usuarios;
                    if(newUsuario.TipoDeUsuario == 0)
                    {
                        Session.Add("Error", "Debes ser administrador para acceder al formulario");
                        Response.Redirect("Error.aspx", false);
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx", false);
                }


                Controler control = new Controler();

                listaCategoria = control.CategoriaLista();
                listaMarca = control.MarcaListar();
                Articulos = control.listar();
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }







        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx", false);
        }

        protected void botonagregarproducto_Click(object sender, EventArgs e)
        {
            try
            {
                Controler control = new Controler();



                if (barracodigo.Text != null && barraproducto.Text != null && barraprecio.Text != null && barraimagen.Text != null)
                {
                    Categoria categoria = new Categoria();
                    Marca marca = new Marca();





                    Articulos newArticulo = new Articulos(categoria, marca);
                    newArticulo.Codigo = barracodigo.Text;
                    newArticulo.Nombre = barraproducto.Text;

                    if (barraimagen.Text == "")
                    {
                        newArticulo.Imagen = "https://img.freepik.com/vector-premium/icono-marco-fotos-foto-vacia-blanco-vector-sobre-fondo-transparente-aislado-eps-10_399089-1290.jpg";
                    }
                    else
                    {
                        newArticulo.Imagen = barraimagen.Text;
                    }

                    categoria = listaCategoria.Find(x => x.Categorias == barracategoria.Text);
                    marca = listaMarca.Find(x => x.Marcas == barramarca.Text);
                    string nuevoPrecio = barraprecio.Text.Replace(".", "").Replace(",", "");
                    newArticulo.Precio = int.Parse(nuevoPrecio);
                    newArticulo.Descripcion = barradescripcion.Text;


                    if (Request.QueryString["ID"] != null)

                    {
                        newArticulo.Id = int.Parse(Request.QueryString["ID"]);
                        control.Modificar(newArticulo, categoria, marca);
                    }
                    else
                    {
                        control.Agregar(newArticulo, categoria, marca);
                    }

                }
                else
                {
                    Session.Add("Error", "Algunos campos no se han completados, verifiquelos.");
                    Response.Redirect("Error.aspx", false);
                }

                Response.Redirect("Productos.aspx", false);
            }
            catch (Exception ex)
            {


                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);

            }
        }

        protected void barraimagen_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (barraimagen.Text != "")
                {
                    panelImagen.Src = barraimagen.Text;

                }
                else
                {
                    string imagen = "https://img.freepik.com/vector-premium/icono-marco-fotos-foto-vacia-blanco-vector-sobre-fondo-transparente-aislado-eps-10_399089-1290.jpg";
                    panelImagen.Src = imagen;
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }

        }
    }
}