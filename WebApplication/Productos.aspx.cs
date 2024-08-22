using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controllers;
using Dominio;


namespace WebApplication
{
    public partial class Productos : System.Web.UI.Page
    {
        //bandera:
        public string Bandera { get; set; }
        // Propiedad para acceder a la lista de productos
        public List<Articulos> Lista { get; set; }
        public List<Articulos> NuevaLista { get; set; }

        // Página Load
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {

                    Controler control = new Controler();

                    Lista = control.listar();

                    //Repetidor que funciona como foreach
                    // ventaja, se puede pasar argumentos al back
                    repetidor.DataSource = control.listar();
                    repetidor.DataBind();
                }
            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx", false);
            }

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        protected void agregar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Formulario.aspx");
        }

        protected void verDetalles_Click(object sender, EventArgs e)
        {
            try
            {
                string id = ((Button)sender).CommandArgument;
                Response.Redirect("DetallesArticulo.aspx?ID=" + id + "", false);
            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx", false);
            }

        }


        protected void modificarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                string id = ((Button)sender).CommandArgument;
                Response.Redirect("Formulario.aspx?ID="+id+"");
            }
            catch (Exception ex)
            {

               
                throw ex;
            }


        }





        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                string ID = hiddenFieldId.Value;



                Controler control = new Controler();


                if (ID != "")
                    control.Eliminar(int.Parse(ID));

                Response.Redirect("Productos.aspx", false);




            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx", false);
            }
        }

        protected void busquedaDeArticulos_TextChanged(object sender, EventArgs e)
        {
            Controler control = new Controler();

            try
            {

                NuevaLista = control.listar().FindAll(x => x.Nombre.ToUpper().Contains(busquedaDeArticulos.Text.ToUpper()) || x.Codigo.ToUpper().Contains(busquedaDeArticulos.Text.ToUpper()) || x.Categoria.ToUpper().Contains(busquedaDeArticulos.Text.ToUpper()) || x.Marca.ToUpper().Contains(busquedaDeArticulos.Text.ToUpper()));
                repetidor.DataSource = NuevaLista;
                repetidor.DataBind();



            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx", false);
            }

        }
    }
}