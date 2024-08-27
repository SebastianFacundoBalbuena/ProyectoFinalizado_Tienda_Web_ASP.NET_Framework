using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class CarroDeCompras
    {

        private int numeroCliente;
        private string productoComprar;
        private decimal precioFinal;

        public int NumeroCliente
        {
            get { return numeroCliente; }
            set { numeroCliente = value; }
        }

        public string ProductoComprar
        {
            get { return productoComprar; }
            set { productoComprar = value; }
        }

        public decimal PrecioFinal
        {
            get { return precioFinal; }
            set { precioFinal = value; }
        }
    }
}
