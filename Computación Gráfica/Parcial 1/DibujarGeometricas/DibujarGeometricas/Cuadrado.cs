using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DibujarGeometricas
{
    internal class Cuadrado
    {
        private float mlado;
        private float mPerimeter;
        private float mArea;
        private Graphics mGraph;
        private const float SF = 20;
        private Pen mPen;

        public Cuadrado()
        {
            mlado = 0.0f;
            mPerimeter = 0.0f;
            mArea = 0.0f;
        }

        public bool ReadData(TextBox txtLado)
        {
            bool respuesta = true;
            try
            {
                mlado = float.Parse(txtLado.Text);
                if (mlado <= 0.0f)
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

        public void PerimeterSquare()
        {
            mPerimeter = 4 * mlado;
        }

        public void AreaSquare()
        {
            mArea = mlado * mlado;
        }
        public void PrintData(TextBox txtPerimeter, TextBox txtArea)
        {
            txtPerimeter.Text = mPerimeter.ToString();
            txtArea.Text = mArea.ToString();
        }
        public void PlotShape(PictureBox picCanvas)
        {
            mGraph = picCanvas.CreateGraphics();
            mPen = new Pen(Color.Red, 3);

            float centerX = picCanvas.Width / 2;
            float centerY = picCanvas.Height / 2;

            float x = centerX - mlado * SF / 2;
            float y = centerY - mlado * SF / 2;

            mGraph.DrawRectangle(mPen, x, y, mlado * SF, mlado * SF);
        }
    }
}
