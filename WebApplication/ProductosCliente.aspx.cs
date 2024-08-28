using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controllers;
using Dominio;

namespace WebApplication
{
    public partial class ProductosCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Controler control = new Controler();

            try
            {
                if (!IsPostBack)
                {
                    repetidor.DataSource = control.listar();
                    repetidor.DataBind();
                }

                if (Session["ListaVieja"] != null)
                {
                    List<Articulos> listaCarritoSessions = Session["ListaVieja"] as List<Articulos>;
                    int contador = 0;
                    contador = listaCarritoSessions.Count;
                    labelCantidad.Text = contador.ToString();
                }
            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx", false);
            }


        }

        protected void detalles_Click(object sender, EventArgs e)
        {
            try
            {
                string ID = ((Button)sender).CommandArgument;

                Response.Redirect("DetallesArticuloCliente.aspx?ID="+ID+"", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void VolverInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("InicioClientes.aspx", false);
        }

        protected void BuscarArticulos_Click(object sender, EventArgs e)
        {
            try
            {
                Controler control = new Controler();

                if(barraBuscar.Text != "")
                {
                    repetidor.DataSource = control.listar().FindAll(x => x.Nombre.ToUpper().Contains(barraBuscar.Text.ToUpper()) || x.Marca.ToUpper().Contains(barraBuscar.Text.ToUpper()) || x.Categoria.ToUpper().Contains(barraBuscar.Text.ToUpper()));
                    repetidor.DataBind();
                }
                else if(barraBuscar.Text == "")
                {
                    repetidor.DataSource = control.listar();
                    repetidor.DataBind();
                }
            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx", false);
            }
        }

        protected void AgregarCarrito_Click(object sender, EventArgs e)
        {

            
            Controler control = new Controler();

            try
            {
                int contador = 0;
                string ID = ((Button)sender).CommandArgument;
                Articulos art;
                art = control.listar().Find(x => x.Id == int.Parse(ID));
                

                
                List<Articulos> listaVieja = new List<Articulos>();
                if (Session["ListaVieja"] != null)
                {
                    listaVieja = Session["ListaVieja"] as List<Articulos>;
                }
                
                listaVieja.Add(art);

                Session["ListaVieja"] = listaVieja;

                List<Articulos> listaCarritoSessions = Session["ListaVieja"] as List<Articulos>;
                contador = listaCarritoSessions.Count;
                labelCantidad.Text = contador.ToString();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}