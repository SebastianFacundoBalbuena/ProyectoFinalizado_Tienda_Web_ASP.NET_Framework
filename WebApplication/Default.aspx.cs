using Dominio;
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
            try
            {
                if (Session["UsuarioActivo"] == null)
                {
                    Response.Redirect("Login.aspx", false);
                }
                else
                {
                    Usuarios usuario = new Usuarios();
                    usuario = (Usuarios)Session["UsuarioActivo"];

                    if(usuario.TipoDeUsuario == 0)
                    {

                        Session.Add("Error", "Debes ser administrador para acceder a esta pagina");
                        Response.Redirect("Error.aspx", false);
                    }
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
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

        protected void ModoCliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioClientes.aspx", false);
        }
    }
}