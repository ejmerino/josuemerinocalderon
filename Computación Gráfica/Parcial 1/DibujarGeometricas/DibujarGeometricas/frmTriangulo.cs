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
    public partial class frmTriangulo : Form
    {
        Triangulo triangulo;
        public frmTriangulo()
        {
            InitializeComponent();
        }

        public void Clean()
        {
            txtBase.Text = string.Empty;
            txtAltura.Text = string.Empty;
            txtArea.Text = string.Empty;
            txtPerimeter.Text = string.Empty;
            picCanvas.Refresh();

            txtBase.Focus();
        }
        private void btnCalculate_Click(object sender, EventArgs e)
        {
            triangulo = new Triangulo();
            if (triangulo.ReadData(txtBase, txtAltura))
            {
                triangulo.AreaRectangle();
                triangulo.PerimeterRectangle();
                triangulo.PrintData(txtPerimeter, txtArea);
                triangulo.PlotShape(picCanvas);
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            Clean();
        }
    }
}
