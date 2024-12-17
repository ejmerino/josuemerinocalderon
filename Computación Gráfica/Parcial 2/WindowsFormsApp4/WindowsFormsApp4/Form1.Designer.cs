namespace WindowsFormsApp4
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
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.trackBar1 = new System.Windows.Forms.TrackBar();
            this.btnderecha = new System.Windows.Forms.Button();
            this.btnizquierda = new System.Windows.Forms.Button();
            this.btngraficar = new System.Windows.Forms.Button();
            this.Lados = new System.Windows.Forms.TextBox();
            this.Ladoss = new System.Windows.Forms.Label();
            this.btnTriangulo = new System.Windows.Forms.Button();
            this.btncuadrado = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.trackBar1)).BeginInit();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.Location = new System.Drawing.Point(161, 21);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(361, 235);
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // trackBar1
            // 
            this.trackBar1.Location = new System.Drawing.Point(226, 307);
            this.trackBar1.Name = "trackBar1";
            this.trackBar1.Size = new System.Drawing.Size(161, 45);
            this.trackBar1.TabIndex = 1;
            // 
            // btnderecha
            // 
            this.btnderecha.Location = new System.Drawing.Point(548, 233);
            this.btnderecha.Name = "btnderecha";
            this.btnderecha.Size = new System.Drawing.Size(75, 23);
            this.btnderecha.TabIndex = 2;
            this.btnderecha.Text = "Derecha";
            this.btnderecha.UseVisualStyleBackColor = true;
            this.btnderecha.Click += new System.EventHandler(this.btnderecha_Click);
            // 
            // btnizquierda
            // 
            this.btnizquierda.Location = new System.Drawing.Point(548, 127);
            this.btnizquierda.Name = "btnizquierda";
            this.btnizquierda.Size = new System.Drawing.Size(75, 23);
            this.btnizquierda.TabIndex = 3;
            this.btnizquierda.Text = "Izquierda";
            this.btnizquierda.UseVisualStyleBackColor = true;
            this.btnizquierda.Click += new System.EventHandler(this.btnizquierda_Click);
            // 
            // btngraficar
            // 
            this.btngraficar.Location = new System.Drawing.Point(25, 149);
            this.btngraficar.Name = "btngraficar";
            this.btngraficar.Size = new System.Drawing.Size(75, 23);
            this.btngraficar.TabIndex = 4;
            this.btngraficar.Text = "graficar";
            this.btngraficar.UseVisualStyleBackColor = true;
            this.btngraficar.Click += new System.EventHandler(this.btngraficar_Click);
            // 
            // Lados
            // 
            this.Lados.Location = new System.Drawing.Point(12, 110);
            this.Lados.Name = "Lados";
            this.Lados.Size = new System.Drawing.Size(100, 20);
            this.Lados.TabIndex = 5;
            this.Lados.TextChanged += new System.EventHandler(this.Lados_TextChanged);
            // 
            // Ladoss
            // 
            this.Ladoss.AutoSize = true;
            this.Ladoss.Location = new System.Drawing.Point(22, 82);
            this.Ladoss.Name = "Ladoss";
            this.Ladoss.Size = new System.Drawing.Size(80, 13);
            this.Ladoss.TabIndex = 6;
            this.Ladoss.Text = "Ingresar Lados:";
            // 
            // btnTriangulo
            // 
            this.btnTriangulo.Location = new System.Drawing.Point(548, 82);
            this.btnTriangulo.Name = "btnTriangulo";
            this.btnTriangulo.Size = new System.Drawing.Size(75, 23);
            this.btnTriangulo.TabIndex = 7;
            this.btnTriangulo.Text = "Triangulo";
            this.btnTriangulo.UseVisualStyleBackColor = true;
            this.btnTriangulo.Click += new System.EventHandler(this.btnTriangulo_Click);
            // 
            // btncuadrado
            // 
            this.btncuadrado.Location = new System.Drawing.Point(548, 177);
            this.btncuadrado.Name = "btncuadrado";
            this.btncuadrado.Size = new System.Drawing.Size(75, 23);
            this.btncuadrado.TabIndex = 8;
            this.btncuadrado.Text = "Cuadrado";
            this.btncuadrado.UseVisualStyleBackColor = true;
            this.btncuadrado.Click += new System.EventHandler(this.btncuadrado_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btncuadrado);
            this.Controls.Add(this.btnTriangulo);
            this.Controls.Add(this.Ladoss);
            this.Controls.Add(this.Lados);
            this.Controls.Add(this.btngraficar);
            this.Controls.Add(this.btnizquierda);
            this.Controls.Add(this.btnderecha);
            this.Controls.Add(this.trackBar1);
            this.Controls.Add(this.pictureBox1);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.trackBar1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.TrackBar trackBar1;
        private System.Windows.Forms.Button btnderecha;
        private System.Windows.Forms.Button btnizquierda;
        private System.Windows.Forms.Button btngraficar;
        private System.Windows.Forms.TextBox Lados;
        private System.Windows.Forms.Label Ladoss;
        private System.Windows.Forms.Button btnTriangulo;
        private System.Windows.Forms.Button btncuadrado;
    }
}

