using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Controllers;

namespace WebApplication
{
    public partial class DetallesArticulo : System.Web.UI.Page
    {
        public List<Articulos> Lista { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Controler control = new Controler();
                Lista = control.listar();
            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx", false);
            }




        }

        protected void botonVolverdeDetalles_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx");
        }
    }
}