namespace ProyectoParcial1
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.grbEntrada = new System.Windows.Forms.GroupBox();
            this.grbBottoms = new System.Windows.Forms.GroupBox();
            this.grbCanvas = new System.Windows.Forms.GroupBox();
            this.picCanvas = new System.Windows.Forms.PictureBox();
            this.btnCalcular = new System.Windows.Forms.Button();
            this.btnReset = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.lblLado = new System.Windows.Forms.Label();
            this.txtLado = new System.Windows.Forms.TextBox();
            this.grbEntrada.SuspendLayout();
            this.grbBottoms.SuspendLayout();
            this.grbCanvas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picCanvas)).BeginInit();
            this.SuspendLayout();
            // 
            // grbEntrada
            // 
            this.grbEntrada.Controls.Add(this.txtLado);
            this.grbEntrada.Controls.Add(this.lblLado);
            this.grbEntrada.Location = new System.Drawing.Point(491, 21);
            this.grbEntrada.Name = "grbEntrada";
            this.grbEntrada.Size = new System.Drawing.Size(287, 147);
            this.grbEntrada.TabIndex = 0;
            this.grbEntrada.TabStop = false;
            this.grbEntrada.Text = "Entrada";
            // 
            // grbBottoms
            // 
            this.grbBottoms.Controls.Add(this.btnExit);
            this.grbBottoms.Controls.Add(this.btnReset);
            this.grbBottoms.Controls.Add(this.btnCalcular);
            this.grbBottoms.Location = new System.Drawing.Point(491, 190);
            this.grbBottoms.Name = "grbBottoms";
            this.grbBottoms.Size = new System.Drawing.Size(287, 238);
            this.grbBottoms.TabIndex = 1;
            this.grbBottoms.TabStop = false;
            this.grbBottoms.Text = "Botones";
            // 
            // grbCanvas
            // 
            this.grbCanvas.Controls.Add(this.picCanvas);
            this.grbCanvas.Location = new System.Drawing.Point(12, 21);
            this.grbCanvas.Name = "grbCanvas";
            this.grbCanvas.Size = new System.Drawing.Size(458, 407);
            this.grbCanvas.TabIndex = 2;
            this.grbCanvas.TabStop = false;
            this.grbCanvas.Text = "Flor de la Margarita";
            // 
            // picCanvas
            // 
            this.picCanvas.Location = new System.Drawing.Point(13, 21);
            this.picCanvas.Name = "picCanvas";
            this.picCanvas.Size = new System.Drawing.Size(426, 380);
            this.picCanvas.TabIndex = 0;
            this.picCanvas.TabStop = false;
            // 
            // btnCalcular
            // 
            this.btnCalcular.BackColor = System.Drawing.Color.Lime;
            this.btnCalcular.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCalcular.Location = new System.Drawing.Point(75, 37);
            this.btnCalcular.Name = "btnCalcular";
            this.btnCalcular.Size = new System.Drawing.Size(137, 40);
            this.btnCalcular.TabIndex = 0;
            this.btnCalcular.Text = "Calcular";
            this.btnCalcular.UseVisualStyleBackColor = false;
            this.btnCalcular.Click += new System.EventHandler(this.btnCalcular_Click);
            // 
            // btnReset
            // 
            this.btnReset.BackColor = System.Drawing.Color.Yellow;
            this.btnReset.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReset.Location = new System.Drawing.Point(75, 106);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(137, 43);
            this.btnReset.TabIndex = 1;
            this.btnReset.Text = "Limpiar";
            this.btnReset.UseVisualStyleBackColor = false;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // btnExit
            // 
            this.btnExit.BackColor = System.Drawing.Color.Red;
            this.btnExit.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnExit.Location = new System.Drawing.Point(75, 172);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(137, 41);
            this.btnExit.TabIndex = 2;
            this.btnExit.Text = "Salir";
            this.btnExit.UseVisualStyleBackColor = false;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // lblLado
            // 
            this.lblLado.AutoSize = true;
            this.lblLado.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLado.Location = new System.Drawing.Point(69, 39);
            this.lblLado.Name = "lblLado";
            this.lblLado.Size = new System.Drawing.Size(168, 25);
            this.lblLado.TabIndex = 0;
            this.lblLado.Text = "Ingrese el Lado:";
            // 
            // txtLado
            // 
            this.txtLado.Location = new System.Drawing.Point(74, 103);
            this.txtLado.Name = "txtLado";
            this.txtLado.Size = new System.Drawing.Size(146, 22);
            this.txtLado.TabIndex = 1;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.grbCanvas);
            this.Controls.Add(this.grbBottoms);
            this.Controls.Add(this.grbEntrada);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Proyecto Parcial 1 - Armas, Escobar, Merino";
            this.grbEntrada.ResumeLayout(false);
            this.grbEntrada.PerformLayout();
            this.grbBottoms.ResumeLayout(false);
            this.grbCanvas.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picCanvas)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grbEntrada;
        private System.Windows.Forms.Label lblLado;
        private System.Windows.Forms.GroupBox grbBottoms;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnCalcular;
        private System.Windows.Forms.GroupBox grbCanvas;
        private System.Windows.Forms.PictureBox picCanvas;
        private System.Windows.Forms.TextBox txtLado;
    }
}

