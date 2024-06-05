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
    public partial class frmPentagono : Form
    {
        Pentagono pentagono;
        public frmPentagono()
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
            pentagono = new Pentagono();
            if (pentagono.ReadData(txtLado))
            {
                pentagono.AreaPentagono();
                pentagono.PerimetroPentagono();
                pentagono.PrintData(txtPerimeter, txtArea);
                pentagono.PlotShape(picCanvas);
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

        private void grbProcess_Enter(object sender, EventArgs e)
        {

        }
    }
}
