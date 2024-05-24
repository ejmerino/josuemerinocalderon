namespace AreaYPerimetro
{
    partial class Pentagono
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Pentagono));
            this.picPentagono = new System.Windows.Forms.PictureBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtApotema = new System.Windows.Forms.TextBox();
            this.lblIngresoApotema = new System.Windows.Forms.Label();
            this.btnLimpiar = new System.Windows.Forms.Button();
            this.btnSalir = new System.Windows.Forms.Button();
            this.btnAtras = new System.Windows.Forms.Button();
            this.lblMedida = new System.Windows.Forms.Label();
            this.lblAreaResultado = new System.Windows.Forms.Label();
            this.lblPerimetroResultado = new System.Windows.Forms.Label();
            this.lblArea = new System.Windows.Forms.Label();
            this.lblPerimetro = new System.Windows.Forms.Label();
            this.btnCalcular = new System.Windows.Forms.Button();
            this.txtLado = new System.Windows.Forms.TextBox();
            this.lblIngresoLado = new System.Windows.Forms.Label();
            this.lblTitulo = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.picPentagono)).BeginInit();
            this.SuspendLayout();
            // 
            // picPentagono
            // 
            this.picPentagono.Image = ((System.Drawing.Image)(resources.GetObject("picPentagono.Image")));
            this.picPentagono.Location = new System.Drawing.Point(43, 83);
            this.picPentagono.Name = "picPentagono";
            this.picPentagono.Size = new System.Drawing.Size(340, 339);
            this.picPentagono.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picPentagono.TabIndex = 59;
            this.picPentagono.TabStop = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(712, 127);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(45, 29);
            this.label1.TabIndex = 58;
            this.label1.Text = "cm";
            // 
            // txtApotema
            // 
            this.txtApotema.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtApotema.Location = new System.Drawing.Point(639, 124);
            this.txtApotema.Name = "txtApotema";
            this.txtApotema.Size = new System.Drawing.Size(67, 34);
            this.txtApotema.TabIndex = 57;
            // 
            // lblIngresoApotema
            // 
            this.lblIngresoApotema.AutoSize = true;
            this.lblIngresoApotema.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblIngresoApotema.Location = new System.Drawing.Point(406, 127);
            this.lblIngresoApotema.Name = "lblIngresoApotema";
            this.lblIngresoApotema.Size = new System.Drawing.Size(226, 29);
            this.lblIngresoApotema.TabIndex = 56;
            this.lblIngresoApotema.Text = "Ingresa la Apotema:";
            this.lblIngresoApotema.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLimpiar.Location = new System.Drawing.Point(642, 192);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(94, 35);
            this.btnLimpiar.TabIndex = 55;
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
            this.btnSalir.TabIndex = 54;
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
            this.btnAtras.TabIndex = 53;
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
            this.lblMedida.TabIndex = 52;
            this.lblMedida.Text = "cm";
            // 
            // lblAreaResultado
            // 
            this.lblAreaResultado.AutoSize = true;
            this.lblAreaResultado.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAreaResultado.Location = new System.Drawing.Point(579, 303);
            this.lblAreaResultado.Name = "lblAreaResultado";
            this.lblAreaResultado.Size = new System.Drawing.Size(0, 29);
            this.lblAreaResultado.TabIndex = 51;
            // 
            // lblPerimetroResultado
            // 
            this.lblPerimetroResultado.AutoSize = true;
            this.lblPerimetroResultado.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPerimetroResultado.Location = new System.Drawing.Point(632, 263);
            this.lblPerimetroResultado.Name = "lblPerimetroResultado";
            this.lblPerimetroResultado.Size = new System.Drawing.Size(0, 29);
            this.lblPerimetroResultado.TabIndex = 50;
            // 
            // lblArea
            // 
            this.lblArea.AutoSize = true;
            this.lblArea.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblArea.Location = new System.Drawing.Point(433, 303);
            this.lblArea.Name = "lblArea";
            this.lblArea.Size = new System.Drawing.Size(129, 29);
            this.lblArea.TabIndex = 49;
            this.lblArea.Text = "El Área es:";
            // 
            // lblPerimetro
            // 
            this.lblPerimetro.AutoSize = true;
            this.lblPerimetro.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPerimetro.Location = new System.Drawing.Point(433, 263);
            this.lblPerimetro.Name = "lblPerimetro";
            this.lblPerimetro.Size = new System.Drawing.Size(185, 29);
            this.lblPerimetro.TabIndex = 48;
            this.lblPerimetro.Text = "El Perímetro es:";
            // 
            // btnCalcular
            // 
            this.btnCalcular.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCalcular.Location = new System.Drawing.Point(490, 192);
            this.btnCalcular.Name = "btnCalcular";
            this.btnCalcular.Size = new System.Drawing.Size(104, 35);
            this.btnCalcular.TabIndex = 47;
            this.btnCalcular.Text = "Calcular";
            this.btnCalcular.UseVisualStyleBackColor = true;
            this.btnCalcular.Click += new System.EventHandler(this.btnCalcular_Click);
            // 
            // txtLado
            // 
            this.txtLado.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLado.Location = new System.Drawing.Point(639, 82);
            this.txtLado.Name = "txtLado";
            this.txtLado.Size = new System.Drawing.Size(67, 34);
            this.txtLado.TabIndex = 46;
            // 
            // lblIngresoLado
            // 
            this.lblIngresoLado.AutoSize = true;
            this.lblIngresoLado.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblIngresoLado.Location = new System.Drawing.Point(406, 85);
            this.lblIngresoLado.Name = "lblIngresoLado";
            this.lblIngresoLado.Size = new System.Drawing.Size(185, 29);
            this.lblIngresoLado.TabIndex = 45;
            this.lblIngresoLado.Text = "Ingresa el Lado:";
            this.lblIngresoLado.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitulo.Location = new System.Drawing.Point(145, 29);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(558, 32);
            this.lblTitulo.TabIndex = 44;
            this.lblTitulo.Text = "Cálculo Área y Perímetro del Pentágono";
            // 
            // Pentagono
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.picPentagono);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtApotema);
            this.Controls.Add(this.lblIngresoApotema);
            this.Controls.Add(this.btnLimpiar);
            this.Controls.Add(this.btnSalir);
            this.Controls.Add(this.btnAtras);
            this.Controls.Add(this.lblMedida);
            this.Controls.Add(this.lblAreaResultado);
            this.Controls.Add(this.lblPerimetroResultado);
            this.Controls.Add(this.lblArea);
            this.Controls.Add(this.lblPerimetro);
            this.Controls.Add(this.btnCalcular);
            this.Controls.Add(this.txtLado);
            this.Controls.Add(this.lblIngresoLado);
            this.Controls.Add(this.lblTitulo);
            this.Name = "Pentagono";
            this.Text = "Pentagono";
            ((System.ComponentModel.ISupportInitialize)(this.picPentagono)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox picPentagono;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtApotema;
        private System.Windows.Forms.Label lblIngresoApotema;
        private System.Windows.Forms.Button btnLimpiar;
        private System.Windows.Forms.Button btnSalir;
        private System.Windows.Forms.Button btnAtras;
        private System.Windows.Forms.Label lblMedida;
        private System.Windows.Forms.Label lblAreaResultado;
        private System.Windows.Forms.Label lblPerimetroResultado;
        private System.Windows.Forms.Label lblArea;
        private System.Windows.Forms.Label lblPerimetro;
        private System.Windows.Forms.Button btnCalcular;
        private System.Windows.Forms.TextBox txtLado;
        private System.Windows.Forms.Label lblIngresoLado;
        private System.Windows.Forms.Label lblTitulo;
    }
}