using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void botonStock_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Productos.aspx",false);
        }

        protected void botonRegistros_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registros.aspx", false);
        }

        protected void botonReportes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reportes.aspx", false);
        }
    }
}