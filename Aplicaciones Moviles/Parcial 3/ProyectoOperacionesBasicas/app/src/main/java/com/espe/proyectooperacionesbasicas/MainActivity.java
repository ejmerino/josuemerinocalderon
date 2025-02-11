package com.espe.proyectooperacionesbasicas;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    //Declarar los objetos graficos
    EditText numero1Text;

    EditText numero2Text;

    TextView lblResultado;

    Button btnSuma, btnResta, btnMulti, btnDivision;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //mapeo
        numero1Text = findViewById(R.id.numero1Text);
        numero2Text = findViewById(R.id.numero2Text);

        lblResultado = findViewById(R.id.lblResultado);

        btnSuma = findViewById(R.id.btnSuma);
        btnResta = findViewById(R.id.btnResta);
        btnMulti = findViewById(R.id.btnMulti);
        btnDivision = findViewById(R.id.btnDivision);

        //eventos
        btnSuma.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                realizarOperaciones("SUMA");
            }
        });

        btnResta.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                realizarOperaciones("RESTA");
            }
        });

        btnMulti.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                realizarOperaciones("MULTIPLICACION");
            }
        });

        btnDivision.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                realizarOperaciones("DIVISION");
            }
        });



    }

    //Metodo para las operaciones
    private void realizarOperaciones(String opciones) {
        double numero1, numero2, resultado=0;
        //validar campos de Texto vacío
        if(numero1Text.getText().toString().isEmpty() || numero2Text.getText().toString().isEmpty()){
            Toast.makeText(this, "Error: Ingrese los números", Toast.LENGTH_SHORT).show();
        }
        //try
        try{
            numero1=Double.parseDouble(numero1Text.getText().toString());
            numero2=Double.parseDouble(numero2Text.getText().toString());

            switch (opciones){
                case "SUMA":
                    resultado = numero1 + numero2;
                    break;
                case "RESTA":
                    resultado = numero1 - numero2;
                    break;
                case "MULTIPLICACION":
                    resultado = numero1 * numero2;
                    break;
                case "DIVISION":
                    if(numero2!=0){
                        resultado = numero1 / numero2;
                    } else{
                        Toast.makeText(this, "Error división por 0", Toast.LENGTH_SHORT).show();
                    }
                    break;
                default:
                    Toast.makeText(this, "Operación no válida", Toast.LENGTH_SHORT).show();
                    break;
            }

            //
            lblResultado.setText("El Resultado es: "+ resultado);

        } catch(NumberFormatException e){
            Toast.makeText(this, "Error: Ingrese números válidos", Toast.LENGTH_SHORT).show();
        }
    }

}