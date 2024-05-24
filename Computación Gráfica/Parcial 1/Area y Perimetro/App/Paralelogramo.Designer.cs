namespace AreaYPerimetro
{
    partial class Paralelogramo
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Paralelogramo));
            this.picRectangulo = new System.Windows.Forms.PictureBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtAltura = new System.Windows.Forms.TextBox();
            this.lblIngresoAltura = new System.Windows.Forms.Label();
            this.btnLimpiar = new System.Windows.Forms.Button();
            this.btnSalir = new System.Windows.Forms.Button();
            this.btnAtras = new System.Windows.Forms.Button();
            this.lblMedida = new System.Windows.Forms.Label();
            this.lblAreaResultado = new System.Windows.Forms.Label();
            this.lblPerimetroResultado = new System.Windows.Forms.Label();
            this.lblArea = new System.Windows.Forms.Label();
            this.lblPerimetro = new System.Windows.Forms.Label();
            this.btnCalcular = new System.Windows.Forms.Button();
            this.txtBase = new System.Windows.Forms.TextBox();
            this.lblIngresoBase = new System.Windows.Forms.Label();
            this.lblTitulo = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.picRectangulo)).BeginInit();
            this.SuspendLayout();
            // 
            // picRectangulo
            // 
            this.picRectangulo.Image = ((System.Drawing.Image)(resources.GetObject("picRectangulo.Image")));
            this.picRectangulo.Location = new System.Drawing.Point(43, 83);
            this.picRectangulo.Name = "picRectangulo";
            this.picRectangulo.Size = new System.Drawing.Size(340, 339);
            this.picRectangulo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picRectangulo.TabIndex = 43;
            this.picRectangulo.TabStop = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(712, 127);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(45, 29);
            this.label1.TabIndex = 42;
            this.label1.Text = "cm";
            // 
            // txtAltura
            // 
            this.txtAltura.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAltura.Location = new System.Drawing.Point(639, 124);
            this.txtAltura.Name = "txtAltura";
            this.txtAltura.Size = new System.Drawing.Size(67, 34);
            this.txtAltura.TabIndex = 41;
            // 
            // lblIngresoAltura
            // 
            this.lblIngresoAltura.AutoSize = true;
            this.lblIngresoAltura.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblIngresoAltura.Location = new System.Drawing.Point(439, 127);
            this.lblIngresoAltura.Name = "lblIngresoAltura";
            this.lblIngresoAltura.Size = new System.Drawing.Size(191, 29);
            this.lblIngresoAltura.TabIndex = 40;
            this.lblIngresoAltura.Text = "Ingresa la Altura:";
            this.lblIngresoAltura.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLimpiar.Location = new System.Drawing.Point(642, 192);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(94, 35);
            this.btnLimpiar.TabIndex = 39;
            this.btnLimpiar.Text = "Limpiar";
            this.btnLimpiar.UseVisualStyleBackColor = true;
            this.btnLimpiar.Click += new System.EventHandler(this.btnLimpiar_Click);
            // 
            // btnSalir
            // 
            this.btnSalir.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSalir.Location = new System.Drawing.Point(642, 366);
            this.btnSalir.Name = "btnSalir";
            this.btnSalir.Size = new System.Drawing.Size(92, 33);
            this.btnSalir.TabIndex = 38;
            this.btnSalir.Text = "Salir";
            this.btnSalir.UseVisualStyleBackColor = true;
            this.btnSalir.Click += new System.EventHandler(this.btnSalir_Click);
            // 
            // btnAtras
            // 
            this.btnAtras.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAtras.Location = new System.Drawing.Point(490, 366);
            this.btnAtras.Name = "btnAtras";
            this.btnAtras.Size = new System.Drawing.Size(104, 33);
            this.btnAtras.TabIndex = 37;
            this.btnAtras.Text = "Atras";
            this.btnAtras.UseVisualStyleBackColor = true;
            this.btnAtras.Click += new System.EventHandler(this.btnAtras_Click);
            // 
            // lblMedida
            // 
            this.lblMedida.AutoSize = true;
            this.lblMedida.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMedida.Location = new System.Drawing.Point(712, 85);
            this.lblMedida.Name = "lblMedida";
            this.lblMedida.Size = new System.Drawing.Size(45, 29);
            this.lblMedida.TabIndex = 36;
            this.lblMedida.Text = "cm";
            // 
            // lblAreaResultado
            // 
            this.lblAreaResultado.AutoSize = true;
            this.lblAreaResultado.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAreaResultado.Location = new System.Drawing.Point(579, 303);
            this.lblAreaResultado.Name = "lblAreaResultado";
            this.lblAreaResultado.Size = new System.Drawing.Size(0, 29);
            this.lblAreaResultado.TabIndex = 35;
            // 
            // lblPerimetroResultado
            // 
            this.lblPerimetroResultado.AutoSize = true;
            this.lblPerimetroResultado.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPerimetroResultado.Location = new System.Drawing.Point(632, 263);
            this.lblPerimetroResultado.Name = "lblPerimetroResultado";
            this.lblPerimetroResultado.Size = new System.Drawing.Size(0, 29);
            this.lblPerimetroResultado.TabIndex = 34;
            // 
            // lblArea
            // 
            this.lblArea.AutoSize = true;
            this.lblArea.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblArea.Location = new System.Drawing.Point(433, 303);
            this.lblArea.Name = "lblArea";
            this.lblArea.Size = new System.Drawing.Size(129, 29);
            this.lblArea.TabIndex = 33;
            this.lblArea.Text = "El Área es:";
            // 
            // lblPerimetro
            // 
            this.lblPerimetro.AutoSize = true;
            this.lblPerimetro.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPerimetro.Location = new System.Drawing.Point(433, 263);
            this.lblPerimetro.Name = "lblPerimetro";
            this.lblPerimetro.Size = new System.Drawing.Size(185, 29);
            this.lblPerimetro.TabIndex = 32;
            this.lblPerimetro.Text = "El Perímetro es:";
            // 
            // btnCalcular
            // 
            this.btnCalcular.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCalcular.Location = new System.Drawing.Point(490, 192);
            this.btnCalcular.Name = "btnCalcular";
            this.btnCalcular.Size = new System.Drawing.Size(104, 35);
            this.btnCalcular.TabIndex = 31;
            this.btnCalcular.Text = "Calcular";
            this.btnCalcular.UseVisualStyleBackColor = true;
            this.btnCalcular.Click += new System.EventHandler(this.btnCalcular_Click);
            // 
            // txtBase
            // 
            this.txtBase.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBase.Location = new System.Drawing.Point(639, 82);
            this.txtBase.Name = "txtBase";
            this.txtBase.Size = new System.Drawing.Size(67, 34);
            this.txtBase.TabIndex = 30;
            // 
            // lblIngresoBase
            // 
            this.lblIngresoBase.AutoSize = true;
            this.lblIngresoBase.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblIngresoBase.Location = new System.Drawing.Point(439, 85);
            this.lblIngresoBase.Name = "lblIngresoBase";
            this.lblIngresoBase.Size = new System.Drawing.Size(185, 29);
            this.lblIngresoBase.TabIndex = 29;
            this.lblIngresoBase.Text = "Ingresa la Base:";
            this.lblIngresoBase.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitulo.Location = new System.Drawing.Point(125, 27);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(609, 32);
            this.lblTitulo.TabIndex = 28;
            this.lblTitulo.Text = "Cálculo Área y Perímetro del Paralelogramo";
            // 
            // Paralelogramo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.picRectangulo);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtAltura);
            this.Controls.Add(this.lblIngresoAltura);
            this.Controls.Add(this.btnLimpiar);
            this.Controls.Add(this.btnSalir);
            this.Controls.Add(this.btnAtras);
            this.Controls.Add(this.lblMedida);
            this.Controls.Add(this.lblAreaResultado);
            this.Controls.Add(this.lblPerimetroResultado);
            this.Controls.Add(this.lblArea);
            this.Controls.Add(this.lblPerimetro);
            this.Controls.Add(this.btnCalcular);
            this.Controls.Add(this.txtBase);
            this.Controls.Add(this.lblIngresoBase);
            this.Controls.Add(this.lblTitulo);
            this.Name = "Paralelogramo";
            this.Text = "Paralelogramo";
            ((System.ComponentModel.ISupportInitialize)(this.picRectangulo)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox picRectangulo;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtAltura;
        private System.Windows.Forms.Label lblIngresoAltura;
        private System.Windows.Forms.Button btnLimpiar;
        private System.Windows.Forms.Button btnSalir;
        private System.Windows.Forms.Button btnAtras;
        private System.Windows.Forms.Label lblMedida;
        private System.Windows.Forms.Label lblAreaResultado;
        private System.Windows.Forms.Label lblPerimetroResultado;
        private System.Windows.Forms.Label lblArea;
        private System.Windows.Forms.Label lblPerimetro;
        private System.Windows.Forms.Button btnCalcular;
        private System.Windows.Forms.TextBox txtBase;
        private System.Windows.Forms.Label lblIngresoBase;
        private System.Windows.Forms.Label lblTitulo;
    }
}