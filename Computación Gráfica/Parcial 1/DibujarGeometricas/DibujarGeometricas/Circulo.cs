using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DibujarGeometricas
{
    internal class Circulo
    {
        private float mradio;
        private float mPerimeter;
        private float mArea;
        private Graphics mGraph;
        private const float SF = 20;
        private Pen mPen;

        public Circulo()
        {
            mradio = 0.0f;
            mPerimeter = 0.0f;
            mArea = 0.0f;
        }

        public bool ReadData(TextBox txtRadio)
        {
            bool respuesta = true;
            try
            {
                mradio = float.Parse(txtRadio.Text);
                if (mradio <= 0.0f)
                {
                    throw new Exception();
                }
            }
            catch
            {
                respuesta = false;
                MessageBox.Show("Ingrese Datos válidos...!", "ERROR!");
            }

            return respuesta;
        }

        public void PerimeterCircle()
        {
            mPerimeter = (float)(2 *mradio*Math.PI);
        }

        public void AreaCircle()
        {
            mArea = (float)(mradio * Math.PI);
        }

        public void PrintData(TextBox txtPerimeter, TextBox txtArea)
        {
            txtPerimeter.Text = mPerimeter.ToString();
            txtArea.Text = mArea.ToString();
        }
        public void PlotShape(PictureBox picCanvas)
        {
            mGraph = picCanvas.CreateGraphics();
            mPen = new Pen(Color.Blue, 3);
            float centerX = picCanvas.Width / 2;
            float centerY = picCanvas.Height / 2;

            float x = centerX - mradio * SF;
            float y = centerY - mradio * SF;
            float diameter = 2 * mradio * SF;
            mGraph.DrawEllipse(mPen, x, y, diameter, diameter);
        }

    }
}