using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProyectoParcial1
{
    public partial class Form1 : Form
    {
        Flor_de_la_Margarita flor_De_La_Margarita = new Flor_de_la_Margarita();
        public Form1()
        {
            InitializeComponent();
            picCanvas.Paint += new PaintEventHandler(this.picCanvas_Paint);
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            flor_De_La_Margarita.InitializeData(txtLado, picCanvas);
        }
        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            flor_De_La_Margarita.InitializeData(txtLado, picCanvas);
        }

        private void btnCalcular_Click(object sender, EventArgs e)
        {
            flor_De_La_Margarita.LeerDatos(txtLado);
            flor_De_La_Margarita.CalculosAuxiliares(picCanvas);
            picCanvas.Invalidate();
        }

        private void picCanvas_Paint(object sender, PaintEventArgs e)
        {
            flor_De_La_Margarita.PintarPoligono(e);
        }
    }
}
