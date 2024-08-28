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
    public partial class DetallesDeCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ListaVieja"] != null)
            {
                List<Articulos> listaCarritoSessions = Session["ListaVieja"] as List<Articulos>;
                int contador = 0;
                contador = listaCarritoSessions.Count;
                labelCantidad.Text = contador.ToString();

                decimal precioTotal = 0;

                foreach (var item in listaCarritoSessions)
                {
                    precioTotal += item.Precio;
                }

                labelPrecioTotal.Text = "Precio total : AR$" + precioTotal.ToString() + "";
            }

            if (!IsPostBack)
            {
                Controler controler = new Controler();

                repetidor.DataSource = Session["ListaVieja"];
                repetidor.DataBind();


            }
        }

        protected void VolverInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductosCliente.aspx", false);
        }

        protected void AceptarCompra_Click(object sender, EventArgs e)
        {

        }

        protected void detalles_Click(object sender, EventArgs e)
        {
            try
            {
                string ID = ((Button)sender).CommandArgument;

                Response.Redirect("DetallesArticuloCliente.aspx?ID=" + ID + "", false);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void EliminarDelCarrito_Click(object sender, EventArgs e)
        {

            try
            {
                string ID = ((Button)sender).CommandArgument;

                List<Articulos> articulosviejos = Session["ListaVieja"] as List<Articulos>;
                List<Articulos> NewLista = new List<Articulos>();

                NewLista = articulosviejos.FindAll(x => x.Id != int.Parse(ID));

                Session["ListaVieja"] = NewLista;
                labelCantidad.Text = NewLista.Count.ToString();
                decimal precioTotal = 0;

                foreach (var item in NewLista)
                {
                    precioTotal += item.Precio;
                }

                labelPrecioTotal.Text = "Precio total : AR$" + precioTotal.ToString() + "";
                repetidor.DataSource = NewLista;
                repetidor.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}