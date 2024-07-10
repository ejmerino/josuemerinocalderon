using System;
using System.Drawing;
using System.Windows.Forms;

namespace PoligonoEstrelladoV1
{
    class Polygon
    {
        private float side; // Lado del polígono de 16 lados
        private const float startAngle = 22.5f; // Ángulo de inicio para un polígono de 16 lados (360/16/2)
        private Graphics graph; 
        private Pen pen; 
        private const float SF = 5; // Factor de escalamiento

        public Polygon()
        {
            side = 0.0f;
        }

        public bool ReadData(TextBox txtSide)
        {
            bool respuesta = true;
            try
            {
                side = float.Parse(txtSide.Text);
                if (side <= 0.0f)
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
            txtSide.Text = "";
            txtSide.Focus();
            side = 0.0f;
            picCanvas.Refresh();
        }

        private PointF[] CalculateVertices()
        {
            PointF[] vertices = new PointF[16];
            float radius = side / (2 * (float)Math.Sin(Math.PI / 16));

            for (int i = 0; i < 16; i++)
            {
                float angle = (startAngle + i * 22.5f) * (float)Math.PI / 180.0f;
                vertices[i] = new PointF(radius * (float)Math.Cos(angle), radius * (float)Math.Sin(angle));
            }

            return vertices;
        }

        //Funcion que grafica el octogono estrellado 1 de color rojo
        private PointF[] CalculateInnerStar()
        {
            PointF[] innerStar = new PointF[16]; // Octógono estrellado de 8 puntas

            float innerRadius = side / (2 * (float)Math.Sin(Math.PI / 16)); // Radio para que toque los bordes del polígono

            for (int i = 0; i < 8; i++)
            {
                float outerAngle = (startAngle + i * 45.0f) * (float)Math.PI / 180.0f;
                float innerAngle = (startAngle + i * 45.0f + 22.5f) * (float)Math.PI / 180.0f; // Ángulo para los vértices interiores

                innerStar[i * 2] = new PointF(innerRadius * (float)Math.Cos(outerAngle), innerRadius * (float)Math.Sin(outerAngle));
                innerStar[i * 2 + 1] = new PointF(innerRadius * 0.8f * (float)Math.Cos(innerAngle), innerRadius * 0.8f * (float)Math.Sin(innerAngle)); // Vértices internos
            }

            return innerStar;
        }

        //Funcion que grafica el octogono estrellado 2 de color verde
        private PointF[] CalculateInnerStar2()
        {
            PointF[] innerStar2 = new PointF[16]; 

            float innerRadius2 = side / (2 * (float)Math.Sin(Math.PI / 16)); 

            for (int i = 0; i < 8; i++)
            {
                float outerAngle2 = (startAngle + i * 45.0f) * (float)Math.PI / 180.0f;
                float innerAngle2 = (startAngle + i * 45.0f + 22.5f) * (float)Math.PI / 180.0f; 

                innerStar2[i * 2] = new PointF(innerRadius2 * (float)Math.Cos(outerAngle2), innerRadius2 * (float)Math.Sin(outerAngle2));
                innerStar2[i * 2 + 1] = new PointF(innerRadius2 * 0.7f * (float)Math.Cos(innerAngle2), innerRadius2 * 0.7f * (float)Math.Sin(innerAngle2)); // Vértices internos
            }

            return innerStar2;
        }

        //Funcion que grafica el octogono estrellado 3 de color amarillo
        private PointF[] CalculateInnerStar3()
        {
            float rotationAngle = 22.5f;
            PointF[] innerStar3 = new PointF[16]; 

            float innerRadius3 = side / (3 * (float)Math.Sin(Math.PI / 16)); 

            for (int i = 0; i < 8; i++)
            {
                float outerAngle3 = (startAngle + i * 45.0f + rotationAngle) * (float)Math.PI / 180.0f;
                float innerAngle3 = (startAngle + i * 45.0f + 22.5f + rotationAngle) * (float)Math.PI / 180.0f; 

                innerStar3[i * 2] = new PointF(innerRadius3 * (float)Math.Cos(outerAngle3), innerRadius3 * (float)Math.Sin(outerAngle3));
                innerStar3[i * 2 + 1] = new PointF(innerRadius3 * 0.7f * (float)Math.Cos(innerAngle3), innerRadius3 * 0.7f * (float)Math.Sin(innerAngle3)); 
            }

            return innerStar3;
        }

        //Funcion que grafica el octogono estrellado 4 de color celeste
        private PointF[] CalculateInnerStar4()
        {
            float rotationAngle = 22.5f;
            PointF[] innerStar4 = new PointF[16]; 

            float innerRadius4 = side / (3.5f * (float)Math.Sin(Math.PI / 16)); 

            for (int i = 0; i < 8; i++)
            {
                float outerAngle4 = (startAngle + i * 45.0f + rotationAngle) * (float)Math.PI / 180.0f;
                float innerAngle4 = (startAngle + i * 45.0f + 22.5f + rotationAngle) * (float)Math.PI / 180.0f; 

                innerStar4[i * 2] = new PointF(innerRadius4 * (float)Math.Cos(outerAngle4), innerRadius4 * (float)Math.Sin(outerAngle4));
                innerStar4[i * 2 + 1] = new PointF(innerRadius4 * 0.8f * (float)Math.Cos(innerAngle4), innerRadius4 * 0.8f * (float)Math.Sin(innerAngle4)); 
            }

            return innerStar4;
        }

        //Funcion que grafica el octogono estrellado 5 de color naranja
        private PointF[] CalculateInnerStar5()
        {
            PointF[] innerStar5 = new PointF[16]; 

            float innerRadius5 = side / (4.5f * (float)Math.Sin(Math.PI / 16)); 

            for (int i = 0; i < 8; i++)
            {
                float outerAngle5 = (startAngle + i * 45.0f) * (float)Math.PI / 180.0f;
                float innerAngle5 = (startAngle + i * 45.0f + 22.5f) * (float)Math.PI / 180.0f;

                innerStar5[i * 2] = new PointF(innerRadius5 * (float)Math.Cos(outerAngle5), innerRadius5 * (float)Math.Sin(outerAngle5));
                innerStar5[i * 2 + 1] = new PointF(innerRadius5 * 0.6f * (float)Math.Cos(innerAngle5), innerRadius5 * 0.6f * (float)Math.Sin(innerAngle5)); 
            }

            return innerStar5;
        }

        //Funcion que grafica el octogono estrellado 6 de color azul
        private PointF[] CalculateInnerStar6()
        {
            PointF[] innerStar6 = new PointF[16]; 

            float innerRadius6 = side / (5.5f * (float)Math.Sin(Math.PI / 16)); 

            for (int i = 0; i < 8; i++)
            {
                float outerAngle6 = (startAngle + i * 45.0f) * (float)Math.PI / 180.0f;
                float innerAngle6 = (startAngle + i * 45.0f + 22.5f) * (float)Math.PI / 180.0f; 

                innerStar6[i * 2] = new PointF(innerRadius6 * (float)Math.Cos(outerAngle6), innerRadius6 * (float)Math.Sin(outerAngle6));
                innerStar6[i * 2 + 1] = new PointF(innerRadius6 * 0.7f * (float)Math.Cos(innerAngle6), innerRadius6 * 0.7f * (float)Math.Sin(innerAngle6)); // Vértices internos
            }

            return innerStar6;
        }

        //Funcion que grafica las rayas tranversales
        private PointF[] CalculateInnerStar7()
        {
            PointF[] innerStar7 = new PointF[16]; 

            float innerRadius7 = side / (1.4f * (float)Math.Sin(Math.PI / 16)); 

            for (int i = 0; i < 8; i++)
            {
                float outerAngle7 = (startAngle + i * 45.0f) * (float)Math.PI / 180.0f;
                float innerAngle7 = (startAngle + i * 45.0f + 22.5f) * (float)Math.PI / 180.0f; 

                innerStar7[i * 2] = new PointF(innerRadius7 * (float)Math.Cos(outerAngle7), innerRadius7 * (float)Math.Sin(outerAngle7));
                innerStar7[i * 2] = new PointF(innerRadius7 * 0.7f * (float)Math.Cos(innerAngle7), innerRadius7 * 0.7f * (float)Math.Sin(innerAngle7)); 
            }

            return innerStar7;
        }

        private PointF[] CalculateInnerStar8()
        {
            PointF[] innerStar8 = new PointF[16]; 

            float innerRadius8 = side / (1.4f * (float)Math.Sin(Math.PI / 16)); 

            for (int i = 0; i < 8; i++)
            {
                float outerAngle8 = (startAngle + i * 45.0f + 22.5f) * (float)Math.PI / 180.0f;
                float innerAngle8 = (startAngle + i * 45.0f) * (float)Math.PI / 180.0f; 

                innerStar8[i * 2] = new PointF(innerRadius8 * (float)Math.Cos(outerAngle8), innerRadius8 * (float)Math.Sin(outerAngle8));
                innerStar8[i * 2] = new PointF(innerRadius8 * 0.7f * (float)Math.Cos(innerAngle8), innerRadius8 * 0.7f * (float)Math.Sin(innerAngle8)); 
            }

            return innerStar8;
        }

        public void DrawPolygon(PictureBox picCanvas)
        {
            if (side <= 0)
            {
                MessageBox.Show("Por favor, ingrese un valor válido para el lado del polígono.");
                return;
            }

            Bitmap bmp = new Bitmap(picCanvas.Width, picCanvas.Height);
            graph = Graphics.FromImage(bmp);
            pen = new Pen(Color.Blue, 2);
            PointF[] vertices = CalculateVertices();

            float offsetX = picCanvas.Width / 2;
            float offsetY = picCanvas.Height / 2;

            for (int i = 0; i < vertices.Length; i++)
            {
                vertices[i].X = SF * vertices[i].X + offsetX;
                vertices[i].Y = SF * vertices[i].Y + offsetY;
            }

            graph.DrawPolygon(pen, vertices);

            //Dibuja la estrella 1
            PointF[] innerStar = CalculateInnerStar();
            pen.Color = Color.Red;
            for (int i = 0; i < innerStar.Length; i++)
            {
                innerStar[i].X = SF * innerStar[i].X + offsetX;
                innerStar[i].Y = SF * innerStar[i].Y + offsetY;
            }
            graph.DrawPolygon(pen, innerStar);

            //Dibuja la estrella 2
            PointF[] innerStar2 = CalculateInnerStar2();
            pen.Color = Color.Green;
            for (int i = 0; i < innerStar2.Length; i++)
            {
                innerStar2[i].X = SF * innerStar2[i].X + offsetX;
                innerStar2[i].Y = SF * innerStar2[i].Y + offsetY;
            }
            graph.DrawPolygon(pen, innerStar2);

            //Dibuja la estrella 3
            PointF[] innerStar3 = CalculateInnerStar3();
            pen.Color = Color.Yellow;
            for (int i = 0; i < innerStar3.Length; i++)
            {
                innerStar3[i].X = SF * innerStar3[i].X + offsetX;
                innerStar3[i].Y = SF * innerStar3[i].Y + offsetY;
            }
            graph.DrawPolygon(pen, innerStar3);

            //Dibuja la estrella 4
            PointF[] innerStar4 = CalculateInnerStar4();
            pen.Color = Color.Cyan;
            for (int i = 0; i < innerStar4.Length; i++)
            {
                innerStar4[i].X = SF * innerStar4[i].X + offsetX;
                innerStar4[i].Y = SF * innerStar4[i].Y + offsetY;
            }
            graph.DrawPolygon(pen, innerStar4);

            //Dibuja la estrella 5
            PointF[] innerStar5 = CalculateInnerStar5();
            pen.Color = Color.Orange;
            for (int i = 0; i < innerStar5.Length; i++)
            {
                innerStar5[i].X = SF * innerStar5[i].X + offsetX;
                innerStar5[i].Y = SF * innerStar5[i].Y + offsetY;
            }
            graph.DrawPolygon(pen, innerStar5);

            //Dibuja la estrella 6
            PointF[] innerStar6 = CalculateInnerStar6();
            pen.Color = Color.DarkCyan;
            for (int i = 0; i < innerStar6.Length; i++)
            {
                innerStar6[i].X = SF * innerStar6[i].X + offsetX;
                innerStar6[i].Y = SF * innerStar6[i].Y + offsetY;
            }
            graph.DrawPolygon(pen, innerStar6);

            //Dibujar las rayas centrales
            PointF[] innerStar7 = CalculateInnerStar7();
            pen.Color = Color.Black;
            for (int i = 0; i < innerStar7.Length; i++)
            {
                innerStar7[i].X = SF * innerStar7[i].X + offsetX;
                innerStar7[i].Y = SF * innerStar7[i].Y + offsetY;
            }
            graph.DrawPolygon(pen, innerStar7);

            //Dibujar las rayas centrales
            PointF[] innerStar8 = CalculateInnerStar8();
            pen.Color = Color.Black;
            for (int i = 0; i < innerStar8.Length; i++)
            {
                innerStar8[i].X = SF * innerStar8[i].X + offsetX;
                innerStar8[i].Y = SF * innerStar8[i].Y + offsetY;
            }
            graph.DrawPolygon(pen, innerStar8);


            picCanvas.Image = bmp;
        }

        public void CloseForm(Form form)
        {
            form.Close();
        }
    }
}
