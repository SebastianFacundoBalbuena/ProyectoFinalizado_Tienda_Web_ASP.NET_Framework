using Controllers;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class DetallesArticuloCliente : System.Web.UI.Page
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

        protected void botonVolverde_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductosCliente.aspx", false);
        }
    }
}