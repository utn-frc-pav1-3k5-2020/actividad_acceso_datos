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

namespace TPS_InicioSesion
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Environment.Exit(0);
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {
            if ((txtUsuario.Text == ""))
            {
                MessageBox.Show("Se debe ingresar un usuario.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            if ((txtPassword.Text == ""))
            {
                MessageBox.Show("Se debe ingresar una contraseña.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }


            if (ValidarCredenciales(txtUsuario.Text, txtPassword.Text))
            {
                MessageBox.Show("Usted a ingresado al sistema.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.Close();
            }
            else
            {
                txtUsuario.Text = "";
                txtPassword.Text = "";
                MessageBox.Show("Debe ingresar usuario y/o contraseña válidos", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public bool ValidarCredenciales(string pUsuario, string pPassword)
        {
            bool usuarioValido = false;

            SqlConnection conexion = new SqlConnection();

            conexion.ConnectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=BugTracker;Integrated Security=True";

            try
            {
                conexion.Open();

                String consultaSQL = string.Concat("SELECT * ",
                                                        "FROM Usuarios ",
                                                        "WHERE usuarios = '", pUsuario, "'");
                SqlCommand command = new SqlCommand(consultaSQL, conexion);

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    if (reader["password"].ToString() == pPassword)
                    {
                        usuarioValido = true;
                    }
                }
            }

            catch(SqlException ex)
            {
                MessageBox.Show(string.Concat("error de base de datos : ",ex.Message), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            this.CenterToParent();
        }



    }

        
}


