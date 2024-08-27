using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class InicioClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void IrAProductos_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductosCliente.aspx", false);
        }
    }
}