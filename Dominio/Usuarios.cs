using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuarios
    {
        private int id;
        private string email;
        private string contraseña;
        private int tipoDeUsuario;
        private string fechaNacimiento;
        private string nombre;
        private string apellido;
        private string imagenPerfil;


        //metodos

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }

        }

        public string Contraseña
        {
            get { return contraseña; }
            set { contraseña = value; }
        }

        public int TipoDeUsuario
        {
            get { return tipoDeUsuario; }
            set { tipoDeUsuario = value; }
        }

        public string FechaNacimiento
        {
            get { return fechaNacimiento; }
            set { fechaNacimiento = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string Apellido
        {
            get { return apellido; }
            set { apellido = value; }
        }

        public string ImagenDePerfil
        {
            get { return imagenPerfil; }
            set { imagenPerfil = value; }
        }
    }
}
