using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DibujarGeometricas
{
    internal class Rombo
    {
        private float mDiagonalMayor;
        private float mDiagonalMenor;
        private float mPerimeter;
        private float mArea;
        private Graphics mGraph;
        private const float SF = 20;
        private Pen mPen;

        public Rombo()
        {
            mDiagonalMayor = 0.0f;
            mDiagonalMenor = 0.0f;
            mPerimeter = 0.0f;
            mArea = 0.0f;
        }

        public bool ReadData(TextBox txtDiagonalMayor, TextBox txtDiagonalMenor)
        {
            bool respuesta = true;
            try
            {
                mDiagonalMayor = float.Parse(txtDiagonalMayor.Text);
                mDiagonalMenor = float.Parse(txtDiagonalMenor.Text);
                if (mDiagonalMayor <= 0.0f || mDiagonalMenor <= 0.0f)
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

        public void AreaRombo() 
        {
           mArea = (mDiagonalMayor * mDiagonalMenor) / 2;
        }
        public void PerimetroRombo()
        {
            float lado = (float)Math.Sqrt(Math.Pow(mDiagonalMayor / 2, 2) + Math.Pow(mDiagonalMenor / 2, 2));
            mPerimeter = 4 * lado;
        }
        public void PrintData(TextBox txtPerimeter, TextBox txtArea)
        {
            txtPerimeter.Text = mPerimeter.ToString();
            txtArea.Text = mArea.ToString();
        }

        public void PlotShape(PictureBox picCanvas)
        {
            mGraph = picCanvas.CreateGraphics();
            mPen = new Pen(Color.Purple, 3);

            float centerX = picCanvas.Width / 2;
            float centerY = picCanvas.Height / 2;

            
            float halfDiagMayor = (mDiagonalMayor * SF) / 2;
            float halfDiagMenor = (mDiagonalMenor * SF) / 2;

            
            PointF[] points = new PointF[]
            {
            new PointF(centerX, centerY - halfDiagMayor), 
            new PointF(centerX + halfDiagMenor, centerY), 
            new PointF(centerX, centerY + halfDiagMayor), 
            new PointF(centerX - halfDiagMenor, centerY)  
            };

            mGraph.DrawPolygon(mPen, points);
        }
    }
}
