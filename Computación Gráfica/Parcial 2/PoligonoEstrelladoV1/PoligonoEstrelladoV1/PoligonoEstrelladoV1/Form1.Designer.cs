namespace PoligonoEstrelladoV1
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
            this.grbInput = new System.Windows.Forms.GroupBox();
            this.txtLadoPoligonal = new System.Windows.Forms.TextBox();
            this.lblInputLado = new System.Windows.Forms.Label();
            this.grbActions = new System.Windows.Forms.GroupBox();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnClean = new System.Windows.Forms.Button();
            this.btnGraphic = new System.Windows.Forms.Button();
            this.grbCanva = new System.Windows.Forms.GroupBox();
            this.picCanvas = new System.Windows.Forms.PictureBox();
            this.grbInput.SuspendLayout();
            this.grbActions.SuspendLayout();
            this.grbCanva.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picCanvas)).BeginInit();
            this.SuspendLayout();
            // 
            // grbInput
            // 
            this.grbInput.Controls.Add(this.txtLadoPoligonal);
            this.grbInput.Controls.Add(this.lblInputLado);
            this.grbInput.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grbInput.Location = new System.Drawing.Point(21, 34);
            this.grbInput.Name = "grbInput";
            this.grbInput.Size = new System.Drawing.Size(296, 185);
            this.grbInput.TabIndex = 0;
            this.grbInput.TabStop = false;
            this.grbInput.Text = "Entrada";
            // 
            // txtLadoPoligonal
            // 
            this.txtLadoPoligonal.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLadoPoligonal.Location = new System.Drawing.Point(10, 92);
            this.txtLadoPoligonal.Name = "txtLadoPoligonal";
            this.txtLadoPoligonal.Size = new System.Drawing.Size(263, 29);
            this.txtLadoPoligonal.TabIndex = 1;
            this.txtLadoPoligonal.TextChanged += new System.EventHandler(this.txtLadoPoligonal_TextChanged);
            // 
            // lblInputLado
            // 
            this.lblInputLado.AutoSize = true;
            this.lblInputLado.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblInputLado.Location = new System.Drawing.Point(6, 55);
            this.lblInputLado.Name = "lblInputLado";
            this.lblInputLado.Size = new System.Drawing.Size(267, 20);
            this.lblInputLado.TabIndex = 0;
            this.lblInputLado.Text = "Ingrese el tamaño del lado poligonal:";
            // 
            // grbActions
            // 
            this.grbActions.Controls.Add(this.btnExit);
            this.grbActions.Controls.Add(this.btnClean);
            this.grbActions.Controls.Add(this.btnGraphic);
            this.grbActions.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grbActions.Location = new System.Drawing.Point(21, 250);
            this.grbActions.Name = "grbActions";
            this.grbActions.Size = new System.Drawing.Size(296, 116);
            this.grbActions.TabIndex = 1;
            this.grbActions.TabStop = false;
            this.grbActions.Text = "Acciones";
            // 
            // btnExit
            // 
            this.btnExit.Location = new System.Drawing.Point(198, 53);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(75, 34);
            this.btnExit.TabIndex = 3;
            this.btnExit.Text = "Salir";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnClean
            // 
            this.btnClean.Location = new System.Drawing.Point(103, 53);
            this.btnClean.Name = "btnClean";
            this.btnClean.Size = new System.Drawing.Size(75, 33);
            this.btnClean.TabIndex = 3;
            this.btnClean.Text = "Limpiar";
            this.btnClean.UseVisualStyleBackColor = true;
            this.btnClean.Click += new System.EventHandler(this.btnClean_Click);
            // 
            // btnGraphic
            // 
            this.btnGraphic.Location = new System.Drawing.Point(10, 52);
            this.btnGraphic.Name = "btnGraphic";
            this.btnGraphic.Size = new System.Drawing.Size(75, 34);
            this.btnGraphic.TabIndex = 0;
            this.btnGraphic.Text = "Graficar";
            this.btnGraphic.UseVisualStyleBackColor = true;
            this.btnGraphic.Click += new System.EventHandler(this.btnGraphic_Click);
            // 
            // grbCanva
            // 
            this.grbCanva.Controls.Add(this.picCanvas);
            this.grbCanva.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grbCanva.Location = new System.Drawing.Point(342, 34);
            this.grbCanva.Name = "grbCanva";
            this.grbCanva.Size = new System.Drawing.Size(475, 403);
            this.grbCanva.TabIndex = 2;
            this.grbCanva.TabStop = false;
            this.grbCanva.Text = "Gráfico";
            // 
            // picCanvas
            // 
            this.picCanvas.Location = new System.Drawing.Point(6, 20);
            this.picCanvas.Name = "picCanvas";
            this.picCanvas.Size = new System.Drawing.Size(463, 377);
            this.picCanvas.TabIndex = 0;
            this.picCanvas.TabStop = false;
            this.picCanvas.Click += new System.EventHandler(this.picCanvas_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(828, 457);
            this.Controls.Add(this.grbCanva);
            this.Controls.Add(this.grbActions);
            this.Controls.Add(this.grbInput);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.grbInput.ResumeLayout(false);
            this.grbInput.PerformLayout();
            this.grbActions.ResumeLayout(false);
            this.grbCanva.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picCanvas)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grbInput;
        private System.Windows.Forms.GroupBox grbActions;
        private System.Windows.Forms.GroupBox grbCanva;
        private System.Windows.Forms.TextBox txtLadoPoligonal;
        private System.Windows.Forms.Label lblInputLado;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnClean;
        private System.Windows.Forms.Button btnGraphic;
        private System.Windows.Forms.PictureBox picCanvas;
    }
}

