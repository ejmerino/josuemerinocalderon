using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DibujarGeometricas
{
    internal class Hexagono
    {
        private float mLado;
        private float mPerimeter;
        private float mArea;
        private Graphics mGraph;
        private const float SF = 20;
        private Pen mPen;

        public Hexagono()
        {
            mLado = 0.0f;
            mPerimeter = 0.0f;
            mArea = 0.0f;
        }

        public bool ReadData(TextBox txtLado)
        {
            bool respuesta = true;
            try
            {
                mLado = float.Parse(txtLado.Text);
                if (mLado <= 0.0f)
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

        public void AreaHexagono() 
        {
            mArea = (float)(3 * Math.Sqrt(3) * Math.Pow(mLado, 2) / 2);
        }

        public void PerimetroHexagono()
        {
            mPerimeter = 6 * mLado;
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

            float radius = mLado * SF;

            PointF[] points = new PointF[6];
            for (int i = 0; i < 6; i++)
            {
                float angle = (float)(i * 2 * Math.PI / 6 - Math.PI / 2);
                points[i] = new PointF(
                    centerX + radius * (float)Math.Cos(angle),
                    centerY + radius * (float)Math.Sin(angle)
                );
            }

            mGraph.DrawPolygon(mPen, points);
        }
    }

}
