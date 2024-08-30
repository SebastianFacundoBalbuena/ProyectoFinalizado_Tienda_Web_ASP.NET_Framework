using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void botonRegistrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrarse.aspx",false);
        }

        protected void botonCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioClientes.aspx", false);
        }
    }
}