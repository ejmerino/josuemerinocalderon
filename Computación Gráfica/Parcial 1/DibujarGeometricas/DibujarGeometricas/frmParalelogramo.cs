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
    public partial class frmParalelogramo : Form
    {
        Paralelogramo paralelogramo;
        public frmParalelogramo()
        {
            InitializeComponent();
        }

        public void Clean()
        {
            txtBase.Text = string.Empty;
            txtAltura.Text = string.Empty;
            txtAngulo.Text = string.Empty;
            txtArea.Text = string.Empty;
            txtPerimeter.Text = string.Empty;
            picCanvas.Refresh();

            txtBase.Focus();
        }
        private void btnReset_Click(object sender, EventArgs e)
        {
            Clean();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnCalculate_Click(object sender, EventArgs e)
        {
            paralelogramo = new Paralelogramo();
            if (paralelogramo.ReadData(txtAltura, txtBase, txtAngulo))
            {
                paralelogramo.AreaParalelogramo();
                paralelogramo.PerimetroParalelogramo();
                paralelogramo.PrintData(txtPerimeter, txtArea);
                paralelogramo.PlotShape(picCanvas);
            }
        }
    }
}
