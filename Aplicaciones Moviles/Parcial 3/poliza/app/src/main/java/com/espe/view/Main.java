package com.espe.view;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import com.espe.controller.PolizaController;
import com.espe.databases.DataBaseHelper;
import com.espe.model.Poliza;

public class Main {
    public static void main(String[] args) {
        // Este es un ejemplo de cómo podrías crear la base de datos
        Context context = null; // Aquí debes pasar un contexto adecuado si lo ejecutas en Android, ya que esto no funciona directamente en consola
        DataBaseHelper dbHelper = new DataBaseHelper(context);
        SQLiteDatabase db = dbHelper.getWritableDatabase();

        // Datos de entrada para la póliza
        String nombre = "Juan Pérez";
        int valor = 15000;  // El valor de la propiedad asegurada
        int accidentes = 2; // Número de accidentes previos
        String modelo = "A"; // Tipo de modelo
        String edad = "25-35"; // Rango de edad del asegurado

        // Calcular costo usando PolizaController
        String costo = PolizaController.calcularCosto(nombre, valor, accidentes, modelo, edad);
        System.out.println("Costo de la póliza calculado: " + costo);

        // Crear un objeto Poliza con el costo calculado
        Poliza poliza = new Poliza(nombre, valor, accidentes, modelo, edad, Double.parseDouble(costo));

        // Aquí podrías insertar los datos en la base de datos si lo deseas
        String insertQuery = "INSERT INTO " + dbHelper.TABLE_NAME + " (" +
                dbHelper.COLUMN_NOMBRE + ", " +
                dbHelper.COLUMN_VALOR + ", " +
                dbHelper.COLUMN_ACCIDENTES + ", " +
                dbHelper.COLUMN_MODELO + ", " +
                dbHelper.COLUMN_EDAD + ", " +
                dbHelper.COLUMN_COSTO + ") VALUES ('" +
                poliza.getNombre() + "', " +
                poliza.getValor() + ", " +
                poliza.getAccidente() + ", '" +
                poliza.getModelo() + "', '" +
                poliza.getEdad() + "', " +
                poliza.getCostoPoliza() + ");";

        db.execSQL(insertQuery);
        System.out.println("Póliza insertada en la base de datos.");
    }
}
