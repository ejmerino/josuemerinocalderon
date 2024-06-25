using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PanalDeAbejas
{
    public partial class frm1 : Form
    {
        Panal_de_abejas panal_De_Abejas = new Panal_de_abejas();
        public frm1()
        {
            InitializeComponent();
            picCanvas.Paint += new PaintEventHandler(this.picCanvas_Paint);
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            panal_De_Abejas.InitializeData(txtLado, picCanvas);  
        }

        private void btnDibujar_Click(object sender, EventArgs e)
        {
            if (panal_De_Abejas.LeerDatos(txtLado))
            {
                picCanvas.Invalidate(); 
            }
        }

        private void picCanvas_Paint(object sender, PaintEventArgs e)
        {
            panal_De_Abejas.DibujarPanal(e.Graphics, picCanvas);
        }
    }
}
