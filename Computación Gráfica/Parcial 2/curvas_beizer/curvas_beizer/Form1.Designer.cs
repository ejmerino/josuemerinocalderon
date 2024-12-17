namespace curvas_beizer
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            canvas = new PictureBox();
            label1 = new Label();
            groupBoxPUNTOS = new GroupBox();
            textBoxP3Y = new TextBox();
            textBoxP2Y = new TextBox();
            textBoxP1Y = new TextBox();
            label4 = new Label();
            label3 = new Label();
            label2 = new Label();
            textBoxP3X = new TextBox();
            textBoxP2X = new TextBox();
            textBoxP1X = new TextBox();
            groupBoxBotones = new GroupBox();
            btnSalir = new Button();
            btnLimpiar = new Button();
            btncalcular = new Button();
            textBoxP0Y = new TextBox();
            label5 = new Label();
            textBoxP0X = new TextBox();
            ((System.ComponentModel.ISupportInitialize)canvas).BeginInit();
            groupBoxPUNTOS.SuspendLayout();
            groupBoxBotones.SuspendLayout();
            SuspendLayout();
            // 
            // canvas
            // 
            canvas.Location = new Point(273, 84);
            canvas.Name = "canvas";
            canvas.Size = new Size(473, 320);
            canvas.TabIndex = 0;
            canvas.TabStop = false;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Impact", 25.8000011F, FontStyle.Italic, GraphicsUnit.Point, 0);
            label1.Location = new Point(283, 18);
            label1.Name = "label1";
            label1.Size = new Size(282, 54);
            label1.TabIndex = 1;
            label1.Text = "CURVAS BÉIZER";
            // 
            // groupBoxPUNTOS
            // 
            groupBoxPUNTOS.Controls.Add(textBoxP0Y);
            groupBoxPUNTOS.Controls.Add(textBoxP3Y);
            groupBoxPUNTOS.Controls.Add(label5);
            groupBoxPUNTOS.Controls.Add(textBoxP2Y);
            groupBoxPUNTOS.Controls.Add(textBoxP0X);
            groupBoxPUNTOS.Controls.Add(textBoxP1Y);
            groupBoxPUNTOS.Controls.Add(label4);
            groupBoxPUNTOS.Controls.Add(label3);
            groupBoxPUNTOS.Controls.Add(label2);
            groupBoxPUNTOS.Controls.Add(textBoxP3X);
            groupBoxPUNTOS.Controls.Add(textBoxP2X);
            groupBoxPUNTOS.Controls.Add(textBoxP1X);
            groupBoxPUNTOS.Location = new Point(12, 58);
            groupBoxPUNTOS.Name = "groupBoxPUNTOS";
            groupBoxPUNTOS.Size = new Size(250, 179);
            groupBoxPUNTOS.TabIndex = 2;
            groupBoxPUNTOS.TabStop = false;
            groupBoxPUNTOS.Text = "PUNTOS";
            // 
            // textBoxP3Y
            // 
            textBoxP3Y.Location = new Point(147, 122);
            textBoxP3Y.Name = "textBoxP3Y";
            textBoxP3Y.Size = new Size(80, 27);
            textBoxP3Y.TabIndex = 8;
            // 
            // textBoxP2Y
            // 
            textBoxP2Y.Location = new Point(147, 89);
            textBoxP2Y.Name = "textBoxP2Y";
            textBoxP2Y.Size = new Size(80, 27);
            textBoxP2Y.TabIndex = 7;
            // 
            // textBoxP1Y
            // 
            textBoxP1Y.Location = new Point(147, 56);
            textBoxP1Y.Name = "textBoxP1Y";
            textBoxP1Y.Size = new Size(80, 27);
            textBoxP1Y.TabIndex = 6;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(17, 129);
            label4.Name = "label4";
            label4.Size = new Size(28, 20);
            label4.TabIndex = 5;
            label4.Text = "P3:";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(17, 92);
            label3.Name = "label3";
            label3.Size = new Size(28, 20);
            label3.TabIndex = 4;
            label3.Text = "P2:";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(17, 58);
            label2.Name = "label2";
            label2.Size = new Size(28, 20);
            label2.TabIndex = 3;
            label2.Text = "P1:";
            // 
            // textBoxP3X
            // 
            textBoxP3X.Location = new Point(61, 122);
            textBoxP3X.Name = "textBoxP3X";
            textBoxP3X.Size = new Size(80, 27);
            textBoxP3X.TabIndex = 2;
            // 
            // textBoxP2X
            // 
            textBoxP2X.Location = new Point(61, 89);
            textBoxP2X.Name = "textBoxP2X";
            textBoxP2X.Size = new Size(80, 27);
            textBoxP2X.TabIndex = 1;
            // 
            // textBoxP1X
            // 
            textBoxP1X.Location = new Point(61, 56);
            textBoxP1X.Name = "textBoxP1X";
            textBoxP1X.Size = new Size(80, 27);
            textBoxP1X.TabIndex = 0;
            // 
            // groupBoxBotones
            // 
            groupBoxBotones.Controls.Add(btnSalir);
            groupBoxBotones.Controls.Add(btnLimpiar);
            groupBoxBotones.Controls.Add(btncalcular);
            groupBoxBotones.Location = new Point(12, 243);
            groupBoxBotones.Name = "groupBoxBotones";
            groupBoxBotones.Size = new Size(250, 136);
            groupBoxBotones.TabIndex = 3;
            groupBoxBotones.TabStop = false;
            groupBoxBotones.Text = "BOTONES";
            // 
            // btnSalir
            // 
            btnSalir.Location = new Point(63, 78);
            btnSalir.Name = "btnSalir";
            btnSalir.Size = new Size(94, 29);
            btnSalir.TabIndex = 2;
            btnSalir.Text = "Salir";
            btnSalir.UseVisualStyleBackColor = true;
            btnSalir.Click += btnSalir_Click;
            // 
            // btnLimpiar
            // 
            btnLimpiar.Location = new Point(133, 43);
            btnLimpiar.Name = "btnLimpiar";
            btnLimpiar.Size = new Size(94, 29);
            btnLimpiar.TabIndex = 1;
            btnLimpiar.Text = "Limpiar";
            btnLimpiar.UseVisualStyleBackColor = true;
            btnLimpiar.Click += btnLimpiar_Click;
            // 
            // btncalcular
            // 
            btncalcular.Location = new Point(6, 43);
            btncalcular.Name = "btncalcular";
            btncalcular.Size = new Size(94, 29);
            btncalcular.TabIndex = 0;
            btncalcular.Text = "Calcular";
            btncalcular.UseVisualStyleBackColor = true;
            btncalcular.Click += btncalcular_Click;
            // 
            // textBoxP0Y
            // 
            textBoxP0Y.Location = new Point(147, 23);
            textBoxP0Y.Name = "textBoxP0Y";
            textBoxP0Y.Size = new Size(80, 27);
            textBoxP0Y.TabIndex = 9;
            // 
            // label5
            // 
            label5.AutoSize = true;
            label5.Location = new Point(17, 25);
            label5.Name = "label5";
            label5.Size = new Size(28, 20);
            label5.TabIndex = 8;
            label5.Text = "P0:";
            // 
            // textBoxP0X
            // 
            textBoxP0X.Location = new Point(61, 23);
            textBoxP0X.Name = "textBoxP0X";
            textBoxP0X.Size = new Size(80, 27);
            textBoxP0X.TabIndex = 7;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(groupBoxBotones);
            Controls.Add(groupBoxPUNTOS);
            Controls.Add(label1);
            Controls.Add(canvas);
            Name = "Form1";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)canvas).EndInit();
            groupBoxPUNTOS.ResumeLayout(false);
            groupBoxPUNTOS.PerformLayout();
            groupBoxBotones.ResumeLayout(false);
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private PictureBox canvas;
        private Label label1;
        private GroupBox groupBoxPUNTOS;
        private GroupBox groupBoxBotones;
        private Label label4;
        private Label label3;
        private Label label2;
        private TextBox textBoxP3X;
        private TextBox textBoxP2X;
        private TextBox textBoxP1X;
        private Button btnSalir;
        private Button btnLimpiar;
        private Button btncalcular;
        private TextBox textBoxP3Y;
        private TextBox textBoxP2Y;
        private TextBox textBoxP1Y;
        private TextBox textBoxP0Y;
        private Label label5;
        private TextBox textBoxP0X;
    }
}
