using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WinAppTriangle
{
    internal class CTriangle
    {
        private float a;
        private float b;
        private float c;
        private float mPerimeter;
        private float mArea;
        private float s;
        private Graphics mGraph;
        private const float SF = 10; // Scale factor for drawing
        private Pen mPen;
        private float angleA;


        public CTriangle()
        {
            a = 0.0f;
            b= 0.0f; 
            c = 0.0f; 
            s = 0.0f;
            mPerimeter = 0.0f;
            mArea = 0.0f;
        }
        public bool ReadData(TextBox txtSideA, TextBox txtSideB, TextBox txtSideC)
        {
            bool respuesta = true;
            try
            {
                a = float.Parse(txtSideA.Text);
                b = float.Parse(txtSideB.Text);
                c = float.Parse(txtSideC.Text);
                if (a <= 0.0f || b <= 0.0f || c <= 0.0f)
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

        public bool CheckTriangle(TextBox txtSideA, TextBox txtSideB, TextBox txtSideC)
        {
            bool respuesta = true;
            try
            {
                a = float.Parse(txtSideA.Text);
                b = float.Parse(txtSideB.Text);
                c = float.Parse(txtSideC.Text);
                if ((a + b <= c) || (b + c <= a) || (a + c <= b) )
                {
                    throw new Exception();
                }
            }
            catch
            {
                respuesta = false;
                MessageBox.Show("El Triángulo no existe...!", "ERROR!");
            }

            return respuesta;
        }

        public void SemiperimeterTriangle() 
        {
            s = (a + b + c) / 2;
        }

        public void PerimeterTriangle()
        {
            SemiperimeterTriangle();
            mPerimeter = s * 2;
        }

        public void AreaTriangle()
        {
            SemiperimeterTriangle();
            mArea = (float)Math.Sqrt(s*(s-a)*(s-b)*(s-c));
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

            PointF A = new PointF(0, 0);
            PointF B = new PointF(a * SF, 0);

            float cosC = (a * a + b * b - c * c) / (2 * a * b);
            float sinC = (float)Math.Sqrt(1 - cosC * cosC);
            PointF C = new PointF(b * cosC * SF, b * sinC * SF);

            // Dibujamos el triángulo
            mGraph.DrawLine(mPen, A, B);
            mGraph.DrawLine(mPen, A, C);
            mGraph.DrawLine(mPen, B, C);
        }
    }
}
