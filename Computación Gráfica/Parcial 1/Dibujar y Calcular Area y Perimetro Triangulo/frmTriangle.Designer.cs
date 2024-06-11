namespace WinAppTriangle
{
    partial class frmTriangle
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
            this.grbCanvas = new System.Windows.Forms.GroupBox();
            this.picCanvas = new System.Windows.Forms.PictureBox();
            this.grbOutputs = new System.Windows.Forms.GroupBox();
            this.txtArea = new System.Windows.Forms.TextBox();
            this.txtPerimeter = new System.Windows.Forms.TextBox();
            this.lblArea = new System.Windows.Forms.Label();
            this.lblPerimeter = new System.Windows.Forms.Label();
            this.grbProcess = new System.Windows.Forms.GroupBox();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnReset = new System.Windows.Forms.Button();
            this.btnCalculate = new System.Windows.Forms.Button();
            this.grbInputs = new System.Windows.Forms.GroupBox();
            this.txtSideC = new System.Windows.Forms.TextBox();
            this.lblSideC = new System.Windows.Forms.Label();
            this.txtSideB = new System.Windows.Forms.TextBox();
            this.txtSideA = new System.Windows.Forms.TextBox();
            this.lblSideB = new System.Windows.Forms.Label();
            this.lblSideA = new System.Windows.Forms.Label();
            this.grbCanvas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picCanvas)).BeginInit();
            this.grbOutputs.SuspendLayout();
            this.grbProcess.SuspendLayout();
            this.grbInputs.SuspendLayout();
            this.SuspendLayout();
            // 
            // grbCanvas
            // 
            this.grbCanvas.Controls.Add(this.picCanvas);
            this.grbCanvas.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grbCanvas.Location = new System.Drawing.Point(370, 30);
            this.grbCanvas.Name = "grbCanvas";
            this.grbCanvas.Size = new System.Drawing.Size(409, 391);
            this.grbCanvas.TabIndex = 17;
            this.grbCanvas.TabStop = false;
            this.grbCanvas.Text = "Gráfico";
            // 
            // picCanvas
            // 
            this.picCanvas.Location = new System.Drawing.Point(6, 18);
            this.picCanvas.Name = "picCanvas";
            this.picCanvas.Size = new System.Drawing.Size(402, 376);
            this.picCanvas.TabIndex = 0;
            this.picCanvas.TabStop = false;
            // 
            // grbOutputs
            // 
            this.grbOutputs.Controls.Add(this.txtArea);
            this.grbOutputs.Controls.Add(this.txtPerimeter);
            this.grbOutputs.Controls.Add(this.lblArea);
            this.grbOutputs.Controls.Add(this.lblPerimeter);
            this.grbOutputs.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grbOutputs.Location = new System.Drawing.Point(21, 305);
            this.grbOutputs.Name = "grbOutputs";
            this.grbOutputs.Size = new System.Drawing.Size(300, 116);
            this.grbOutputs.TabIndex = 18;
            this.grbOutputs.TabStop = false;
            this.grbOutputs.Text = "Salidas";
            // 
            // txtArea
            // 
            this.txtArea.Enabled = false;
            this.txtArea.Location = new System.Drawing.Point(101, 85);
            this.txtArea.Name = "txtArea";
            this.txtArea.Size = new System.Drawing.Size(177, 22);
            this.txtArea.TabIndex = 5;
            // 
            // txtPerimeter
            // 
            this.txtPerimeter.Enabled = false;
            this.txtPerimeter.Location = new System.Drawing.Point(101, 35);
            this.txtPerimeter.Name = "txtPerimeter";
            this.txtPerimeter.Size = new System.Drawing.Size(177, 22);
            this.txtPerimeter.TabIndex = 4;
            // 
            // lblArea
            // 
            this.lblArea.AutoSize = true;
            this.lblArea.Location = new System.Drawing.Point(18, 88);
            this.lblArea.Name = "lblArea";
            this.lblArea.Size = new System.Drawing.Size(44, 16);
            this.lblArea.TabIndex = 3;
            this.lblArea.Text = "Área:";
            // 
            // lblPerimeter
            // 
            this.lblPerimeter.AutoSize = true;
            this.lblPerimeter.Location = new System.Drawing.Point(18, 35);
            this.lblPerimeter.Name = "lblPerimeter";
            this.lblPerimeter.Size = new System.Drawing.Size(78, 16);
            this.lblPerimeter.TabIndex = 2;
            this.lblPerimeter.Text = "Perímetro:";
            // 
            // grbProcess
            // 
            this.grbProcess.Controls.Add(this.btnExit);
            this.grbProcess.Controls.Add(this.btnReset);
            this.grbProcess.Controls.Add(this.btnCalculate);
            this.grbProcess.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grbProcess.Location = new System.Drawing.Point(21, 189);
            this.grbProcess.Name = "grbProcess";
            this.grbProcess.Size = new System.Drawing.Size(300, 88);
            this.grbProcess.TabIndex = 16;
            this.grbProcess.TabStop = false;
            this.grbProcess.Text = "Proceso";
            // 
            // btnExit
            // 
            this.btnExit.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnExit.Location = new System.Drawing.Point(203, 43);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(75, 23);
            this.btnExit.TabIndex = 2;
            this.btnExit.Text = "Salir";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnReset
            // 
            this.btnReset.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReset.Location = new System.Drawing.Point(114, 43);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(75, 23);
            this.btnReset.TabIndex = 1;
            this.btnReset.Text = "Resetear";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // btnCalculate
            // 
            this.btnCalculate.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCalculate.Location = new System.Drawing.Point(21, 43);
            this.btnCalculate.Name = "btnCalculate";
            this.btnCalculate.Size = new System.Drawing.Size(75, 23);
            this.btnCalculate.TabIndex = 0;
            this.btnCalculate.Text = "Calcular";
            this.btnCalculate.UseVisualStyleBackColor = true;
            this.btnCalculate.Click += new System.EventHandler(this.btnCalculate_Click);
            // 
            // grbInputs
            // 
            this.grbInputs.Controls.Add(this.txtSideC);
            this.grbInputs.Controls.Add(this.lblSideC);
            this.grbInputs.Controls.Add(this.txtSideB);
            this.grbInputs.Controls.Add(this.txtSideA);
            this.grbInputs.Controls.Add(this.lblSideB);
            this.grbInputs.Controls.Add(this.lblSideA);
            this.grbInputs.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grbInputs.Location = new System.Drawing.Point(21, 30);
            this.grbInputs.Name = "grbInputs";
            this.grbInputs.Size = new System.Drawing.Size(300, 137);
            this.grbInputs.TabIndex = 15;
            this.grbInputs.TabStop = false;
            this.grbInputs.Text = "Entradas";
            // 
            // txtSideC
            // 
            this.txtSideC.Location = new System.Drawing.Point(101, 104);
            this.txtSideC.Name = "txtSideC";
            this.txtSideC.Size = new System.Drawing.Size(177, 22);
            this.txtSideC.TabIndex = 5;
            // 
            // lblSideC
            // 
            this.lblSideC.AutoSize = true;
            this.lblSideC.Location = new System.Drawing.Point(18, 107);
            this.lblSideC.Name = "lblSideC";
            this.lblSideC.Size = new System.Drawing.Size(58, 16);
            this.lblSideC.TabIndex = 4;
            this.lblSideC.Text = "Lado c:";
            // 
            // txtSideB
            // 
            this.txtSideB.Location = new System.Drawing.Point(101, 64);
            this.txtSideB.Name = "txtSideB";
            this.txtSideB.Size = new System.Drawing.Size(177, 22);
            this.txtSideB.TabIndex = 3;
            // 
            // txtSideA
            // 
            this.txtSideA.Location = new System.Drawing.Point(101, 27);
            this.txtSideA.Name = "txtSideA";
            this.txtSideA.Size = new System.Drawing.Size(177, 22);
            this.txtSideA.TabIndex = 2;
            // 
            // lblSideB
            // 
            this.lblSideB.AutoSize = true;
            this.lblSideB.Location = new System.Drawing.Point(18, 67);
            this.lblSideB.Name = "lblSideB";
            this.lblSideB.Size = new System.Drawing.Size(59, 16);
            this.lblSideB.TabIndex = 1;
            this.lblSideB.Text = "Lado b:";
            // 
            // lblSideA
            // 
            this.lblSideA.AutoSize = true;
            this.lblSideA.Location = new System.Drawing.Point(18, 27);
            this.lblSideA.Name = "lblSideA";
            this.lblSideA.Size = new System.Drawing.Size(59, 16);
            this.lblSideA.TabIndex = 0;
            this.lblSideA.Text = "Lado a:";
            // 
            // frmTriangle
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.grbCanvas);
            this.Controls.Add(this.grbOutputs);
            this.Controls.Add(this.grbProcess);
            this.Controls.Add(this.grbInputs);
            this.Name = "frmTriangle";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Triangulo";
            this.grbCanvas.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picCanvas)).EndInit();
            this.grbOutputs.ResumeLayout(false);
            this.grbOutputs.PerformLayout();
            this.grbProcess.ResumeLayout(false);
            this.grbInputs.ResumeLayout(false);
            this.grbInputs.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grbCanvas;
        private System.Windows.Forms.PictureBox picCanvas;
        private System.Windows.Forms.GroupBox grbOutputs;
        private System.Windows.Forms.TextBox txtArea;
        private System.Windows.Forms.TextBox txtPerimeter;
        private System.Windows.Forms.Label lblArea;
        private System.Windows.Forms.Label lblPerimeter;
        private System.Windows.Forms.GroupBox grbProcess;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnCalculate;
        private System.Windows.Forms.GroupBox grbInputs;
        private System.Windows.Forms.TextBox txtSideC;
        private System.Windows.Forms.Label lblSideC;
        private System.Windows.Forms.TextBox txtSideB;
        private System.Windows.Forms.TextBox txtSideA;
        private System.Windows.Forms.Label lblSideB;
        private System.Windows.Forms.Label lblSideA;
    }
}

