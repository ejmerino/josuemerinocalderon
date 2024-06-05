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
    public partial class frmMenu : Form
    {
        public frmMenu()
        {
            InitializeComponent();
        }

        private void btnRectangulo_Click(object sender, EventArgs e)
        {
            frmRectangulo frmRectangulo = new frmRectangulo();
            frmRectangulo.Show();
        }

        private void btnCuadrado_Click(object sender, EventArgs e)
        {
            frmCuadrado frmCuadrado = new frmCuadrado();
            frmCuadrado.Show();
        }

        private void btnCirculo_Click(object sender, EventArgs e)
        {
            frmCirculo frmCirculo = new frmCirculo();
            frmCirculo.Show();
        }

        private void btnTriangulo_Click(object sender, EventArgs e)
        {
            frmTriangulo frmTriangulo = new frmTriangulo();
            frmTriangulo.Show();
        }

        private void btnPentagono_Click(object sender, EventArgs e)
        {
            frmPentagono frmPentagono = new frmPentagono();
            frmPentagono.Show();
        }

        private void btnHexagono_Click(object sender, EventArgs e)
        {
            frmHexagono frmHexagono = new frmHexagono();
            frmHexagono.Show();
        }

        private void btnRombo_Click(object sender, EventArgs e)
        {
            frmRombo frmRombo = new frmRombo();
            frmRombo.Show();
        }

        private void btnParalelogramo_Click(object sender, EventArgs e)
        {
            frmParalelogramo frmParalelogramo = new frmParalelogramo();
            frmParalelogramo.Show();
        }

        private void btnTrapecio_Click(object sender, EventArgs e)
        {
            frmTrapecio frmTrapecio = new frmTrapecio();
            frmTrapecio.Show();
        }
    }
}
