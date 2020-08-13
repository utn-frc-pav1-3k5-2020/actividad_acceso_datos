using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BugTracker
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            //Se inicializan los controles del formulario, si se elimina el formulario se inicia vacio (sin controles ).
            InitializeComponent();
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            // Terminamos la aplicacion dado que el usuario no inicio sesion.
            Environment.Exit(0);
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {
            //Validamos que se haya ingresado un usuario.
            if ((txtUsuario.Text == ""))
            {
                MessageBox.Show("Se debe ingresar un usuario.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            //Validamos que se haya ingresado una password
            if ((txtPassword.Text == ""))
            {
                MessageBox.Show("Se debe ingresar una contraseña.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            //Controlamos que las creadenciales sean las correctas. 
            if (ValidarCredenciales(txtUsuario.Text, txtPassword.Text))
            {
                // Mostramos un mensaje afirmativo en caso de que el usuario sea valido.
                MessageBox.Show("Usted a ingresado al sistema.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.Close();
            }
            else
            {
                //Limpiamos el campo password, para que el usuario intente ingresar un usuario distinto.
                txtPassword.Text = "";
                // Enfocamos el cursor en el campo password para que el usuario complete sus datos.
                txtPassword.Focus();
                //Mostramos un mensaje indicando que el usuario/password es invalido.
                MessageBox.Show("Debe ingresar usuario y/o contraseña válidos", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public bool ValidarCredenciales(string pUsuario, string pPassword)
        {
            //Inicializamos la variable usuarioValido en false, para que solo si el usuario es valido retorne true
            bool usuarioValido = false;
            
            //La doble barra o */ nos permite escribir comentarios sobre nuestro codigo sin afectar su funcionamiento.

            //Creamos una conexion a base de datos nueva.
            SqlConnection conexion = new SqlConnection();

            //Definimos la cadena de conexion a la base de datos.
            conexion.ConnectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=BugTracker81295;Integrated Security=true;";

            //La sentencia try...catch nos permite "atrapar" excepciones (Errores) y dar al usuario un mensaje más amigable.
            try
            {
                //Abrimos la conexion a la base de datos.
                conexion.Open();

                //Construimos la consulta sql para buscar el usuario en la base de datos.
                String consultaSql = string.Concat(" SELECT * ",
                                                   "   FROM Usuarios ",
                                                   "  WHERE usuario =  '", pUsuario, "'");

                //Creamos un objeto command para luego ejecutar la consulta sobre la base de datos
                SqlCommand command = new SqlCommand(consultaSql, conexion);
                
                // El metodo ExecuteReader retorna un objeto SqlDataReader con la respuesta de la base de datos. 
                // Con SqlDataReader los datos se leen fila por fila, cambiando de fila cada vez que se ejecuta el metodo Read()
                SqlDataReader reader = command.ExecuteReader();

                // El metodo Read() lee la primera fila disponible, si NO existe una fila retorna false (la consulta no devolvio resultados).
                if (reader.Read())
                {
                    //En caso de que exista el usuario, validamos que password corresponda al usuario
                    if (reader["password"].ToString() == pPassword)
                    {
                        usuarioValido = true;
                    }
                }

            }
            catch (SqlException ex)
            {
                //Mostramos un mensaje de error indicando que hubo un error en la base de datos.
                MessageBox.Show(string.Concat("Error de base de datos: ", ex.Message), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //Preguntamos si el estado de la conexion es abierto antes de cerrar la conexion.
                if (conexion.State == ConnectionState.Open)
                {
                    //Cerramos la conexion
                    conexion.Close();
                }
            }

            // Retornamos el valor de usuarioValido. 
            return usuarioValido;
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            //Mostramos el formulario al centro del formulario padre.
            this.CenterToParent();
        }
    }

}
