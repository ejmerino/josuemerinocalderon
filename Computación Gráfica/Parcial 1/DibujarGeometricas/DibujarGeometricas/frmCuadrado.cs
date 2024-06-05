using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DibujarGeometricas
{
    public partial class frmCuadrado : Form
    {
        Cuadrado cuadrado;
        public frmCuadrado()
        {
            InitializeComponent();
        }

        private void lblWidht_Click(object sender, EventArgs e)
        {

        }

        private void txtWidth_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnCalculate_Click(object sender, EventArgs e)
        {
            cuadrado = new Cuadrado();
            if (cuadrado.ReadData(txtLado))
            {
                cuadrado.AreaSquare();
                cuadrado.PerimeterSquare();
                cuadrado.PrintData(txtPerimeter, txtArea);
                cuadrado.PlotShape(picCanvas);
            }
        }

        public void Clean()
        {
            txtLado.Text = string.Empty;
            txtArea.Text = string.Empty;
            txtPerimeter.Text = string.Empty;
            picCanvas.Refresh();

            txtLado.Focus();
        }
        private void btnReset_Click(object sender, EventArgs e)
        {
            Clean();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
