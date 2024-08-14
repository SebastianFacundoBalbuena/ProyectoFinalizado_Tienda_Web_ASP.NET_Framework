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

        // Página Load
        protected void Page_Load(object sender, EventArgs e)
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
            string id = ((Button)sender).CommandArgument;


            Response.Redirect("DetallesArticulo.aspx?ID=" + id + "", false);
        }


        protected void modificarProducto_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;

            Response.Redirect("Formulario.aspx?ID=" + id + "");
            
        }





        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                string ID = hiddenFieldId.Value;
                


                Controler control = new Controler();


                if(ID != "")
                control.Eliminar(int.Parse(ID));

                Response.Redirect("Productos.aspx",false);




            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}