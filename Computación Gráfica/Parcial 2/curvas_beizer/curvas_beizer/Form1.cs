namespace curvas_beizer
{
    public partial class Form1 : Form
    {
        private const float SF = 20.0f;
        public Form1()
        {
            InitializeComponent();
        }

        public struct PointF
        {
            public float X, Y;
            public PointF(float x, float y)
            {
                X = x;
                Y = y;
            }
        }

        private PointF Bezier(PointF p0, PointF p1, PointF p2, PointF p3, float t)
        {
            float u = 1 - t;
            float tt = t * t;
            float uu = u * u;
            float uuu = uu * u;
            float ttt = tt * t;

            float x = uuu * p0.X + 3 * uu * t * p1.X + 3 * u * tt * p2.X + ttt * p3.X;
            float y = uuu * p0.Y + 3 * uu * t * p1.Y + 3 * u * tt * p2.Y + ttt * p3.Y;

            return new PointF(x * SF, y * SF);
        }

        private void DrawBezierCurve(PointF p0, PointF p1, PointF p2, PointF p3)
        {
            Bitmap bmp = new Bitmap(canvas.Width, canvas.Height);

            using (Graphics g = Graphics.FromImage(bmp))
            {
                g.Clear(Color.White);

                using (Pen pen = new Pen(Color.Black, 2))
                {
                    for (float t = 0; t <= 1; t += 0.01f)
                    {
                        PointF p = Bezier(p0, p1, p2, p3, t);
                        if (p.X >= 0 && p.X < bmp.Width && p.Y >= 0 && p.Y < bmp.Height)
                        {
                            bmp.SetPixel((int)p.X, (int)p.Y, Color.Black);
                        }
                    }
                }
            }

            canvas.Image = bmp;
        }

        private void btncalcular_Click(object sender, EventArgs e)
        {
            try
            {
                PointF p0 = new PointF(float.Parse(textBoxP0X.Text), float.Parse(textBoxP0Y.Text));
                PointF p1 = new PointF(float.Parse(textBoxP1X.Text), float.Parse(textBoxP1Y.Text));
                PointF p2 = new PointF(float.Parse(textBoxP2X.Text), float.Parse(textBoxP2Y.Text));
                PointF p3 = new PointF(float.Parse(textBoxP3X.Text), float.Parse(textBoxP3Y.Text));

                DrawBezierCurve(p0, p1, p2, p3); // Aseg�rate de que esta l�nea est� activa
            }
            catch (FormatException)
            {
                MessageBox.Show("Por favor, ingrese valores v�lidos para los puntos de control.", "Error de formato", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            textBoxP0X.Clear();
            textBoxP0Y.Clear();
            textBoxP1X.Clear();
            textBoxP1Y.Clear();
            textBoxP2X.Clear();
            textBoxP2Y.Clear();
            textBoxP3X.Clear();
            textBoxP3Y.Clear();
            canvas.Image = null;
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void label1_Click(object sender, EventArgs e)
        {
            // Aqu� puedes agregar el c�digo correspondiente si es necesario.
        }
    }
}
