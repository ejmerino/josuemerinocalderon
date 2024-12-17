namespace WindowsFormsApp2
{
    partial class PoligonosEstrellados
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.txtSideLength = new System.Windows.Forms.TextBox();
            this.btnDraw = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.grbInput = new System.Windows.Forms.GroupBox();
            this.grbScaleFactor = new System.Windows.Forms.GroupBox();
            this.trackBar1 = new System.Windows.Forms.TrackBar();
            this.btnizquierda = new System.Windows.Forms.Button();
            this.btnderecha = new System.Windows.Forms.Button();
            this.grbRotation = new System.Windows.Forms.GroupBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.grbInput.SuspendLayout();
            this.grbScaleFactor.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.trackBar1)).BeginInit();
            this.grbRotation.SuspendLayout();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.White;
            this.pictureBox1.Location = new System.Drawing.Point(12, 12);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(776, 426);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.Paint += new System.Windows.Forms.PaintEventHandler(this.pictureBox1_Paint);
            // 
            // txtSideLength
            // 
            this.txtSideLength.Location = new System.Drawing.Point(94, 34);
            this.txtSideLength.Name = "txtSideLength";
            this.txtSideLength.Size = new System.Drawing.Size(100, 20);
            this.txtSideLength.TabIndex = 1;
            // 
            // btnDraw
            // 
            this.btnDraw.Location = new System.Drawing.Point(701, 476);
            this.btnDraw.Name = "btnDraw";
            this.btnDraw.Size = new System.Drawing.Size(75, 23);
            this.btnDraw.TabIndex = 2;
            this.btnDraw.Text = "Reset";
            this.btnDraw.UseVisualStyleBackColor = true;
            this.btnDraw.Click += new System.EventHandler(this.btnDraw_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 37);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(76, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Tamaño Lado:";
            // 
            // grbInput
            // 
            this.grbInput.Controls.Add(this.label1);
            this.grbInput.Controls.Add(this.txtSideLength);
            this.grbInput.Location = new System.Drawing.Point(16, 445);
            this.grbInput.Name = "grbInput";
            this.grbInput.Size = new System.Drawing.Size(200, 73);
            this.grbInput.TabIndex = 5;
            this.grbInput.TabStop = false;
            this.grbInput.Text = "Ingreso";
            // 
            // grbScaleFactor
            // 
            this.grbScaleFactor.Controls.Add(this.trackBar1);
            this.grbScaleFactor.Location = new System.Drawing.Point(244, 445);
            this.grbScaleFactor.Name = "grbScaleFactor";
            this.grbScaleFactor.Size = new System.Drawing.Size(209, 73);
            this.grbScaleFactor.TabIndex = 6;
            this.grbScaleFactor.TabStop = false;
            this.grbScaleFactor.Text = "Eje de escalamiento";
            // 
            // trackBar1
            // 
            this.trackBar1.Location = new System.Drawing.Point(6, 20);
            this.trackBar1.Name = "trackBar1";
            this.trackBar1.Size = new System.Drawing.Size(197, 45);
            this.trackBar1.TabIndex = 0;
            this.trackBar1.Scroll += new System.EventHandler(this.trackBar1_Scroll);
            // 
            // btnizquierda
            // 
            this.btnizquierda.Location = new System.Drawing.Point(21, 32);
            this.btnizquierda.Name = "btnizquierda";
            this.btnizquierda.Size = new System.Drawing.Size(75, 23);
            this.btnizquierda.TabIndex = 0;
            this.btnizquierda.Text = "Izquierda";
            this.btnizquierda.UseVisualStyleBackColor = true;
            this.btnizquierda.Click += new System.EventHandler(this.btnizquieda_Click);
            // 
            // btnderecha
            // 
            this.btnderecha.Location = new System.Drawing.Point(116, 32);
            this.btnderecha.Name = "btnderecha";
            this.btnderecha.Size = new System.Drawing.Size(75, 23);
            this.btnderecha.TabIndex = 8;
            this.btnderecha.Text = "Derecha";
            this.btnderecha.UseVisualStyleBackColor = true;
            this.btnderecha.Click += new System.EventHandler(this.btnderecha_Click);
            // 
            // grbRotation
            // 
            this.grbRotation.Controls.Add(this.btnderecha);
            this.grbRotation.Controls.Add(this.btnizquierda);
            this.grbRotation.Location = new System.Drawing.Point(469, 445);
            this.grbRotation.Name = "grbRotation";
            this.grbRotation.Size = new System.Drawing.Size(209, 73);
            this.grbRotation.TabIndex = 7;
            this.grbRotation.TabStop = false;
            this.grbRotation.Text = "Rotación";
            // 
            // PoligonosEstrellados
            // 
            this.ClientSize = new System.Drawing.Size(800, 530);
            this.Controls.Add(this.grbRotation);
            this.Controls.Add(this.btnDraw);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.grbInput);
            this.Controls.Add(this.grbScaleFactor);
            this.Name = "PoligonosEstrellados";
            this.Text = "Praqniques Propuestas";
            this.Load += new System.EventHandler(this.PoligonosEstrellados_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.grbInput.ResumeLayout(false);
            this.grbInput.PerformLayout();
            this.grbScaleFactor.ResumeLayout(false);
            this.grbScaleFactor.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.trackBar1)).EndInit();
            this.grbRotation.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.TextBox txtSideLength;
        private System.Windows.Forms.Button btnDraw;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox grbInput;
        private System.Windows.Forms.GroupBox grbScaleFactor;
        private System.Windows.Forms.TrackBar trackBar1;
        private System.Windows.Forms.Button btnizquierda;
        private System.Windows.Forms.Button btnderecha;
        private System.Windows.Forms.GroupBox grbRotation;
    }
}















