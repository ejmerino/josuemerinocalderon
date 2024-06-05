using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DibujarGeometricas
{
    internal class Trapecio
    {
        private float mBaseMayor;
        private float mBaseMenor;
        private float mAltura;
        private float mLadoIzquierdo;
        private float mLadoDerecho;
        private float mPerimetro;
        private float mArea;
        private Graphics mGraph;
        private const float SF = 20; 
        private Pen mPen;

        public Trapecio()
        {
            mBaseMayor = 0.0f;
            mBaseMenor = 0.0f;
            mAltura = 0.0f;
            mPerimetro = 0.0f;
            mArea = 0.0f;
        }

        public bool LeerDatos(TextBox txtBaseMayor, TextBox txtBaseMenor, TextBox txtAltura)
        {
            bool respuesta = true;
            try
            {
                mBaseMayor = float.Parse(txtBaseMayor.Text);
                mBaseMenor = float.Parse(txtBaseMenor.Text);
                mAltura = float.Parse(txtAltura.Text);
                if (mBaseMayor <= 0.0f || mBaseMenor <= 0.0f || mAltura <= 0.0f)
                {
                    throw new Exception();
                }
            }
            catch
            {
                respuesta = false;
                MessageBox.Show("Ingrese datos válidos...!", "ERROR!");
            }

            return respuesta;
        }

        public void PerimetroTrapecio() 
        {
            mLadoIzquierdo = (mBaseMayor - mBaseMenor) / 2;
            mLadoDerecho = mLadoIzquierdo;

            mPerimetro = mBaseMayor + mBaseMenor + 2 * (float)Math.Sqrt(mLadoIzquierdo * mLadoIzquierdo + mAltura * mAltura);
        }
        public void AreaTrapecio()
        {            
            mArea = (mBaseMayor + mBaseMenor) * mAltura / 2;
        }

        public void ImprimirDatos(TextBox txtPerimetro, TextBox txtArea)
        {
            txtPerimetro.Text = mPerimetro.ToString();
            txtArea.Text = mArea.ToString();
        }

        public void DibujarForma(PictureBox picCanvas)
        {
            mGraph = picCanvas.CreateGraphics();
            mPen = new Pen(Color.Green, 3);

            float centerX = picCanvas.Width / 2;
            float centerY = picCanvas.Height / 2;

            float halfBaseMayor = mBaseMayor * SF / 2;
            float halfBaseMenor = mBaseMenor * SF / 2;
            float scaledAltura = mAltura * SF;

            PointF[] points = new PointF[]
            {
            new PointF(centerX - halfBaseMayor, centerY - scaledAltura / 2), 
            new PointF(centerX + halfBaseMayor, centerY - scaledAltura / 2), 
            new PointF(centerX + halfBaseMenor, centerY + scaledAltura / 2), 
            new PointF(centerX - halfBaseMenor, centerY + scaledAltura / 2) 
            };

            mGraph.DrawPolygon(mPen, points);
        }
    }

}
