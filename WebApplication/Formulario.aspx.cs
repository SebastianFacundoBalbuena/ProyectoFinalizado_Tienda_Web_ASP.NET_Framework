using System;
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
        public List<Categoria> listaCategoria {  get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            Controler control = new Controler();


            listaCategoria = control.CategoriaLista();
            listaMarca = control.MarcaListar();

            

           
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx",false);
        }

        protected void botonagregarproducto_Click(object sender, EventArgs e)
        {
            try
            {
                Controler control = new Controler();

                if(barracodigo.Text != null && barraproducto.Text != null && barraprecio.Text != null)
                {
                    Categoria categoria = new Categoria();
                    Marca marca = new Marca();
                    

                    


                    Articulos newArticulo = new Articulos(categoria, marca);
                    newArticulo.Codigo = barracodigo.Text;
                    newArticulo.Nombre = barraproducto.Text;
                    newArticulo.Imagen = barraimagen.Text;
                    categoria = listaCategoria.Find(x => x.Categorias == barracategoria.Text);
                    marca = listaMarca.Find(x => x.Marcas == barramarca.Text);
                    newArticulo.Precio = int.Parse(barraprecio.Text);
                    newArticulo.Descripcion = barradescripcion.Text;

                    control.Agregar(newArticulo,categoria,marca);
                }

                Response.Redirect("Productos.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}