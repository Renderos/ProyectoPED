using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace ProyectoPED
{
    public partial class agregarCitas : Form
    {
        public agregarCitas()
        {
            InitializeComponent();
            LoadComboBoxes();
        }

        private void comboBoxMedico_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private string connectionString = "Data Source=localhost;Initial Catalog=ProgramaMedico;Integrated Security=True";


        private void LoadComboBoxes()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlDataAdapter da = new SqlDataAdapter("SELECT PacienteID, NombreCompleto FROM Pacientes", conn);
                DataTable dtPacientes = new DataTable();
                da.Fill(dtPacientes);
                comboBoxPaciente.DataSource = dtPacientes;
                comboBoxPaciente.DisplayMember = "NombreCompleto";
                comboBoxPaciente.ValueMember = "PacienteID";

                da = new SqlDataAdapter("SELECT EmpleadoID, NombreCompleto FROM Empleados WHERE TipoEmpleadoID = 1", conn); // Assuming TipoEmpleadoID = 1 for doctors
                DataTable dtMedicos = new DataTable();
                da.Fill(dtMedicos);
                comboBoxMedico.DataSource = dtMedicos;
                comboBoxMedico.DisplayMember = "NombreCompleto";
                comboBoxMedico.ValueMember = "EmpleadoID";
            }
        }

        private void buttonAgendar_Click(object sender, EventArgs e)
        {
          
        }

        private void LimpiarCampos()
        {
            comboBoxPaciente.SelectedIndex = -1;
            comboBoxMedico.SelectedIndex = -1;
            comboBoxHora.SelectedIndex = -1;
            textBoxDescripcion.Clear();
            dateTimePickerFechaHora.Value = DateTime.Now;
        }

        private void button1_Click(object sender, EventArgs e)
        {

            this.Hide();
            selectActionAdmin selectActionAdmin = new selectActionAdmin();
            selectActionAdmin.Show();
        }

 
        private void dateTimePickerFechaHora_ValueChanged(object sender, EventArgs e)
        {

        }
    }
}
