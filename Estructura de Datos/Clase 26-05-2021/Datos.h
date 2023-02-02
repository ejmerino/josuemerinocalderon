/***********************************************************************
 * Module:  Datos.h
 * Author:  JOSUE
 * Modified: Wednesday, May 26, 2021 5:08:25 PM
 * Purpose: Declaration of the class Datos
 ***********************************************************************/

#if !defined(__Class_Diagram_2_Datos_h)
#define __Class_Diagram_2_Datos_h

class Data
{
public:
   float getData(void);
   void setData(float newDato);
   int getData(void);
   void setData(int newValor);
   Data(int valorNuevo, float datoNuevo);
   ~Data();

protected:
private:
   float data;
   int value;


};

#endif
