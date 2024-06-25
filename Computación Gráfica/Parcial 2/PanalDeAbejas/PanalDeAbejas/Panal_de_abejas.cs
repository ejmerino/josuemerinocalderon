using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PanalDeAbejas
{
    class Panal_de_abejas
    {
        private float lado;
        private Graphics graph;
        private SolidBrush pintarAmarillo;
        private const float escala = 1;

        public Panal_de_abejas(){
            lado = 0.0f;
            pintarAmarillo = new SolidBrush(Color.Yellow);
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

        public void InitializeData(TextBox txtLado, PictureBox picCanvas)
        {
            lado = 0.0f;
            txtLado.Text = "";
            txtLado.Focus();
            picCanvas.Refresh();
        }

        public void DibujarPanal(Graphics graph, PictureBox picCanvas)
        {
            float ladoEscalado = lado * escala;

            float altura = (float)(Math.Sqrt(3) * ladoEscalado);
            float ancho = 2 * ladoEscalado;
            int numColumnas = (int)(picCanvas.Width / (ancho * 0.75)) + 2;
            int numFilas = (int)(picCanvas.Height / altura) + 2;

            for (int fila = 0; fila < numFilas; fila++)
            {
                for (int columna = 0; columna < numColumnas; columna++)
                {
                    float x = columna * ancho * 0.75f;
                    float y = fila * altura;

                    if (columna % 2 == 1)
                    {
                        y += altura / 2;
                    }

                    PointF[] puntosHexagono = CalcularHexagono(x, y, ladoEscalado);
                    graph.FillPolygon(pintarAmarillo, puntosHexagono);
                    graph.DrawPolygon(Pens.Black, puntosHexagono);
                }
            }
        }

        private PointF[] CalcularHexagono(float centerX, float centerY, float ladoEscalado)
        {
            PointF[] points = new PointF[6];
            for (int i = 0; i < 6; i++)
            {
                points[i] = new PointF(
                    centerX + ladoEscalado * (float)Math.Cos(Math.PI / 3 * i),
                    centerY + ladoEscalado * (float)Math.Sin(Math.PI / 3 * i)
                );
            }
            return points;
        }
    }
}
