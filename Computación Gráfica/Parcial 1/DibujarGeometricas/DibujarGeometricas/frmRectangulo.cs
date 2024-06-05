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
    public partial class frmRectangulo : Form
    {
        Rectangulo rectangulo;
        public frmRectangulo()
        {
            InitializeComponent();
        }

        public void Clean()
        {
            txtWidth.Text = string.Empty;
            txtHeight.Text = string.Empty;
            txtArea.Text = string.Empty;
            txtPerimeter.Text = string.Empty;
            picCanvas.Refresh();

            txtWidth.Focus();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnCalculate_Click(object sender, EventArgs e)
        {
            rectangulo = new Rectangulo();
            if (rectangulo.ReadData(txtWidth, txtHeight))
            {
                rectangulo.AreaRectangle();
                rectangulo.PerimeterRectangle();
                rectangulo.PrintData(txtPerimeter, txtArea);
                rectangulo.PlotShape(picCanvas);
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            Clean();
        }

        private void txtWidth_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnExit_Click_1(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnCalculate_Click_1(object sender, EventArgs e)
        {
            rectangulo = new Rectangulo();
            if (rectangulo.ReadData(txtWidth, txtHeight))
            {
                rectangulo.AreaRectangle();
                rectangulo.PerimeterRectangle();
                rectangulo.PrintData(txtPerimeter, txtArea);
                rectangulo.PlotShape(picCanvas);
            }
        }

        private void btnReset_Click_1(object sender, EventArgs e)
        {
            Clean();
        }
    }
}
