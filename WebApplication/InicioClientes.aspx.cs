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

                    Response.Redirect("ProductosCliente.aspx", false);
                
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

        protected void btnCelulares_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["usuarioActivo"] != null)
                {
                    Session.Add("Categoria", "Celulares");
                    Response.Redirect("ProductosCliente.aspx", false);
                    

                }
                else
                {
                    Session.Add("Categoria", "Celulares");
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnAudio_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["usuarioActivo"] != null)
                {
                    Session.Add("Categoria", "Audio");
                    Response.Redirect("ProductosCliente.aspx", false);
                    

                }
                else
                {
                    Session.Add("Categoria", "Audio");
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnTelevisores_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["usuarioActivo"] != null)
                {
                    
                    Session.Add("Categoria", "Televisores");
                    Response.Redirect("ProductosCliente.aspx", false);

                }
                else
                {
                    Session.Add("Categoria", "Televisores");
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void btnMedia_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["usuarioActivo"] != null)
                {
                    
                    Session.Add("Categoria", "Media");
                    Response.Redirect("ProductosCliente.aspx", false);

                }
                else
                {
                    Session.Add("Categoria", "Media");
                    Response.Redirect("Login.aspx", false);
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}