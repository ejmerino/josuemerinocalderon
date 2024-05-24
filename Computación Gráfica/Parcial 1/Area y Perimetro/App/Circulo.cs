using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AreaYPerimetro
{
    public partial class Circulo : Form
    {
        public Circulo()
        {
            InitializeComponent();
        }

        private void btnCalcular_Click(object sender, EventArgs e)
        {
            int radio;
            if (int.TryParse(txtRadio.Text, out radio) && radio > 0)
            {
                double area = Math.Pow(radio,2) * Math.PI;
                double perimetro = 2*Math.PI*radio;

                lblAreaResultado.Text = area.ToString() + " cm^2";
                lblPerimetroResultado.Text = perimetro.ToString() + " cm";
            }
            else
            {
                MessageBox.Show("Por favor, ingresa un número válido mayor que 0.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            lblAreaResultado.Text = "";
            lblPerimetroResultado.Text = "";
            txtRadio.Text = "";
        }

        private void btnAtras_Click(object sender, EventArgs e)
        {
            Form1 form1 = new Form1();
            form1.Show();
            this.Hide();
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
