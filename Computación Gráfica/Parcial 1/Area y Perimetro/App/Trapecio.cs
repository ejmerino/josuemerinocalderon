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
    public partial class Trapecio : Form
    {
        public Trapecio()
        {
            InitializeComponent();
        }

        private void btnCalcular_Click(object sender, EventArgs e)
        {
            int lado, baseMayor, baseMenor, altura;
            if (int.TryParse(txtLado.Text, out lado) && lado > 0 && int.TryParse(txtBaseMayor.Text, out baseMayor) && baseMayor > 0 && int.TryParse(txtBaseMenor.Text, out baseMenor) && baseMenor > 0 && int.TryParse(txtAltura.Text, out altura) && altura > 0)
            {
                double perimetro = baseMayor + baseMenor + (lado*2);
                double area = ((baseMayor+baseMenor) / 2.0) * altura;

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
            txtBaseMenor.Text = "";
            txtBaseMayor.Text = "";
            txtAltura.Text = "";
            txtLado.Text = "";
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnAtras_Click(object sender, EventArgs e)
        {
            Form1 form1 = new Form1();
            form1.Show();
            this.Hide();
        }
    }
}
