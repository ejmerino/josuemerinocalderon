package org.example.databases;

import java.sql.*;

import androidx.annotation.Nullable;

import javax.naming.Context;

public class DataBaseHelper extends SQLiteOpenHelper{
    private static final String DATABASE_NAME="poliza.db";

    private static final int DATABASE_VERSION=1;

    //Tablas y Columnas
    private static final String TABLE_NAME="polizas";
    private static final String COLUMN_ID="id";
    private static final String COLUMN_NOMBRE="nombre";
    private static final String COLUMN_VALOR="valor";
    private static final String COLUMN_ACCIDENTES="accidentes";
    private static final String COLUMN_MODELO="modelo";
    private static final String COLUMN_EDAD="edad";
    private static final String COLUMN_COSTO="costo-poliza";

    //CrearTabla
    public static final String TABLA_CREATE=
            " CREATE TABLE " + TABLE_NAME + " ( " +
                    COLUMN_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    COLUMN_NOMBRE + " TEXT NOT NULL, " +
                    COLUMN_VALOR + " REAL NOT NULL, " +
                    COLUMN_ACCIDENTES + " INTEGER NOT NULL, " +
                    COLUMN_MODELO + " TEXT NOT NULL, " +
                    COLUMN_EDAD + " TEXT NOT NULL, " +
                    COLUMN_COSTO + " REAL NOT NULL ) " ;

    //Constructor

    public DataBaseHelper(@Nullable Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase){
        sqLiteDatabase.execSQL(TABLE_CREATE);
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1){
        //Si se elimina la tabla, creara otra
        sqLiteDatabase.execSQL("DROP TABLE IF EXIST"+TABLE_NAME);
        onCreate(sqLiteDatabase);
    }

}
