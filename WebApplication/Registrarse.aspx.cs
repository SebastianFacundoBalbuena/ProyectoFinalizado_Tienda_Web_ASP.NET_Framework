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
        public string Pass {  get; set; }
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
                bool ValidarEmail = false;
                

                

                NewUsuario.Nombre = barraNombre.Text;
                NewUsuario.Apellido = barraApellido.Text;
                NewUsuario.Email = barraEmail.Text;
                NewUsuario.Contraseña = barraContraseña.Text;
                NewUsuario.TipoDeUsuario = 0;
                NewUsuario.ImagenDePerfil = "https://img.freepik.com/vector-premium/icono-marco-fotos-foto-vacia-blanco-vector-sobre-fondo-transparente-aislado-eps-10_399089-1290.jpg";

                ValidarEmail = control.TodosLosUsuarios(NewUsuario);

                if(ValidarEmail == true)
                {
                    Session.Add("Error", "Ya existe un usuario con el Email ingresado");
                    Response.Redirect("Error.aspx", false);
                }
                else
                {
                    control.AgregarUsuario(NewUsuario);
                    Response.Redirect("Login.aspx", false);
                }



            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void CheckContraseñaVisible_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                bool esCheck = CheckContraseñaVisible.Checked;


                if (esCheck == true)
                {
                    Pass = barraContraseña.Text;
                }
                else
                {
                    Pass = "";
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error", false);
            }
        }
    }
}