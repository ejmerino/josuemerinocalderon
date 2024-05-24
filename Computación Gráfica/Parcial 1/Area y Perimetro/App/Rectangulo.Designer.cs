namespace AreaYPerimetro
{
    partial class Rectangulo
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Rectangulo));
            this.lblTitulo = new System.Windows.Forms.Label();
            this.btnLimpiar = new System.Windows.Forms.Button();
            this.btnSalir = new System.Windows.Forms.Button();
            this.btnAtras = new System.Windows.Forms.Button();
            this.lblMedida = new System.Windows.Forms.Label();
            this.lblAreaResultado = new System.Windows.Forms.Label();
            this.lblPerimetroResultado = new System.Windows.Forms.Label();
            this.lblArea = new System.Windows.Forms.Label();
            this.lblPerimetro = new System.Windows.Forms.Label();
            this.btnCalcular = new System.Windows.Forms.Button();
            this.txtLargo = new System.Windows.Forms.TextBox();
            this.lblIngresoLargo = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txtAncho = new System.Windows.Forms.TextBox();
            this.lblIngresoAncho = new System.Windows.Forms.Label();
            this.picRectangulo = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.picRectangulo)).BeginInit();
            this.SuspendLayout();
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitulo.Location = new System.Drawing.Point(125, 35);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(565, 32);
            this.lblTitulo.TabIndex = 0;
            this.lblTitulo.Text = "Cálculo Área y Perímetro del Rectángulo";
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLimpiar.Location = new System.Drawing.Point(622, 198);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(94, 35);
            this.btnLimpiar.TabIndex = 23;
            this.btnLimpiar.Text = "Limpiar";
            this.btnLimpiar.UseVisualStyleBackColor = true;
            this.btnLimpiar.Click += new System.EventHandler(this.btnLimpiar_Click);
            // 
            // btnSalir
            // 
            this.btnSalir.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSalir.Location = new System.Drawing.Point(622, 372);
            this.btnSalir.Name = "btnSalir";
            this.btnSalir.Size = new System.Drawing.Size(92, 33);
            this.btnSalir.TabIndex = 22;
            this.btnSalir.Text = "Salir";
            this.btnSalir.UseVisualStyleBackColor = true;
            this.btnSalir.Click += new System.EventHandler(this.btnSalir_Click);
            // 
            // btnAtras
            // 
            this.btnAtras.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAtras.Location = new System.Drawing.Point(470, 372);
            this.btnAtras.Name = "btnAtras";
            this.btnAtras.Size = new System.Drawing.Size(104, 33);
            this.btnAtras.TabIndex = 21;
            this.btnAtras.Text = "Atras";
            this.btnAtras.UseVisualStyleBackColor = true;
            this.btnAtras.Click += new System.EventHandler(this.btnAtras_Click);
            // 
            // lblMedida
            // 
            this.lblMedida.AutoSize = true;
            this.lblMedida.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMedida.Location = new System.Drawing.Point(692, 91);
            this.lblMedida.Name = "lblMedida";
            this.lblMedida.Size = new System.Drawing.Size(45, 29);
            this.lblMedida.TabIndex = 20;
            this.lblMedida.Text = "cm";
            // 
            // lblAreaResultado
            // 
            this.lblAreaResultado.AutoSize = true;
            this.lblAreaResultado.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAreaResultado.Location = new System.Drawing.Point(559, 309);
            this.lblAreaResultado.Name = "lblAreaResultado";
            this.lblAreaResultado.Size = new System.Drawing.Size(0, 29);
            this.lblAreaResultado.TabIndex = 19;
            // 
            // lblPerimetroResultado
            // 
            this.lblPerimetroResultado.AutoSize = true;
            this.lblPerimetroResultado.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPerimetroResultado.Location = new System.Drawing.Point(612, 269);
            this.lblPerimetroResultado.Name = "lblPerimetroResultado";
            this.lblPerimetroResultado.Size = new System.Drawing.Size(0, 29);
            this.lblPerimetroResultado.TabIndex = 18;
            // 
            // lblArea
            // 
            this.lblArea.AutoSize = true;
            this.lblArea.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblArea.Location = new System.Drawing.Point(413, 309);
            this.lblArea.Name = "lblArea";
            this.lblArea.Size = new System.Drawing.Size(129, 29);
            this.lblArea.TabIndex = 17;
            this.lblArea.Text = "El Área es:";
            // 
            // lblPerimetro
            // 
            this.lblPerimetro.AutoSize = true;
            this.lblPerimetro.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPerimetro.Location = new System.Drawing.Point(413, 269);
            this.lblPerimetro.Name = "lblPerimetro";
            this.lblPerimetro.Size = new System.Drawing.Size(185, 29);
            this.lblPerimetro.TabIndex = 16;
            this.lblPerimetro.Text = "El Perímetro es:";
            // 
            // btnCalcular
            // 
            this.btnCalcular.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCalcular.Location = new System.Drawing.Point(470, 198);
            this.btnCalcular.Name = "btnCalcular";
            this.btnCalcular.Size = new System.Drawing.Size(104, 35);
            this.btnCalcular.TabIndex = 15;
            this.btnCalcular.Text = "Calcular";
            this.btnCalcular.UseVisualStyleBackColor = true;
            this.btnCalcular.Click += new System.EventHandler(this.btnCalcular_Click);
            // 
            // txtLargo
            // 
            this.txtLargo.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLargo.Location = new System.Drawing.Point(619, 88);
            this.txtLargo.Name = "txtLargo";
            this.txtLargo.Size = new System.Drawing.Size(67, 34);
            this.txtLargo.TabIndex = 14;
            // 
            // lblIngresoLargo
            // 
            this.lblIngresoLargo.AutoSize = true;
            this.lblIngresoLargo.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblIngresoLargo.Location = new System.Drawing.Point(419, 91);
            this.lblIngresoLargo.Name = "lblIngresoLargo";
            this.lblIngresoLargo.Size = new System.Drawing.Size(193, 29);
            this.lblIngresoLargo.TabIndex = 13;
            this.lblIngresoLargo.Text = "Ingresa el Largo:";
            this.lblIngresoLargo.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(692, 133);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(45, 29);
            this.label1.TabIndex = 26;
            this.label1.Text = "cm";
            // 
            // txtAncho
            // 
            this.txtAncho.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAncho.Location = new System.Drawing.Point(619, 130);
            this.txtAncho.Name = "txtAncho";
            this.txtAncho.Size = new System.Drawing.Size(67, 34);
            this.txtAncho.TabIndex = 25;
            // 
            // lblIngresoAncho
            // 
            this.lblIngresoAncho.AutoSize = true;
            this.lblIngresoAncho.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblIngresoAncho.Location = new System.Drawing.Point(419, 133);
            this.lblIngresoAncho.Name = "lblIngresoAncho";
            this.lblIngresoAncho.Size = new System.Drawing.Size(198, 29);
            this.lblIngresoAncho.TabIndex = 24;
            this.lblIngresoAncho.Text = "Ingresa el Ancho:";
            this.lblIngresoAncho.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // picRectangulo
            // 
            this.picRectangulo.Image = ((System.Drawing.Image)(resources.GetObject("picRectangulo.Image")));
            this.picRectangulo.Location = new System.Drawing.Point(23, 89);
            this.picRectangulo.Name = "picRectangulo";
            this.picRectangulo.Size = new System.Drawing.Size(340, 339);
            this.picRectangulo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picRectangulo.TabIndex = 27;
            this.picRectangulo.TabStop = false;
            // 
            // Rectangulo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.picRectangulo);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtAncho);
            this.Controls.Add(this.lblIngresoAncho);
            this.Controls.Add(this.btnLimpiar);
            this.Controls.Add(this.btnSalir);
            this.Controls.Add(this.btnAtras);
            this.Controls.Add(this.lblMedida);
            this.Controls.Add(this.lblAreaResultado);
            this.Controls.Add(this.lblPerimetroResultado);
            this.Controls.Add(this.lblArea);
            this.Controls.Add(this.lblPerimetro);
            this.Controls.Add(this.btnCalcular);
            this.Controls.Add(this.txtLargo);
            this.Controls.Add(this.lblIngresoLargo);
            this.Controls.Add(this.lblTitulo);
            this.Name = "Rectangulo";
            this.Text = "Rectangulo";
            ((System.ComponentModel.ISupportInitialize)(this.picRectangulo)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Button btnLimpiar;
        private System.Windows.Forms.Button btnSalir;
        private System.Windows.Forms.Button btnAtras;
        private System.Windows.Forms.Label lblMedida;
        private System.Windows.Forms.Label lblAreaResultado;
        private System.Windows.Forms.Label lblPerimetroResultado;
        private System.Windows.Forms.Label lblArea;
        private System.Windows.Forms.Label lblPerimetro;
        private System.Windows.Forms.Button btnCalcular;
        private System.Windows.Forms.TextBox txtLargo;
        private System.Windows.Forms.Label lblIngresoLargo;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtAncho;
        private System.Windows.Forms.Label lblIngresoAncho;
        private System.Windows.Forms.PictureBox picRectangulo;
    }
}