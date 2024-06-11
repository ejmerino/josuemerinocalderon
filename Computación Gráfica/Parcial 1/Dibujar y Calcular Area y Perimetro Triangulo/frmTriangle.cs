using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WinAppTriangle
{    
    public partial class frmTriangle : Form
    {
        CTriangle CTriangle;
        public frmTriangle()
        {
            InitializeComponent();
        }

        public void Clean()
        {
            txtSideA.Text = string.Empty;
            txtSideB.Text = string.Empty;
            txtSideC.Text = string.Empty;
            txtArea.Text = string.Empty;
            txtPerimeter.Text = string.Empty;
            picCanvas.Refresh();

            txtSideA.Focus();
        }


        private void btnCalculate_Click(object sender, EventArgs e)
        {
            CTriangle = new CTriangle();
            if (CTriangle.ReadData(txtSideA,txtSideB,txtSideC) && CTriangle.CheckTriangle(txtSideA, txtSideB, txtSideC))
            {
                CTriangle.AreaTriangle();
                CTriangle.PerimeterTriangle();
                CTriangle.PrintData(txtPerimeter, txtArea);
                CTriangle.PlotShape(picCanvas);
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
