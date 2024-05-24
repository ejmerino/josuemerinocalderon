using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AreaYPerimetro
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnCuadrado_Click(object sender, EventArgs e)
        {
            Cuadrado cuadrado = new Cuadrado();
            cuadrado.Show();
            Form1 frm = new Form1();
            this.Hide();
        }

        private void opSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnRectangulo_Click(object sender, EventArgs e)
        {
            Rectangulo rectangulo = new Rectangulo();
            rectangulo.Show();
            Form1 frm = new Form1();
            this.Hide();
        }

        private void btnTriangulo_Click(object sender, EventArgs e)
        {
            Triangulo triangulo = new Triangulo();
            triangulo.Show();
            Form1 frm = new Form1();
            this.Hide();
        }

        private void btnRombo_Click(object sender, EventArgs e)
        {
            Rombo rombo = new Rombo();
            rombo.Show();
            Form1 frm = new Form1();
            this.Hide();
        }

        private void btnPentagono_Click(object sender, EventArgs e)
        {
            Pentagono pentagono = new Pentagono();
            pentagono.Show();
            Form1 frm = new Form1();
            this.Hide();
        }

        private void btnHexagono_Click(object sender, EventArgs e)
        {
            Hexagono hexagono = new Hexagono();
            hexagono.Show();
            Form1 frm = new Form1();
            this.Hide();
        }

        private void btnCirculo_Click(object sender, EventArgs e)
        {
            Circulo circulo = new Circulo();
            circulo.Show();
            Form1 frm = new Form1();
            this.Hide();
        }

        private void btnTrapecio_Click(object sender, EventArgs e)
        {
            Trapecio trapecio = new Trapecio();
            trapecio.Show();
            Form1 frm = new Form1();
            this.Hide();
        }

        private void btnParalelogramo_Click(object sender, EventArgs e)
        {
            Paralelogramo paralelogramo = new Paralelogramo();
            paralelogramo.Show();
            Form1 frm = new Form1();
            this.Hide();
        }
    }
}
