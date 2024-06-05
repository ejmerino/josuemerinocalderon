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
    public partial class frmHexagono : Form
    {
        Hexagono hexagono;
        public frmHexagono()
        {
            InitializeComponent();
        }
        public void Clean()
        {
            txtLado.Text = string.Empty;
            txtArea.Text = string.Empty;
            txtPerimeter.Text = string.Empty;
            picCanvas.Refresh();

            txtLado.Focus();
        }
        private void btnCalculate_Click(object sender, EventArgs e)
        {
            hexagono = new Hexagono();
            if (hexagono.ReadData(txtLado))
            {
                hexagono.AreaHexagono();
                hexagono.PerimetroHexagono();
                hexagono.PrintData(txtPerimeter, txtArea);
                hexagono.PlotShape(picCanvas);
            }
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
