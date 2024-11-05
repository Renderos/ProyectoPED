using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProyectoPED
{
    public partial class agregarPacientes : Form
    {
        public agregarPacientes()
        {
            InitializeComponent();
        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Paciente paciente = new Paciente();
            paciente.id = Convert.ToInt32(textBox7.Text);
            paciente.dui = textBox1.Text;
            paciente.nombre = textBox2.Text;
            paciente.edad = Convert.ToInt32(textBox3.Text);
            paciente.telefono = textBox4.Text;
            paciente.sexo = comboBox1.Text;
            paciente.peso = Convert.ToDecimal(textBox5.Text);
            paciente.tipoSangre = comboBox2.Text;
            paciente.estatura = Convert.ToDecimal(textBox6.Text);

        }
    }

}

