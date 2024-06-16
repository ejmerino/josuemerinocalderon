using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProyectoParcial1
{
    class Flor_de_la_Margarita
    {
        private float lado;
        private float a, b, c, d;
        private float angulo1, angulo2;
        private float mAD;
        private float mBE;
        private Graphics graph;
        private SolidBrush pintarAzul;
        private const float SF = 20;
        private PointF A, B, C, D, E;
        private PointF F, G, H, I, J;
        private PointF K, L, M, N,  P, Q, R, S, T, U;
        public Flor_de_la_Margarita()
        {
            lado = 0.0f;
        }
        public bool LeerDatos(TextBox txtLado)
        {
            bool respuesta = true;
            try
            {
                lado = float.Parse(txtLado.Text);
                if (lado <= 0.0f)
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

        public void InitializeData(TextBox txtSide, PictureBox picCanvas)
        {
            lado = 0.0f; txtSide.Text = ""; txtSide.Focus(); picCanvas.Refresh();
        }

        private void CalcularVerticePrincipal()
        {
            angulo1 = 36.0f * (float)Math.PI / 180.0f;
            angulo2 = 72.0f * (float)Math.PI / 180.0f;
            a = lado * (float)Math.Cos(angulo1);
            b = lado * (float)Math.Sin(angulo1);
            c = lado * (float)Math.Sin(angulo2);
            d = lado * (float)Math.Cos(angulo2);
            A.X = a;
            A.Y = 0;
            B.X = 0;
            B.Y = b;
            C.X = 2 * a;
            C.Y = b;
            D.X = d;
            D.Y = b + c;
            E.X = d + lado;
            E.Y = b + c;
        }
        private void CalculoPendientes()
        {
            mAD = (b + c) / (d - a); 
            mBE = c / (d + lado);
        }

        public void CalculosAuxiliares(PictureBox picCanvas)
        {
            graph = picCanvas.CreateGraphics(); 
            CalcularVerticePrincipal(); 
            CalculoPendientes(); 
            F.X = (b + a * mAD) / mAD; F.Y = b; 
            H.X = (a * mAD + b) / (mAD - mBE); 
            H.Y = H.X * mBE + b; 
            float FH = (float)Math.Sqrt((float)Math.Pow(H.X - F.X, 2) + (float)Math.Pow(H.Y - F.Y, 2)); 
            float BL = FH; 
            float KF = FH; 
            float BO = BL * (float)Math.Cos(angulo1); 
            float LO = BL * (float)Math.Sin(angulo1); 
            float BF = 2 * BO;
            float ZF = KF * (float)Math.Cos(angulo2); 
            float KZ = KF * (float)Math.Sin(angulo2); 
            L.X = BO;
            L.Y = b - LO; 
            K.X = BF - ZF; 
            K.Y = b - KZ; 
            M.X = BF + FH + ZF; 
            M.Y = b - KZ; 
            N.X = BF + FH + BO; 
            N.Y = b - LO; 
            P.X = ZF; 
            P.Y = b + KZ; 
            R.X = d - ZF;
            R.Y = b + c - KZ; 
            Q.X = ZF + 2 * FH + BF; 
            Q.Y = b + KZ; 
            S.X = d + lado + ZF; 
            S.Y = b + c - KZ; 
            T.X = d + FH; 
            T.Y = b + c; 
            U.X = d + FH + 2 * ZF; 
            U.Y = b + c; 
            G.X = BF + FH;
            G.Y = b; 
            I.X = BF + FH + ZF; 
            I.Y = b + KZ; 
            J.X = d + FH + ZF;
            J.Y = b + c - KZ;
        }

        public void PintarPoligono(PaintEventArgs e)
        {
            graph = e.Graphics;             
            A.X *= SF; 
            A.Y *= SF;
            K.X *= SF; 
            K.Y *= SF;
            M.X *= SF;
            M.Y *= SF;
            F.X *= SF; 
            F.Y *= SF;
            G.X *= SF; 
            G.Y *= SF;
            N.X *= SF; 
            N.Y *= SF;
            C.X *= SF; 
            C.Y *= SF;
            Q.X *= SF; 
            Q.Y *= SF;
            I.X *= SF; 
            I.Y *= SF;
            S.X *= SF; 
            S.Y *= SF;
            E.X *= SF; 
            E.Y *= SF;
            U.X *= SF; 
            U.Y *= SF;
            J.X *= SF; 
            J.Y *= SF;
            T.X *= SF; 
            T.Y *= SF;
            D.X *= SF; 
            D.Y *= SF;
            R.X *= SF; 
            R.Y *= SF;
            H.X *= SF; 
            H.Y *= SF;
            P.X *= SF; 
            P.Y *= SF;
            B.X *= SF; 
            B.Y *= SF;
            L.X *= SF; 
            L.Y *= SF;
            pintarAzul = new SolidBrush(Color.Blue); 
            PointF[] polPoints1 = { A, M, G, F, K, A }; 
            graph.FillPolygon(pintarAzul, polPoints1); 
            PointF[] polPoints2 = { N, C, Q, I, G, N };
            graph.FillPolygon(pintarAzul, polPoints2); 
            PointF[] polPoints3 = { I, S, E, U, J, I };
            graph.FillPolygon(pintarAzul, polPoints3); 
            PointF[] polPoints4 = { H, J, T, D, R, H };
            graph.FillPolygon(pintarAzul, polPoints4); 
            PointF[] polPoints5 = { L, F, H, P, B, L };
            graph.FillPolygon(pintarAzul, polPoints5);
        }        
    }
}
