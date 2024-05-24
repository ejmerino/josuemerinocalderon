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
    public partial class Paralelogramo : Form
    {
        public Paralelogramo()
        {
            InitializeComponent();
        }

        private void btnCalcular_Click(object sender, EventArgs e)
        {
            int largo, ancho;
            if (int.TryParse(txtBase.Text, out largo) && largo > 0 && int.TryParse(txtAltura.Text, out ancho) && ancho > 0)
            {
                int perimetro = (largo * 2) + (ancho * 2);
                int area = largo * ancho;

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
            txtBase.Text = "";
            txtAltura.Text = "";
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
