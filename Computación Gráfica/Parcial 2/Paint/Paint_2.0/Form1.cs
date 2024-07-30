using System;
using System.Drawing;
using System.Windows.Forms;
using System.Collections.Generic;
using System.IO;
using System.Drawing.Printing;
using Microsoft.VisualBasic;


namespace MiniPaint
{
    public partial class Form1 : Form
    {
        private bool drawing; // Indica si el usuario está actualmente dibujando.
        private int startX, startY; // Coordenadas iniciales del mouse al comenzar a dibujar.
        private Bitmap canvasBitmap; // Imagen en la que se dibuja.
        private Graphics graphics; // Objeto para dibujar en el bitmap.
        private Pen currentPen; // Pincel actual utilizado para dibujar.
        private string tool; // Herramienta actual seleccionada (Linea, Rectangulo, Circulo, Borrar, Relleno).
        private PrintDocument printDocument = new PrintDocument(); // Documento de impresión.
        private Bitmap loadedBitmap; // Imagen cargada para imprimir.
        private string textToDraw = ""; // Variable para almacenar el texto que se va a dibujar
        private Font textFont = new Font("Arial", 16); // Fuente por defecto para el texto
        private bool isSelecting; // Indica si se está usando la herramienta de selección.
        private Rectangle selectionRectangle; // Rectángulo de selección.
        private Point selectionStart; // Punto de inicio de la selección.

        public Form1()
        {
            InitializeComponent();
            InitializeCanvas();
            printDocument.PrintPage += new PrintPageEventHandler(printDocument_PrintPage);
        }

        /// <summary>
        /// Inicializa el canvas donde se realizará el dibujo.
        /// </summary>
        private void InitializeCanvas()
        {
            canvasBitmap = new Bitmap(panelCanvas.Width, panelCanvas.Height);
            graphics = Graphics.FromImage(canvasBitmap);
            graphics.Clear(Color.White); // Fondo blanco para el canvas.
            panelCanvas.BackgroundImage = canvasBitmap;
            currentPen = new Pen(Color.Black, 6); // Pincel negro por defecto.
            tool = "Linea"; // Herramienta por defecto.
        }

        /// <summary>
        /// Evento que se activa cuando se presiona el mouse sobre el canvas.
        /// </summary>
        private void panelCanvas_MouseDown(object sender, MouseEventArgs e)
        {
            if (tool == "Seleccionar")
            {
                isSelecting = true;
                selectionStart = e.Location;
                selectionRectangle = new Rectangle(e.X, e.Y, 0, 0);
            }
            else
            {
                drawing = true;
                startX = e.X;
                startY = e.Y;
            }
        }

        /// <summary>
        /// Evento que se activa cuando se mueve el mouse sobre el canvas.
        /// </summary>
        private void panelCanvas_MouseMove(object sender, MouseEventArgs e)
        {
            if (isSelecting)
            {
                int width = e.X - selectionStart.X;
                int height = e.Y - selectionStart.Y;
                selectionRectangle.Width = width;
                selectionRectangle.Height = height;
                panelCanvas.Invalidate(); 
            }
            else if (drawing)
            {
                if (tool == "Linea" || tool == "Borrar")
                {
                    graphics.DrawLine(currentPen, startX, startY, e.X, e.Y);
                    startX = e.X;
                    startY = e.Y;
                    panelCanvas.Invalidate();
                }
            }
        }

        /// <summary>
        /// Evento que se activa cuando se suelta el mouse sobre el canvas.
        /// </summary>
        private void panelCanvas_MouseUp(object sender, MouseEventArgs e)
        {
            if (tool == "Seleccionar")
            {
                isSelecting = false;
                panelCanvas.Invalidate();
            }
            else
            {
                drawing = false;
                if (tool == "Rectangulo")
                {
                    int width = e.X - startX;
                    int height = e.Y - startY;
                    graphics.DrawRectangle(currentPen, startX, startY, width, height);
                }
                else if (tool == "Circulo")
                {
                    int width = e.X - startX;
                    int height = e.Y - startY;
                    graphics.DrawEllipse(currentPen, startX, startY, width, height);
                }
                panelCanvas.Invalidate();
            }
        }

        /// <summary>
        /// Cambia la herramienta actual a "Linea".
        /// </summary>
        private void btnLinea_Click(object sender, EventArgs e)
        {
            tool = "Linea";
            currentPen = new Pen(picColor.BackColor, currentPen.Width); // Actualiza el color del pincel.
        }

        /// <summary>
        /// Cambia la herramienta actual a "Rectangulo".
        /// </summary>
        private void btnRectangulo_Click(object sender, EventArgs e)
        {
            tool = "Rectangulo";
            currentPen = new Pen(picColor.BackColor, currentPen.Width); // Actualiza el color del pincel.
        }

        /// <summary>
        /// Cambia la herramienta actual a "Circulo".
        /// </summary>
        private void btnCirculo_Click(object sender, EventArgs e)
        {
            tool = "Circulo";
            currentPen = new Pen(picColor.BackColor, currentPen.Width); // Actualiza el color del pincel.
        }

        /// <summary>
        /// Cambia la herramienta actual a "Borrar".
        /// </summary>
        private void btnBorrar_Click(object sender, EventArgs e)
        {
            tool = "Borrar";
            currentPen = new Pen(Color.White, 20); // Pincel blanco para borrar.
        }

        /// <summary>
        /// Abre el diálogo para seleccionar un color.
        /// </summary>
        private void btnColor_Click(object sender, EventArgs e)
        {
            if (colorDialog1.ShowDialog() == DialogResult.OK)
            {
                picColor.BackColor = colorDialog1.Color;
                currentPen = new Pen(colorDialog1.Color, currentPen.Width); // Actualiza el color del pincel.
            }
        }

        /// <summary>
        /// Cambia el grosor del pincel según el valor del trackbar.
        /// </summary>
        private void trackBarGrosor_Scroll(object sender, EventArgs e)
        {
            currentPen.Width = trackBarGrosor.Value; // Cambia el grosor del pincel.
        }

        /// <summary>
        /// Cambia la herramienta actual a "Relleno".
        /// </summary>
        private void btnRelleno_Click(object sender, EventArgs e)
        {
            tool = "Relleno";
        }

        /// <summary>
        /// Evento que se activa cuando se hace clic en el canvas.
        /// </summary>
        private void panelCanvas_MouseClick(object sender, MouseEventArgs e)
        {
            if (tool == "Relleno")
            {
                Point point = new Point(e.X, e.Y);
                Color targetColor = canvasBitmap.GetPixel(point.X, point.Y);

                if (IsColorPresentInCanvas(canvasBitmap, targetColor))
                {
                    FloodFill(canvasBitmap, point, targetColor, currentPen.Color);
                }
                else
                {
                    using (Graphics g = Graphics.FromImage(canvasBitmap))
                    {
                        g.Clear(currentPen.Color); 
                    }
                }

                panelCanvas.Invalidate();
            }
            else if (tool == "Texto")
            {
                using (Form inputForm = new Form())
                {
                    Label label = new Label() { Left = 10, Top = 10, Text = "Ingrese el texto:" };
                    TextBox textBox = new TextBox() { Left = 10, Top = 30, Width = 200};
                    Button confirmation = new Button() { Text = "Aceptar", Left = 150, Width = 60, Top = 60, DialogResult = DialogResult.OK };
                    inputForm.Text = "Agregar Texto";
                    inputForm.StartPosition = FormStartPosition.CenterParent;
                    inputForm.Controls.Add(textBox);
                    inputForm.Controls.Add(confirmation);
                    inputForm.Controls.Add(label);
                    inputForm.AcceptButton = confirmation;

                    if (inputForm.ShowDialog() == DialogResult.OK)
                    {
                        textToDraw = textBox.Text;
                        graphics.DrawString(textToDraw, textFont, currentPen.Brush, e.X, e.Y);
                        panelCanvas.Invalidate(); 
                    }
                }
            }
        }

        /// <summary>
        /// Funcion que selecciona y pinturea el rectangulo de seleccion.
        /// </summary>
        private void panelCanvas_Paint(object sender, PaintEventArgs e)
        {
            if (isSelecting)
            {
                using (Pen selectionPen = new Pen(Color.Blue))
                {
                    selectionPen.DashStyle = System.Drawing.Drawing2D.DashStyle.Dash;
                    e.Graphics.DrawRectangle(selectionPen, selectionRectangle);
                }
            }
        }

        /// <summary>
        /// Esta funcion complementa al relleno para validar que lo haga solo cuando hay figuras.
        /// </summary>
        private bool IsColorPresentInCanvas(Bitmap bitmap, Color color)
        {
            for (int y = 0; y < bitmap.Height; y++)
            {
                for (int x = 0; x < bitmap.Width; x++)
                {
                    if (bitmap.GetPixel(x, y) == color)
                    {
                        return true; 
                    }
                }
            }
            return false; 
        }



        /// <summary>
        /// Implementación del algoritmo de flood fill para rellenar áreas.
        /// </summary>
        private void FloodFill(Bitmap bitmap, Point point, Color targetColor, Color replacementColor)
        {
            if (targetColor == replacementColor) return; // Evita llenar con el mismo color.
            if (bitmap.GetPixel(point.X, point.Y) != targetColor) return;

            Stack<Point> pixels = new Stack<Point>();
            pixels.Push(point);

            while (pixels.Count > 0)
            {
                Point temp = pixels.Pop();
                int y1 = temp.Y;

                // Subir hacia arriba en la línea hasta encontrar el borde del área
                while (y1 >= 0 && bitmap.GetPixel(temp.X, y1) == targetColor)
                    y1--;

                y1++;
                bool spanLeft = false;
                bool spanRight = false;

                // Bajar hacia abajo en la línea para llenar el área
                while (y1 < bitmap.Height && bitmap.GetPixel(temp.X, y1) == targetColor)
                {
                    bitmap.SetPixel(temp.X, y1, replacementColor);

                    if (!spanLeft && temp.X > 0 && bitmap.GetPixel(temp.X - 1, y1) == targetColor)
                    {
                        pixels.Push(new Point(temp.X - 1, y1));
                        spanLeft = true;
                    }
                    else if (spanLeft && temp.X > 0 && bitmap.GetPixel(temp.X - 1, y1) != targetColor)
                    {
                        spanLeft = false;
                    }

                    if (!spanRight && temp.X < bitmap.Width - 1 && bitmap.GetPixel(temp.X + 1, y1) == targetColor)
                    {
                        pixels.Push(new Point(temp.X + 1, y1));
                        spanRight = true;
                    }
                    else if (spanRight && temp.X < bitmap.Width - 1 && bitmap.GetPixel(temp.X + 1, y1) != targetColor)
                    {
                        spanRight = false;
                    }

                    y1++;
                }
            }
        }

        /// <summary>
        /// Guarda la imagen actual del canvas en un archivo.
        /// </summary>
        private void btnGuardar_Click(object sender, EventArgs e)
        {
            using (SaveFileDialog saveFileDialog = new SaveFileDialog())
            {
                saveFileDialog.Filter = "PNG Image|*.png|JPEG Image|*.jpg|Bitmap Image|*.bmp";
                saveFileDialog.Title = "Guardar imagen";
                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    canvasBitmap.Save(saveFileDialog.FileName);
                }
            }
        }

        /// <summary>
        /// Evento que se activa cuando se hace clic en el botón Imprimir.
        /// </summary>
        private void btnImprimir_Click(object sender, EventArgs e)
        {
            using (PrintDialog printDialog = new PrintDialog())
            {
                printDialog.Document = printDocument;
                if (printDialog.ShowDialog() == DialogResult.OK)
                {
                    printDocument.Print();
                }
            }
        }

        /// <summary>
        /// Evento que se activa cuando se va a imprimir una página.
        /// </summary>
        private void printDocument_PrintPage(object sender, PrintPageEventArgs e)
        {
            if (loadedBitmap != null)
            {
                // Ajusta la imagen al tamaño de la página manteniendo la relación de aspecto.
                float scale = Math.Min((float)e.MarginBounds.Width / loadedBitmap.Width, (float)e.MarginBounds.Height / loadedBitmap.Height);
                int width = (int)(loadedBitmap.Width * scale);
                int height = (int)(loadedBitmap.Height * scale);
                e.Graphics.DrawImage(loadedBitmap, e.MarginBounds.Left, e.MarginBounds.Top, width, height);
            }
            else
            {
                // Si no hay imagen cargada, imprime el canvas.
                e.Graphics.DrawImage(canvasBitmap, e.MarginBounds);
            }
        }

        /// <summary>
        /// Este boton borra todo el canva y lo vuelve a su estado original
        /// </summary>
        private void btnReset_Click(object sender, EventArgs e)
        {
            InitializeCanvas();
            currentPen = new Pen(Color.Black, 6);
            panelCanvas.Invalidate();
        }

        /// <summary>
        /// Funcion complemento para poder escribir texto
        /// </summary>
        private void btnTexto_Click(object sender, EventArgs e)
        {
            tool = "Texto"; 
        }

        /// <summary>
        /// Funcion que selecciona algo con un area rectangular transparente.
        /// </summary>
        private void btnSeleccionar_Click(object sender, EventArgs e)
        {
            tool = "Seleccionar";
            isSelecting = true;
        }

        /// <summary>
        /// Permite cortar mediante la seleccion de un area seleccionada y copiar al
        /// portapapeles.
        /// </summary>
        private void btnCortar_Click(object sender, EventArgs e)
        {
            if (selectionRectangle.Width > 0 && selectionRectangle.Height > 0)
            {
                Rectangle srcRect = new Rectangle(selectionRectangle.X, selectionRectangle.Y, selectionRectangle.Width, selectionRectangle.Height);
                Bitmap croppedBitmap = canvasBitmap.Clone(srcRect, canvasBitmap.PixelFormat);

                using (Graphics g = Graphics.FromImage(canvasBitmap))
                {
                    using (Pen borderPen = new Pen(Color.LightGray, 2))
                    {
                        //g.DrawRectangle(borderPen, selectionRectangle);
                    }
                   // g.FillRectangle(Brushes.White, selectionRectangle);
                }

                Clipboard.SetImage(croppedBitmap);
                panelCanvas.Invalidate(); 
            }
        }

        /// <summary>
        /// Carga una imagen desde un archivo al canvas.
        /// </summary>
        private void btnCargar_Click(object sender, EventArgs e)
        {
            using (OpenFileDialog openFileDialog = new OpenFileDialog())
            {
                openFileDialog.Filter = "PNG Image|*.png|JPEG Image|*.jpg|Bitmap Image|*.bmp";
                openFileDialog.Title = "Cargar imagen";
                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    loadedBitmap = new Bitmap(openFileDialog.FileName);
                    graphics.DrawImage(loadedBitmap, 0, 0, panelCanvas.Width, panelCanvas.Height);
                    panelCanvas.Invalidate(); // Redibuja el canvas.
                }
            }
        }
    }
}
