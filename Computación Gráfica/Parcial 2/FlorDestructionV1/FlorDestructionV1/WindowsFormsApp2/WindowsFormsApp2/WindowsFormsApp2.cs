using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class PoligonosEstrellados : Form
    {
        private int rectSize;
        private float angleRotatorio;
        private Point shapePosition; // Posición de la figura
        private Color[] colors;
        private int colorIndex;

        public PoligonosEstrellados()
        {
            InitializeComponent();
            trackBar1.Maximum = 300;
            trackBar1.Value = 100;
            rectSize = trackBar1.Value;
            angleRotatorio = 0f;
            shapePosition = new Point(pictureBox1.Width / 2, pictureBox1.Height / 2);

            // Definir los colores a alternar
            colors = new Color[] { Color.Red, Color.Green, Color.Blue, Color.Orange, Color.Purple, Color.Cyan };
            colorIndex = 0;

            trackBar1.Scroll += trackBar1_Scroll;
            btnderecha.Click += btnderecha_Click;
            btnizquierda.Click += btnizquieda_Click;
            txtSideLength.TextChanged += txtSideLength_TextChanged; // Maneja el evento TextChanged del txtSideLength

            this.KeyDown += Form1_KeyDown; // Maneja el evento KeyDown del formulario
            this.KeyPreview = true; // Permite que el formulario capture eventos de teclado
        }

        private void PoligonosEstrellados_Load(object sender, EventArgs e)
        {
            // Cargar datos o inicializaciones adicionales aquí si es necesario
        }

        private void btnDraw_Click(object sender, EventArgs e)
        {
            trackBar1.Value = 100;
            rectSize = trackBar1.Value;
            angleRotatorio = 0f;
            shapePosition = new Point(pictureBox1.Width / 2, pictureBox1.Height / 2);
            txtSideLength.Text = rectSize.ToString();

            // Redibujar el gráfico
            pictureBox1.Invalidate();
            txtSideLength.Focus();
        }

        private void pictureBox1_Paint(object sender, PaintEventArgs e)
        {
            Graphics g = e.Graphics;
            g.SmoothingMode = SmoothingMode.AntiAlias;

            if (!float.TryParse(txtSideLength.Text, out float sideLength))
            {
                // Manejar el error si el texto no se puede convertir en un flotante
                sideLength = rectSize; // Longitud por defecto si falla la conversión
            }

            DrawNestedPolygons(g, sideLength);
            DrawPentagramStar(g, sideLength * 0.27f, shapePosition.X, shapePosition.Y, angleRotatorio); // Mantener la estrella central sin cambios
            DrawChristmasStar(g, sideLength * 0.27f, shapePosition.X, shapePosition.Y, angleRotatorio); // Dibujar estrella navideña
            DrawChristmasStar2(g, sideLength * 0.27f, shapePosition.X, shapePosition.Y, angleRotatorio); // Dibujar estrella navideña
            DrawNormalStar(g, sideLength * 0.27f, shapePosition.X, shapePosition.Y, angleRotatorio); // Dibujar estrella normal
        }

        private void DrawNestedPolygons(Graphics g, float sideLength)
        {
            int numLayers = 2; // Número de capas
            float scaleFactor = 0.65f; // Factor de escala aumentado para mayor separación
            float rotationOffset = 36; // Ángulo de rotación aumentado para mayor separación
            float initialRotation = angleRotatorio; // Guardar el ángulo inicial para cada capa

            // Dibujar pentágonos y estrellas
            for (int layer = 0; layer < numLayers; layer++)
            {
                float currentScale = (float)Math.Pow(scaleFactor, layer);

                // Dibujar estrella
                g.TranslateTransform(shapePosition.X, shapePosition.Y);
                g.RotateTransform(initialRotation + layer * rotationOffset);
                g.TranslateTransform(-shapePosition.X, -shapePosition.Y);
                DrawStarPolygon(g, sideLength * currentScale, 5, shapePosition.X, shapePosition.Y);
                g.ResetTransform();

                // Dibujar pentágono
                g.TranslateTransform(shapePosition.X, shapePosition.Y);
                g.RotateTransform(initialRotation + (layer + 0.5f) * rotationOffset);
                g.TranslateTransform(-shapePosition.X, -shapePosition.Y);
                DrawPentagon(g, sideLength * currentScale, 5, shapePosition.X, shapePosition.Y);
                g.ResetTransform();
            }

            // Dibujar pentágono adicional del tamaño de la segunda capa
            float secondLayerScale = (float)Math.Pow(scaleFactor, 1);
            DrawRegularPentagon(g, 1.2f * sideLength * secondLayerScale, shapePosition.X, shapePosition.Y, angleRotatorio);
        }

        private void DrawPentagon(Graphics g, float sideLength, int numPoints, float centerX, float centerY)
        {
            PointF[] points = new PointF[numPoints];
            float angleIncrement = (float)(2 * Math.PI / numPoints);
            float radius = sideLength / (2 * (float)Math.Sin(Math.PI / numPoints));

            for (int i = 0; i < numPoints; i++)
            {
                float angle = i * angleIncrement - (float)Math.PI / 2;
                points[i] = new PointF(
                    centerX + radius * (float)Math.Cos(angle),
                    centerY + radius * (float)Math.Sin(angle)
                );
            }

            using (Pen pen = new Pen(GetNextColor(), 2))
            {
                g.DrawPolygon(pen, points);
            }
        }

        private void DrawRegularPentagon(Graphics g, float sideLength, float centerX, float centerY, float angleRotatorio)
        {
            int numPoints = 5;
            PointF[] points = new PointF[numPoints];
            float angleIncrement = (float)(2 * Math.PI / numPoints);
            float radius = sideLength / (2 * (float)Math.Sin(Math.PI / numPoints));

            for (int i = 0; i < numPoints; i++)
            {
                float angle = i * angleIncrement - (float)Math.PI / 2;
                points[i] = new PointF(
                    centerX + radius * (float)Math.Cos(angle),
                    centerY + radius * (float)Math.Sin(angle)
                );
            }

            g.TranslateTransform(centerX, centerY);
            g.RotateTransform(angleRotatorio);
            g.TranslateTransform(-centerX, -centerY);

            using (Pen pen = new Pen(GetNextColor(), 2))
            {
                g.DrawPolygon(pen, points);
            }

            g.ResetTransform();
        }

        private void DrawStarPolygon(Graphics g, float sideLength, int numPoints, float centerX, float centerY)
        {
            int rotationAngle = 160;
            PointF[] points = new PointF[numPoints * 2];
            float angleIncrement = (float)(Math.PI / numPoints);
            float radiusOuter = sideLength / (2 * (float)Math.Sin(Math.PI / numPoints));
            float radiusInner = radiusOuter * (float)Math.Cos(angleIncrement);

            for (int i = 0; i < numPoints * 2; i++)
            {
                float radius = (i % 2 == 0) ? radiusOuter : radiusInner;
                float angle = i * angleIncrement - (float)Math.PI / 2 - rotationAngle;
                points[i] = new PointF(
                    centerX + (radius) * (float)Math.Cos(angle),
                    centerY + (radius) * (float)Math.Sin(angle)
                );
            }

            using (Pen pen = new Pen(GetNextColor(), 2))
            {
                g.DrawPolygon(pen, points);
            }
        }

        private void DrawPentagramStar(Graphics g, float sideLength, float centerX, float centerY, float angleRotatorio)
        {
            int angleRotation = 0;
            int numPoints = 5; // 5 puntos para la estrella
            PointF[] points = new PointF[numPoints * 2];
            float angleIncrement = (float)(4 * Math.PI / numPoints);
            float radius = sideLength;

            for (int i = 0; i < numPoints * 2; i++)
            {
                float angle = i * angleIncrement - (float)Math.PI / 2 - angleRotation;
                points[i] = new PointF(
                    centerX + radius * (float)Math.Cos(angle),
                    centerY + radius * (float)Math.Sin(angle)
                );
            }

            g.TranslateTransform(centerX, centerY);
            g.RotateTransform(angleRotatorio);
            g.TranslateTransform(-centerX, -centerY);

            using (Pen pen = new Pen(GetNextColor(), 2))
            {
                g.DrawPolygon(pen, points);
            }

            g.ResetTransform();
        }

        private void DrawChristmasStar(Graphics g, float sideLength, float centerX, float centerY, float angleRotatorio)
        {
            int numPoints = 5;
            PointF[] points = new PointF[numPoints * 2];
            float outerRadius = 2f * sideLength;
            float innerRadius = outerRadius * 0.5f;
            float angleIncrement = (float)(Math.PI / numPoints);

            for (int i = 0; i < numPoints * 2; i++)
            {
                float radius = (i % 2 == 0) ? outerRadius : innerRadius;
                float angle = i * angleIncrement + (float)Math.PI / 2; // Punta hacia abajo
                points[i] = new PointF(
                    centerX + radius * (float)Math.Cos(angle),
                    centerY + radius * (float)Math.Sin(angle)
                );
            }

            g.TranslateTransform(centerX, centerY);
            g.RotateTransform(angleRotatorio);
            g.TranslateTransform(-centerX, -centerY);

            using (Pen pen = new Pen(GetNextColor(), 2))
            {
                g.DrawPolygon(pen, points);
            }

            g.ResetTransform();
        }

        private void DrawChristmasStar2(Graphics g, float sideLength, float centerX, float centerY, float angleRotatorio)
        {
            int rotationAngle = 235;
            int numPoints = 5;
            PointF[] points = new PointF[numPoints * 2];
            float outerRadius = 2f * sideLength;
            float innerRadius = outerRadius * 0.7f; // Ajustar el tamaño de los puntos internos para una estrella más delgada
            float angleIncrement = (float)(Math.PI / numPoints);

            for (int i = 0; i < numPoints * 2; i++)
            {
                float radius = (i % 2 == 0) ? outerRadius : innerRadius;
                float angle = i * angleIncrement + rotationAngle + (float)Math.PI / 2; 
                points[i] = new PointF(
                    centerX + radius * (float)Math.Cos(angle),
                    centerY + radius * (float)Math.Sin(angle)
                );
            }

            g.TranslateTransform(centerX, centerY);
            g.RotateTransform(angleRotatorio);
            g.TranslateTransform(-centerX, -centerY);

            using (Pen pen = new Pen(GetNextColor(), 2))
            {
                g.DrawPolygon(pen, points);
            }

            g.ResetTransform();
        }

        private void DrawNormalStar(Graphics g, float sideLength, float centerX, float centerY, float angleRotatorio)
        {
            int rotationAngle = 180;
            PointF[] points = new PointF[10];
            double angle = -Math.PI / 2 + rotationAngle * Math.PI / 180; // Convertir el ángulo de rotación a radianes
            double angleIncrement = Math.PI / 5;
            float radius = 2f * sideLength;

            for (int i = 0; i < 10; i++)
            {
                float length = (i % 2 == 0) ? radius : radius / 2f;
                points[i] = new PointF(
                    centerX + (float)(length * Math.Cos(angle)),
                    centerY + (float)(length * Math.Sin(angle))
                );
                angle += angleIncrement;
            }

            g.TranslateTransform(centerX, centerY);
            g.RotateTransform(angleRotatorio);
            g.TranslateTransform(-centerX, -centerY);

            using (Pen pen = new Pen(GetNextColor(), 2))
            {
                g.DrawPolygon(pen, points);
            }

            g.ResetTransform();
        }

        private void trackBar1_Scroll(object sender, EventArgs e)
        {
            rectSize = trackBar1.Value;
            txtSideLength.Text = rectSize.ToString(); // Actualizar el valor en txtSideLength
            pictureBox1.Invalidate(); // Redibujar la figura con el nuevo tamaño
        }

        private void btnizquieda_Click(object sender, EventArgs e)
        {
            angleRotatorio -= 10f; // Rota 10 grados a la izquierda
            pictureBox1.Invalidate(); // Redibujar la figura con la nueva rotación
            txtSideLength.Focus();
        }

        private void btnderecha_Click(object sender, EventArgs e)
        {
            angleRotatorio += 10f; // Rota 10 grados a la derecha
            pictureBox1.Invalidate(); // Redibujar la figura con la nueva rotación
            txtSideLength.Focus();
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

        private void txtSideLength_TextChanged(object sender, EventArgs e)
        {
            if (int.TryParse(txtSideLength.Text, out int newSize) && newSize >= trackBar1.Minimum && newSize <= trackBar1.Maximum)
            {
                rectSize = newSize;
                trackBar1.Value = rectSize; // Actualizar el valor del trackBar
                pictureBox1.Invalidate(); // Redibujar la figura con el nuevo tamaño
            }
        }

        private Color GetNextColor()
        {
            Color nextColor = colors[colorIndex];
            colorIndex = (colorIndex + 1) % colors.Length;
            return nextColor;
        }
    }
}
