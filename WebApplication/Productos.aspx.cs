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


            Response.Redirect("DetallesArticulo.aspx?ID=" + id + "");
        }
    }
}