using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DibujarGeometricas
{
    internal class Triangulo
    {
        private float mBase;
        private float mAltura;
        private float mPerimeter;
        private float mArea;
        private float mHipotenusa;
        private Graphics mGraph;
        private const float SF = 20;
        private Pen mPen;

        public Triangulo()
        {
            mBase = 0.0f;
            mAltura = 0.0f;
            mPerimeter = 0.0f;
            mHipotenusa = 0.0f;
            mArea = 0.0f;
        }

        public bool ReadData(TextBox txtAltura, TextBox txtBase)
        {
            bool respuesta = true;
            try
            {
                mBase = float.Parse(txtBase.Text);
                mAltura = float.Parse(txtAltura.Text);
                if (mBase <= 0.0f || mAltura <= 0.0f)
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

        public void PerimeterRectangle()
        {
            mHipotenusa = (float)Math.Sqrt(Math.Pow(mBase, 2) + Math.Pow(mAltura, 2));
            mPerimeter = mBase + mAltura + mHipotenusa;
        }

        public void AreaRectangle()
        {
            mArea = (mBase * mAltura)/2;
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

            float scaledBase = mBase * SF;
            float scaledHeight = mAltura * SF;

            float centerX = picCanvas.Width / 2;
            float centerY = picCanvas.Height / 2;

            float startX = centerX - (scaledBase / 2);
            float startY = centerY + (scaledHeight / 2);

            PointF[] points = new PointF[]
            {
            new PointF(startX, startY), 
            new PointF(startX + scaledBase, startY), 
            new PointF(startX, startY - scaledHeight) 
            };

            mGraph.DrawPolygon(mPen, points);
        }
    }
}

