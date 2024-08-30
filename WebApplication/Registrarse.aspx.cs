using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Controllers;

namespace WebApplication
{
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void botonCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", false);
        }

        protected void botonRegistrarse_Click(object sender, EventArgs e)
        {

            try
            {
                Usuarios NewUsuario = new Usuarios();
                Controler control = new Controler();

                NewUsuario.Nombre = barraNombre.Text;
                NewUsuario.Apellido = barraApellido.Text;
                NewUsuario.Email = barraEmail.Text;
                NewUsuario.Contraseña = barraContraseña.Text;
                NewUsuario.TipoDeUsuario = 0;

                control.AgregarUsuario(NewUsuario);
                Response.Redirect("Login.aspx",false);

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}