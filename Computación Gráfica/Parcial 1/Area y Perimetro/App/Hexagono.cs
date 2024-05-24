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
    public partial class Hexagono : Form
    {
        public Hexagono()
        {
            InitializeComponent();
        }

        private void btnCalcular_Click(object sender, EventArgs e)
        {
            int lado, apotema;
            if (int.TryParse(txtLado.Text, out lado) && lado > 0 && int.TryParse(txtApotema.Text, out apotema) && apotema > 0)
            {
                double perimetro = lado * 6;
                double area = (perimetro * apotema) / 2.0;

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
            txtLado.Text = "";
            txtApotema.Text = "";
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
