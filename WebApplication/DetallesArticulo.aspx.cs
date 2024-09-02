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
                if (Session["UsuarioActivo"] == null)
                {
                    Response.Redirect("Login.aspx", false);
                }
                else
                {
                    Usuarios usuario = new Usuarios();
                    usuario = Session["UsuarioActivo"] as Usuarios;

                    if (usuario.TipoDeUsuario == 0)
                    {
                        Session.Add("Error", "Debes ser administrador para acceder a esta pagina");
                        Response.Redirect("Error.aspx", false);

                    }
                        
                }


                Controler control = new Controler();
                Lista = control.listar();
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }




        }

        protected void botonVolverdeDetalles_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx",false);
        }
    }
}