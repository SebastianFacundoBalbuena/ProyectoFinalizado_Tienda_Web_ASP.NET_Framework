using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controllers;
using Dominio;


namespace WebApplication
{
    public partial class Registros : System.Web.UI.Page
    {
        public List<Articulos> lista = new List<Articulos>();



        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                Controler control = new Controler();
                lista = control.listar();
        

                if (!IsPostBack)
                {
                    panelderegistro.DataSource = control.Registro();
                    panelderegistro.DataBind();

                    List<string> nombres = new List<string>();
                    foreach (Dominio.Articulos item in lista)
                    {
                        nombres.Add(item.Nombre);
                    }

                    barraproducto.DataSource = nombres;
                    barraproducto.DataBind();


                    barracantidad.Text = "1";
                    foreach (var item in lista)
                    {
                        if (barraproducto.Text.ToUpper() == item.Nombre.ToUpper())
                            labelpreciototal.Text = "Precio total: AR$" + item.Precio + "";
                    }
                }



            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx",false);
            }


        }

        protected void botonagregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (barracodigo.Text != "")
                {
                    foreach (var item in lista)
                    {
                        if (item.Codigo.ToUpper() == barracodigo.Text.ToUpper())
                        {
                            RegistroDeVentas newRegistro = new RegistroDeVentas();
                            newRegistro.Codigo = item.Codigo;
                            newRegistro.Producto = item.Nombre;
                            if (barracantidad.Text != "")
                            {
                                newRegistro.Cantidad = int.Parse(barracantidad.Text);
                            }
                            else
                            {
                                newRegistro.Cantidad = 1;
                            }
                            string precioFinal = labelpreciototal.Text.Replace("Precio total: AR$", "");
                            newRegistro.Precio = decimal.Parse(precioFinal);
                            newRegistro.Fecha = DateTime.Now.ToString("yyyy-MM-dd");

                            Controler control = new Controler();
                            control.Nuevoregistro(newRegistro);
                            Response.Redirect("Registros.aspx", false);


                        }
                    }
                }
                else if (barracodigo.Text == "")
                {
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception )
            {

                Response.Redirect("Error.aspx", false);
            }
        }

        protected void barracantidad_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string producto = barraproducto.Text;
                decimal cantidad = int.Parse(barracantidad.Text);
                decimal productoPrecio = 0;
                if (barracodigo.Text != "")
                    foreach (var item in lista)
                    {
                        if (item.Codigo.ToUpper() == barracodigo.Text.ToUpper())
                            productoPrecio = item.Precio;

                    }
                if (barracantidad.Text != "")
                {
                    decimal PrecioFinal = cantidad * productoPrecio;
                    labelpreciototal.Text = "Precio total: AR$" + PrecioFinal + "";
                    barraproducto.Text = producto;
                }
                else
                {
                    decimal PrecioFinal = 1 * productoPrecio;
                    labelpreciototal.Text = "Precio total: AR$" + PrecioFinal + "";
                    barraproducto.Text = producto;

                }


            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx", false);
            }
        }

        protected void barracodigo_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string nombre = "";
                if (barracodigo.Text != "")
                {
                    foreach (Dominio.Articulos item in lista)
                    {
                        string codigo = item.Codigo.ToUpper();
                        if (barracodigo.Text.ToUpper() == codigo)
                        {

                            nombre = item.Nombre;
                            barraproducto.Text = nombre.ToString();
                            barraproducto.DataBind();
                            labelpreciototal.Text = "Precio total: AR$" + item.Precio + "";

                        }

                    }
                }
            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx", false);
            }
        }

        protected void botonBuscarxFecha_Click(object sender, EventArgs e)
        {
            try
            {
                List<RegistroDeVentas> ListaDeArt = new List<RegistroDeVentas>();
                Controler control = new Controler();


                if (barraFecha.Text == "")
                {
                    
                    panelderegistro.DataSource = control.Registro();
                    panelderegistro.DataBind();
                }
                else if (tipoDeFecha.Text == "Mes")
                {
                    ListaDeArt = control.Registro().FindAll(x => x.Fecha.Contains("-" + barraFecha.Text + "-"));
                  
                    panelderegistro.DataSource = ListaDeArt;
                    panelderegistro.DataBind();
                }
                else if (tipoDeFecha.Text == "Año")
                {
                    ListaDeArt = control.Registro().FindAll(x => x.Fecha.Contains("-" + barraFecha.Text + ""));
                    
                    panelderegistro.DataSource = ListaDeArt;
                    panelderegistro.DataBind();
                }
                else if (tipoDeFecha.Text == "Dia-Mes-Año")
                {
                    ListaDeArt = control.Registro().FindAll(x => x.Fecha.Contains("" + barraFecha.Text + ""));
                   
                    panelderegistro.DataSource = ListaDeArt;
                    panelderegistro.DataBind();
                }


            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx", false);
            }
        }

        protected void Inicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        protected void panelderegistro_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
               

                int indice = int.Parse(e.CommandArgument.ToString());
                

                Controler control = new Controler();

                
                RegistroDeVentas eliminarRegistro = new RegistroDeVentas();

                if(e.CommandName == "Eliminar")
                {
                    int id = int.Parse(e.CommandArgument.ToString());

                    eliminarRegistro = control.Registro().Find(x => x.ID == id);
                }

                

                control.EliminarRegistro(eliminarRegistro.ID);
                panelderegistro.DataSource = control.Registro();
                panelderegistro.DataBind();
               
            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx", false);
            }

            

        }
    }
}