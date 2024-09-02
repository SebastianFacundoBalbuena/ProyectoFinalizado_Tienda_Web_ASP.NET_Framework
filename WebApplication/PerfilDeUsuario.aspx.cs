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
    public partial class PerfilDeUsuario : System.Web.UI.Page
    {
		public Usuarios usuario { get; set; }
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
					if (!IsPostBack)
					{

                        usuario = (Usuarios)Session["UsuarioActivo"];

                        barraNombre.Text = usuario.Nombre;
                        barraApellido.Text = usuario.Apellido;
                        barraContraseña.Text = usuario.Contraseña;
                        barraImagen.Text = usuario.ImagenDePerfil;
						panelImagen.Src = usuario.ImagenDePerfil.ToString();

                    }

				}


			}
			catch (Exception ex)
			{

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }

        protected void barraImagen_TextChanged(object sender, EventArgs e)
        {
			if(barraImagen.Text != "")
			{
			   panelImagen.Src = barraImagen.Text;
			}
        }

        protected void VolverAtras_Click(object sender, EventArgs e)
        {
			Response.Redirect("ProductosCliente.aspx", false);
        }

        protected void GuardarCambios_Click(object sender, EventArgs e)
        {
			try
			{
				Usuarios UserModificado = new Usuarios();
				Usuarios UserViejo = new Usuarios();
				UserViejo = (Usuarios)Session["UsuarioActivo"];
				Controler control = new Controler();

				if(barraApellido.Text != "" && barraNombre.Text != "" &&  barraContraseña.Text != "" && barraImagen.Text != "")
				{

                    UserModificado.Id = UserViejo.Id;
                    UserModificado.Nombre = barraNombre.Text;
                    UserModificado.Apellido = barraApellido.Text;
                    UserModificado.Contraseña = barraContraseña.Text;
                    UserModificado.ImagenDePerfil = barraImagen.Text;

                    control.ModificarUsuario(UserModificado);
                    Response.Redirect("ProductosCliente.aspx", false);

                }



				
			}
			catch (Exception ex)
			{

				
				Session.Add("Error", ex.ToString());
				Response.Redirect("Error.aspx", false);
			}
        }

        protected void cerrarSesion_Click(object sender, EventArgs e)
        {
			Session.Remove("UsuarioActivo");
			Response.Redirect("Login.aspx", false);
        }
    }
}