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
    public partial class Triangulo : Form
    {
        public Triangulo()
        {
            InitializeComponent();
        }

        private void btnCalcular_Click(object sender, EventArgs e)
        {
            int baseTriangulo, altura;
            if (int.TryParse(txtBase.Text, out baseTriangulo) && baseTriangulo > 0 && int.TryParse(txtAltura.Text, out altura) && altura > 0)
            {
                double hipotenusa = Math.Sqrt(Math.Pow(baseTriangulo, 2) + Math.Pow(altura, 2));
                double perimetro = baseTriangulo + altura + hipotenusa;
                double area = (baseTriangulo * altura) / 2.0;

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
            txtAltura.Text = "";
            txtBase.Text = "";
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
