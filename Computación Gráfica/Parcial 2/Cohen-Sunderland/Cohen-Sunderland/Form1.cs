using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Cohen_Sunderland
{
    public partial class Form1 : Form
    {
        private const int INSIDE = 0; // 0000
        private const int LEFT = 1;   // 0001
        private const int RIGHT = 2;  // 0010
        private const int BOTTOM = 4; // 0100
        private const int TOP = 8;    // 1000

        private Rectangle clipRect = new Rectangle(50, 50, 200, 150);
        private Point start, end;
        private bool isDrawing = false;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            picCanvas.MouseDown += new MouseEventHandler(picCanvas_MouseDown);
            picCanvas.MouseUp += new MouseEventHandler(picCanvas_MouseUp);
            picCanvas.Paint += new PaintEventHandler(picCanvas_Paint);
        }

        private void picCanvas_Paint(object sender, PaintEventArgs e)
        {
            Graphics g = e.Graphics;
            g.Clear(picCanvas.BackColor);

            // Dibujar el rectángulo de recorte
            g.DrawRectangle(Pens.Black, clipRect);
        }

        private void picCanvas_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left)
            {
                start = e.Location;
                isDrawing = true;
            }
        }

        private void picCanvas_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Left && isDrawing)
            {
                end = e.Location;
                isDrawing = false;
                DrawAndClipLine();
            }
        }

        private void DrawAndClipLine()
        {
            Graphics g = picCanvas.CreateGraphics();
            g.Clear(picCanvas.BackColor);

            // Dibujar el rectángulo de recorte
            g.DrawRectangle(Pens.Black, clipRect);

            // Dibujar y recortar la línea
            DrawLine(g, start.X, start.Y, end.X, end.Y);
        }

        private int ComputeOutCode(int x, int y, Rectangle rect)
        {
            int code = INSIDE;

            if (x < rect.Left)
                code |= LEFT;
            else if (x > rect.Right)
                code |= RIGHT;
            if (y < rect.Top)
                code |= TOP;
            else if (y > rect.Bottom)
                code |= BOTTOM;

            return code;
        }

        private void DrawLine(Graphics g, int x0, int y0, int x1, int y1)
        {
            int outcode0 = ComputeOutCode(x0, y0, clipRect);
            int outcode1 = ComputeOutCode(x1, y1, clipRect);
            bool accept = false;

            while (true)
            {
                if ((outcode0 | outcode1) == 0)
                {
                    accept = true;
                    break;
                }
                else if ((outcode0 & outcode1) != 0)
                {
                    break;
                }
                else
                {
                    int x = 0, y = 0;
                    int outcodeOut = outcode0 != 0 ? outcode0 : outcode1;

                    if ((outcodeOut & TOP) != 0)
                    {
                        if (y1 != y0)
                        {
                            x = x0 + (x1 - x0) * (clipRect.Top - y0) / (y1 - y0);
                            y = clipRect.Top;
                        }
                    }
                    else if ((outcodeOut & BOTTOM) != 0)
                    {
                        if (y1 != y0)
                        {
                            x = x0 + (x1 - x0) * (clipRect.Bottom - y0) / (y1 - y0);
                            y = clipRect.Bottom;
                        }
                    }
                    else if ((outcodeOut & RIGHT) != 0)
                    {
                        if (x1 != x0)
                        {
                            y = y0 + (y1 - y0) * (clipRect.Right - x0) / (x1 - x0);
                            x = clipRect.Right;
                        }
                    }
                    else if ((outcodeOut & LEFT) != 0)
                    {
                        if (x1 != x0)
                        {
                            y = y0 + (y1 - y0) * (clipRect.Left - x0) / (x1 - x0);
                            x = clipRect.Left;
                        }
                    }

                    if (outcodeOut == outcode0)
                    {
                        x0 = x;
                        y0 = y;
                        outcode0 = ComputeOutCode(x0, y0, clipRect);
                    }
                    else
                    {
                        x1 = x;
                        y1 = y;
                        outcode1 = ComputeOutCode(x1, y1, clipRect);
                    }
                }
            }

            if (accept)
            {
                g.DrawLine(Pens.Red, x0, y0, x1, y1);
            }
        }
    }
}