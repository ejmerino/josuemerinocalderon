using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WinAppTenGemFivePolygon
{
    public partial class frmTenGemFivePolygon : Form
    {
        // Definición de un objeto de tipo CTenPointGemPoligon.
        CTenGemFivePolygon ObjTenGemFiveStarPolygon = new CTenGemFivePolygon();

        float rotationAngle = 0f; // Ángulo de rotación en grados
        // Variables de desplazamiento
        public float translateX = 0f, translateY = 0f;

        public frmTenGemFivePolygon()
        {
            InitializeComponent();
            trackBar1.Maximum = 50;
            trackBar1.Value = 10;
            ObjTenGemFiveStarPolygon.SF = trackBar1.Value;
            picCanvas.TabStop = true;
            trackBar1.Scroll += trackBar1_Scroll;
            btnderecha.Click += btnderecha_Click;
            btnizquierda.Click += btnizquierda_Click;
            this.KeyDown += OnKeyPress;

            //this.KeyPreview = true;
        }

        private void frmTenGemFivePolygon_Load(object sender, EventArgs e)
        {
            // Inicialización de los datos y controles.
            // Llamada a la función InitializeData.
            ObjTenGemFiveStarPolygon.InitializeData(txtSide, picCanvas, trackBar1);
        }

        private void btnCalculate_Click(object sender, EventArgs e)
        {
            // Lectura de datos.
            // Llamada a la función ReadData.
            ObjTenGemFiveStarPolygon.ReadData(txtSide);

            ObjTenGemFiveStarPolygon.PlotFigures(picCanvas,0,translateX,translateY);
           // picCanvas.Focus();
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            // Inicialización de los datos y controles.
            // Llamada a la función InitializeData.
            ObjTenGemFiveStarPolygon.InitializeData(txtSide, picCanvas, trackBar1);
            rotationAngle = 0f;
            picCanvas.Focus();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            // Cierre de un formulario.
            // Llamada a la función CloseForm.
            ObjTenGemFiveStarPolygon.CloseForm(this);
        }

        private void picCanvas_Click(object sender, EventArgs e)
        {
            picCanvas.Focus();
        }

        private void lblSide_Click(object sender, EventArgs e)
        {

        }

        private void grbProcess_Enter(object sender, EventArgs e)
        {

        }

        private void btnizquierda_Click(object sender, EventArgs e)
        {
            picCanvas.Refresh();
            translateX -= 10.0f; // Mueve a la izquierda
            ObjTenGemFiveStarPolygon.PlotFigures(picCanvas, rotationAngle, translateX, translateY);
            picCanvas.Focus();
        }

        private void btnderecha_Click(object sender, EventArgs e)
        {
            picCanvas.Refresh();
            translateX += 10.0f; // Mueve a la derecha
            ObjTenGemFiveStarPolygon.PlotFigures(picCanvas, rotationAngle, translateX, translateY);
            picCanvas.Focus();
        }

        private void trackBar1_Scroll(object sender, EventArgs e)
        {
            ObjTenGemFiveStarPolygon.SF = trackBar1.Value;
           // rotationAngle = 0f;
            //ObjTenGemFiveStarPolygon.PlotFigures(picCanvas, rotationAngle, 0, 0);
            picCanvas.Invalidate();
        }

        private void grbCanvas_Enter(object sender, EventArgs e)
        {

        }

        // Métodos para manejar eventos de teclado (debes asociar estos métodos a eventos del teclado).
        public void OnKeyPress(object sender, KeyEventArgs e)
        {
            switch (e.KeyCode)
            {
                case Keys.A:
                    translateX -= 2;
                    break;
                case Keys.D:
                    translateX += 2;
                    break;
                case Keys.S:
                    translateY -= 2;
                    break;
                case Keys.W:
                    translateY += 2;
                    break;
            }
            //ObjTenGemFiveStarPolygon.ApplyTranslation();
            //ObjTenGemFiveStarPolygon.PlotFigures(picCanvas, 0);
            picCanvas.Invalidate();
        }
    }
}
