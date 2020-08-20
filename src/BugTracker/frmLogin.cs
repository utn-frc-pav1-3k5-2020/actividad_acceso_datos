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
                MessageBox.Show("Usted ha ingresado al sistema.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
            bool validUser = false;
            

            try
            {
                String consultaSql = string.Concat(" SELECT * ",
                                                   " FROM Usuarios ",
                                                   " WHERE usuario = '", pUsuario, "'");

                DataTable resultado = DataManager.getInstance().ConsultaSQL(consultaSql);

                if (resultado.Rows.Count >= 1)
                {
                    if(resultado.Rows[0]["password"].ToString() == pPassword)
                    {
                        validUser = true;
                    }
                }
            }
            catch(SqlException ex)
            {
                MessageBox.Show(string.Concat("Error de base de datos: ", ex.Message), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                DataManager.getInstance().Close();
            }
            return validUser;
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            this.CenterToParent();
        }
    }

}
