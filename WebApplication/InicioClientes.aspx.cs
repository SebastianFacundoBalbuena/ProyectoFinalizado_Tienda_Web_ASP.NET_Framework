using Dominio;
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

            try
            {
                if (Session["UsuarioActivo"] != null)
                {
                    Response.Redirect("ProductosCliente.aspx", false);
                }
                else
                {
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }




        }

        protected void botonRegistarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrarse.aspx", false);
        }
    }
}