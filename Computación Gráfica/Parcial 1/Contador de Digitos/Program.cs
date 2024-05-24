using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ejercicio2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Ingresa un número:");
            int num = int.Parse(Console.ReadLine());

            int contadorDigitos = ContarDigitos(num);

            Console.WriteLine("El Número ingresado tiene: "+ contadorDigitos + " digitos");
            Console.ReadKey();
        }

        static int ContarDigitos(int numero)
            {
                int contador = 0;
                while (numero != 0)
                {
                    numero = numero / 10;
                    contador++;
                }
                return contador;
            }
        }
    
}
