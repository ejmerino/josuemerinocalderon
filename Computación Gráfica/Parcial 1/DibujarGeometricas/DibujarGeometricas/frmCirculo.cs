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
    public partial class frmCirculo : Form
    {
        Circulo circulo;
        public frmCirculo()
        {
            InitializeComponent();
        }

        private void btnCalculate_Click(object sender, EventArgs e)
        {
            circulo = new Circulo();
            if (circulo.ReadData(txtRadio))
            {
                circulo.AreaCircle();
                circulo.PerimeterCircle();
                circulo.PrintData(txtPerimeter, txtArea);
                circulo.PlotShape(picCanvas);
            }
        }

        public void Clean()
        {
            txtRadio.Text = string.Empty;
            txtArea.Text = string.Empty;
            txtPerimeter.Text = string.Empty;
            picCanvas.Refresh();

            txtRadio.Focus();
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
