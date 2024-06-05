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
    public partial class frmTrapecio : Form
    {
        Trapecio trapecio;
        public frmTrapecio()
        {
            InitializeComponent();
        }

        public void Clean()
        {
            txtBaseMayor.Text = string.Empty;
            txtBaseMenor.Text = string.Empty;
            txtAltura.Text = string.Empty;
            txtArea.Text = string.Empty;
            txtPerimeter.Text = string.Empty;
            picCanvas.Refresh();

            txtBaseMayor.Focus();
        }
        private void btnCalculate_Click(object sender, EventArgs e)
        {
            trapecio = new Trapecio();
            if (trapecio.LeerDatos(txtBaseMayor, txtBaseMenor, txtAltura))
            {
                trapecio.AreaTrapecio();
                trapecio.PerimetroTrapecio();
                trapecio.ImprimirDatos(txtPerimeter, txtArea);
                trapecio.DibujarForma(picCanvas);
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
