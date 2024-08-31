using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			try
			{
				if (Session["UsuarioActivo"] != null)
				{
					Usuarios usuario = new Usuarios();
					usuario = (Usuarios)Session["UsuarioActivo"];

					if(usuario.ImagenDePerfil != null)
					{
						IconoImagen.Src = usuario.ImagenDePerfil;
					}
					else
					{
						IconoImagen.Src = "https://img.freepik.com/vector-premium/icono-marco-fotos-foto-vacia-blanco-vector-sobre-fondo-transparente-aislado-eps-10_399089-1290.jpg";
					}
				}
			}
			catch (Exception)
			{

				throw;
			}
        }
    }
}