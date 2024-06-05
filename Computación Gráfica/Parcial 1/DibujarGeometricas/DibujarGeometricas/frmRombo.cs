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
    public partial class frmRombo : Form
    {
        Rombo rombo;
        public frmRombo()
        {
            InitializeComponent();
        }
        public void Clean()
        {
            txtDiagonalMayor.Text = string.Empty;
            txtDiagonalMenor.Text = string.Empty;
            txtArea.Text = string.Empty;
            txtPerimeter.Text = string.Empty;
            picCanvas.Refresh();

            txtDiagonalMayor.Focus();
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
            rombo = new Rombo();
            if (rombo.ReadData(txtDiagonalMayor, txtDiagonalMenor))
            {
                rombo.AreaRombo();
                rombo.PerimetroRombo();
                rombo.PrintData(txtPerimeter, txtArea);
                rombo.PlotShape(picCanvas);
            }
        }
    }
}
