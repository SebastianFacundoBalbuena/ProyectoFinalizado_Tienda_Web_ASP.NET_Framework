using Controllers;
using DataBase;
using Dominio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Reportes : System.Web.UI.Page
    {
        public List<RegistroDeVentas> registros { get; set; }

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
                    usuario = (Usuarios)Session["UsuarioActivo"];

                    if (usuario.TipoDeUsuario == 0)
                    {
                        Response.Redirect("InicioClientes.aspx", false);
                    }
                }


                Controler control = new Controler();

                registros = control.Registro();

                //guardar los años
                if (!IsPostBack)
                {
                    List<string> fechas = new List<string>();
                    List<int> años = new List<int>();
                   
                    foreach (var item in registros)
                    {
                        fechas.Add(item.Fecha);
                    }

                    años = fechas.Select(x => DateTime.ParseExact(x, "dd-MM-yyyy", CultureInfo.InvariantCulture).Year).Distinct().OrderByDescending(año => año).ToList();


                    barraAño.DataSource = años;
                    barraAño.DataBind();

                    panelReportes.DataSource = registros.FindAll(x => x.Fecha.Contains("-" + barraAño.Text + ""));
                    panelReportes.DataBind();
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected string ObtenerDatos()
        {

            try
            {
                List<decimal> RegistroXaño = new List<decimal>();
                List<RegistroDeVentas> registrospanel = new List<RegistroDeVentas>();
                DataTable Data = new DataTable();

                Data.Columns.Add(new DataColumn("Topping", typeof(string)));
                Data.Columns.Add(new DataColumn("Slices", typeof(decimal)));

                for (int i = 0; i < 12; i++)
                {
                    RegistroXaño.Add(0);
                }

                foreach (var item in registros)
                {
                    if (item.Fecha.Contains("-" + barraAño.Text))
                    {


                        if (item.Fecha.Contains("-01-"))
                        {
                            RegistroXaño[0] += item.Precio;
                        }
                        else if (item.Fecha.Contains("-02-"))
                        {
                            RegistroXaño[1] += item.Precio;
                        }
                        else if (item.Fecha.Contains("-03-"))
                        {
                            RegistroXaño[2] += item.Precio;
                        }
                        else if (item.Fecha.Contains("-04-"))
                        {
                            RegistroXaño[3] += item.Precio;
                        }
                        else if (item.Fecha.Contains("-05-"))
                        {
                            RegistroXaño[4] += item.Precio;
                        }
                        else if (item.Fecha.Contains("-06-"))
                        {
                            RegistroXaño[5] += item.Precio;
                        }
                        else if (item.Fecha.Contains("-07-"))
                        {
                            RegistroXaño[6] += item.Precio;
                        }
                        else if (item.Fecha.Contains("-08-"))
                        {
                            RegistroXaño[7] += item.Precio;
                        }
                        else if (item.Fecha.Contains("-09-"))
                        {
                            RegistroXaño[8] += item.Precio;
                        }
                        else if (item.Fecha.Contains("-10-"))
                        {
                            RegistroXaño[9] += item.Precio;
                        }
                        else if (item.Fecha.Contains("-11-"))
                        {
                            RegistroXaño[10] += item.Precio;
                        }
                        else if (item.Fecha.Contains("-12-"))
                        {

                            RegistroXaño[11] += item.Precio;
                        }
                    }
                }


                Data.Rows.Add(new object[] { "Enero", decimal.Parse(RegistroXaño[0].ToString("0.##")) });
                Data.Rows.Add(new object[] { "Febrero", decimal.Parse(RegistroXaño[1].ToString("0.##")) });
                Data.Rows.Add(new object[] { "Marzo", decimal.Parse(RegistroXaño[2].ToString("0.##")) });
                Data.Rows.Add(new object[] { "Abril", decimal.Parse(RegistroXaño[3].ToString("0.##")) });
                Data.Rows.Add(new object[] { "Mayo", decimal.Parse(RegistroXaño[4].ToString("0.##")) });
                Data.Rows.Add(new object[] { "Junio", decimal.Parse(RegistroXaño[5].ToString("0.##")) });
                Data.Rows.Add(new object[] { "Julio", decimal.Parse(RegistroXaño[6].ToString("0.##")) });
                Data.Rows.Add(new object[] { "Agosto", decimal.Parse(RegistroXaño[7].ToString("0.##")) });
                Data.Rows.Add(new object[] { "Septiembre", decimal.Parse(RegistroXaño[8].ToString("0.##")) });
                Data.Rows.Add(new object[] { "Octubre", decimal.Parse(RegistroXaño[9].ToString("0.##")) });
                Data.Rows.Add(new object[] { "Noviembre", decimal.Parse(RegistroXaño[10].ToString("0.##")) });
                Data.Rows.Add(new object[] { "Diciembre", decimal.Parse(RegistroXaño[11].ToString("0.##")) });

                string stringDatos;
                stringDatos = "[";

                foreach (DataRow item in Data.Rows)
                {
                    stringDatos = stringDatos + "[";
                    stringDatos = stringDatos + "'" + item[0] + "'" + "," + item[1];
                    stringDatos = stringDatos + "],";
                }
                stringDatos = stringDatos + "]";

                panelReportes.DataSource = registros.FindAll(x => x.Fecha.Contains("-" + barraAño.Text + ""));
                panelReportes.DataBind();

                return stringDatos;
            }
            catch (Exception ex)
            {

                return "Error al obtener datos: " + ex.Message;
            }
        }

        protected void Inicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        protected void barraAño_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ObtenerDatos();
            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx", false);
            }
            
            
        }

    }
}