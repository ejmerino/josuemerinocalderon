using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DibujarGeometricas
{
    internal class Pentagono
    {
        private float mLado;
        private float mPerimeter;
        private float mArea;
        private Graphics mGraph;
        private const float SF = 20;
        private Pen mPen;

        public Pentagono()
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

        public void AreaPentagono() 
        {
            mArea = (float)(Math.Pow(mLado, 2) * Math.Sqrt(25 + 10 * Math.Sqrt(5))) / 4;
        }

        public void PerimetroPentagono()
        {
            mPerimeter = 5 * mLado;
            
        }

        public void PrintData(TextBox txtPerimeter, TextBox txtArea)
        {
            txtPerimeter.Text = mPerimeter.ToString();
            txtArea.Text = mArea.ToString();
        }

        public void PlotShape(PictureBox picCanvas)
        {
            mGraph = picCanvas.CreateGraphics();
            mPen = new Pen(Color.Green, 3);

            float centerX = picCanvas.Width / 2;
            float centerY = picCanvas.Height / 2;

            float radius = mLado * SF / (2 * (float)Math.Sin(Math.PI / 5));

            PointF[] points = new PointF[5];
            for (int i = 0; i < 5; i++)
            {
                float angle = (float)(i * 2 * Math.PI / 5 - Math.PI / 2); 
                points[i] = new PointF(
                    centerX + radius * (float)Math.Cos(angle),
                    centerY + radius * (float)Math.Sin(angle)
                );
            }

            mGraph.DrawPolygon(mPen, points);
        }
    }
}
