using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Clase28Mayo
{
    public partial class Frminicio : Form
    {

        private int lineCount = 0;
        private Timer timer;

        public Frminicio()
        {
            InitializeComponent();
            InitializeTimer();
        }

        private void InitializeTimer()
        {
            timer = new Timer();
            timer.Interval = 300;
            timer.Tick += Timer_Tick;
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            lineCount++;
            this.Invalidate(); 
            if (lineCount >= 4)
            {
                timer.Stop();
            }
        }

        private void Frminicio_Paint(object sender, PaintEventArgs e)
        {
            Graphics g = e.Graphics;

            if (lineCount >= 1)
            {
                g.DrawLine(Pens.Black, 0, 80, 750, 450);
            }
            if (lineCount >= 2)
            {
                g.DrawLine(Pens.Red, 0, 450, 750, 80);
            }
            if (lineCount >= 3)
            {
                g.DrawLine(Pens.Green, 375, 80, 375, 450);
            }
            if (lineCount >= 4)
            {
                g.DrawLine(Pens.Blue, 0, 265, 750, 265);
            }
        }

        private void btnGenerar_Click(object sender, EventArgs e)
        {
            lineCount = 0;
            timer.Start();
        }
    }
}
