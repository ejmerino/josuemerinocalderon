using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PoligonoEstrelladoV1
{
    public partial class Form1 : Form
    {
        Polygon SisteenHexagonPolygonStar = new Polygon();
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            SisteenHexagonPolygonStar.InitializeData(txtLadoPoligonal, picCanvas);
        }

        private void txtLadoPoligonal_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnGraphic_Click(object sender, EventArgs e)
        {
            SisteenHexagonPolygonStar.ReadData(txtLadoPoligonal);
            SisteenHexagonPolygonStar.DrawPolygon(picCanvas);
        }

        private void btnClean_Click(object sender, EventArgs e)
        {
            txtLadoPoligonal.Text = "";
            txtLadoPoligonal.Focus();
            picCanvas.Image = null;
            picCanvas.Refresh();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            SisteenHexagonPolygonStar.CloseForm(this);
        }

        private void picCanvas_Click(object sender, EventArgs e)
        {

        }
    }
}
