using System;
using System.Drawing;
using System.Windows.Forms;

namespace WindowsFormsApp4
{
    public partial class Form1 : Form
    {
        private int shapeSides; // Número de lados de la figura (3 para triángulo, 4 para cuadrado)
        private int rectSize;
        private float angle;
        private bool shouldDraw; // Indica si debe dibujar la figura
        private Point shapePosition; // Posición de la figura

        public Form1()
        {
            InitializeComponent();
            // Inicializa el TrackBar con un valor más alto
            trackBar1.Maximum = 200;
            trackBar1.Value = 100;
            rectSize = trackBar1.Value;
            angle = 0f;
            shapeSides = 0; // Inicialmente no se dibuja ninguna figura
            shouldDraw = false; // No debe dibujar hasta que se presione el botón "Graficar"
            shapePosition = new Point(pictureBox1.Width / 2, pictureBox1.Height / 2); // Posición inicial al centro

            trackBar1.Scroll += trackBar1_Scroll;
            btnderecha.Click += btnderecha_Click;
            btnizquierda.Click += btnizquierda_Click;
            btncuadrado.Click += btncuadrado_Click;
            btnTriangulo.Click += btnTriangulo_Click;
            btngraficar.Click += btngraficar_Click;
            pictureBox1.Paint += pictureBox1_Paint;

            this.KeyDown += Form1_KeyDown; // Maneja el evento KeyDown del formulario
            this.KeyPreview = true; // Permite que el formulario capture eventos de teclado
        }

        private void trackBar1_Scroll(object sender, EventArgs e)
        {
            rectSize = trackBar1.Value;
            if (shouldDraw)
            {
                pictureBox1.Invalidate(); // Fuerza el redibujado del PictureBox
            }
        }

        private void btnderecha_Click(object sender, EventArgs e)
        {
            angle += 10f; // Rota 10 grados a la derecha
            if (shouldDraw)
            {
                pictureBox1.Invalidate(); // Fuerza el redibujado del PictureBox
            }
        }

        private void btnizquierda_Click(object sender, EventArgs e)
        {
            angle -= 10f; // Rota 10 grados a la izquierda
            if (shouldDraw)
            {
                pictureBox1.Invalidate(); // Fuerza el redibujado del PictureBox
            }
        }

        private void btncuadrado_Click(object sender, EventArgs e)
        {
            shapeSides = 4;
            shouldDraw = false; // No dibuja hasta que se presione el botón "Graficar"
        }

        private void btnTriangulo_Click(object sender, EventArgs e)
        {
            shapeSides = 3;
            shouldDraw = false; // No dibuja hasta que se presione el botón "Graficar"
        }

        private void btngraficar_Click(object sender, EventArgs e)
        {
            if (shapeSides != 0)
            {
                shouldDraw = true; // Ahora debe dibujar la figura seleccionada
                pictureBox1.Invalidate(); // Fuerza el redibujado del PictureBox
            }
            else if (int.TryParse(Lados.Text, out int sides) && sides >= 3)
            {
                shapeSides = sides;
                shouldDraw = true; // Ahora debe dibujar la figura seleccionada
                pictureBox1.Invalidate(); // Fuerza el redibujado del PictureBox
            }
            else
            {
                MessageBox.Show("Ingrese un número válido de lados (3 o más).");
            }
        }

        private void Lados_TextChanged(object sender, EventArgs e)
        {
            // Este evento puede quedar vacío si no necesitas hacer nada en él
        }

        private void pictureBox1_Paint(object sender, PaintEventArgs e)
        {
            if (!shouldDraw) return; // No dibuja si shouldDraw es false

            e.Graphics.Clear(pictureBox1.BackColor);

            // Establece el origen a la posición de la figura
            e.Graphics.TranslateTransform(shapePosition.X, shapePosition.Y);

            // Rota alrededor del origen
            e.Graphics.RotateTransform(angle);

            // Dibuja la figura según el número de lados
            if (shapeSides == 4)
            {
                // Dibuja un cuadrado centrado en el origen
                Rectangle rect = new Rectangle(-rectSize / 2, -rectSize / 2, rectSize, rectSize);
                e.Graphics.DrawRectangle(Pens.Black, rect);
            }
            else if (shapeSides == 3)
            {
                // Dibuja un triángulo centrado en el origen
                PointF[] triangle = {
                    new PointF(0, -rectSize / 2),
                    new PointF(-rectSize / 2, rectSize / 2),
                    new PointF(rectSize / 2, rectSize / 2)
                };
                e.Graphics.DrawPolygon(Pens.Black, triangle);
            }
            else
            {
                // Dibuja un polígono con shapeSides lados
                PointF[] polygon = new PointF[shapeSides];
                for (int i = 0; i < shapeSides; i++)
                {
                    float angle = i * 2 * (float)Math.PI / shapeSides;
                    polygon[i] = new PointF(rectSize / 2 * (float)Math.Cos(angle), rectSize / 2 * (float)Math.Sin(angle));
                }
                e.Graphics.DrawPolygon(Pens.Black, polygon);
            }
        }

        private void Form1_KeyDown(object sender, KeyEventArgs e)
        {
            int moveAmount = 10; // Cantidad de movimiento en píxeles

            switch (e.KeyCode)
            {
                case Keys.Up:
                    shapePosition.Y -= moveAmount;
                    break;
                case Keys.Down:
                    shapePosition.Y += moveAmount;
                    break;
                case Keys.Left:
                    shapePosition.X -= moveAmount;
                    break;
                case Keys.Right:
                    shapePosition.X += moveAmount;
                    break;
            }

            pictureBox1.Invalidate(); // Fuerza el redibujado del PictureBox
        }
    }
}
