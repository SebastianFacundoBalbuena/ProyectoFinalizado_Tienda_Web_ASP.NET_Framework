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
    public partial class Login : System.Web.UI.Page
    {
        public string Pass { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void botonRegistrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrarse.aspx",false);
        }

        protected void botonCancelar_Click(object sender, EventArgs e)
        {
            Session.Remove("Categoria");
            Response.Redirect("InicioClientes.aspx", false);
        }

        protected void BtnIniciarSesion_Click(object sender, EventArgs e)
        {

            try
            {
                Controler control = new Controler();
                Usuarios NewUsuario = new Usuarios();
                Usuarios Activo = new Usuarios();

                NewUsuario.Email = barraEmail.Text;
                NewUsuario.Contraseña = barraContraseña.Text;

                Activo = control.ValidarUsuario(NewUsuario);




                if(Activo.Id != 0)
                {

                    if(Activo.TipoDeUsuario == 0)
                    {
                        Session.Add("UsuarioActivo", Activo);
                        Response.Redirect("ProductosCliente.aspx", false);
                    } else
                    {
                        Session.Add("UsuarioActivo", Activo);
                        Response.Redirect("Default.aspx", false);
                    }


                }
                else
                {
                    Session.Add("Error", "Email o Contraseña incorrecta.");
                    Response.Redirect("Error.aspx", false);
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