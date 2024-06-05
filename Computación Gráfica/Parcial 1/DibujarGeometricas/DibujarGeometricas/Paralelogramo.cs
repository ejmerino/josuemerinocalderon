using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DibujarGeometricas
{
    internal class Paralelogramo
    {
        private float mBase;
        private float mAltura;
        private float mAngulo; // Angle in degrees
        private float mPerimeter;
        private float mArea;
        private Graphics mGraph;
        private const float SF = 20; // Scale factor for drawing
        private Pen mPen;

        public Paralelogramo()
        {
            mBase = 0.0f;
            mAltura = 0.0f;
            mAngulo = 0.0f;
            mPerimeter = 0.0f;
            mArea = 0.0f;
        }

        public bool ReadData(TextBox txtBase, TextBox txtAltura, TextBox txtAngulo)
        {
            bool respuesta = true;
            try
            {
                mBase = float.Parse(txtBase.Text);
                mAltura = float.Parse(txtAltura.Text);
                mAngulo = float.Parse(txtAngulo.Text);
                if (mBase <= 0.0f || mAltura <= 0.0f || mAngulo <= 0.0f || mAngulo >= 180.0f)
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

        public void AreaParalelogramo() 
        {
            mArea = mBase * mAltura * (float)Math.Sin(mAngulo * Math.PI / 180);
        }
        public void PerimetroParalelogramo()
        {
            mPerimeter = 2 * (mBase + mAltura);
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

            // Clear the previous drawings
            mGraph.Clear(Color.White);

            // Calculate the center of the PictureBox
            float centerX = picCanvas.Width / 2;
            float centerY = picCanvas.Height / 2;

            // Calculate the half-length of the sides
            float halfBase = mBase * SF / 2;
            float halfHeight = mAltura * SF / 2;

            // Calculate the offset using the angle
            float offset = halfHeight * (float)Math.Tan(mAngulo * Math.PI / 180);

            // Ensure the offset is within valid drawing limits
            offset = Math.Min(Math.Max(offset, -halfBase), halfBase);

            // Calculate the points of the parallelogram
            PointF[] points = new PointF[]
            {
            new PointF(centerX - halfBase, centerY - halfHeight), // Top-left point
            new PointF(centerX + halfBase, centerY - halfHeight), // Top-right point
            new PointF(centerX + halfBase - offset, centerY + halfHeight), // Bottom-right point
            new PointF(centerX - halfBase - offset, centerY + halfHeight) // Bottom-left point
            };

            // Draw the parallelogram
            mGraph.DrawPolygon(mPen, points);
        }
    }


}
