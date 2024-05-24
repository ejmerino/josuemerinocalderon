using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ejercicio1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int numero = 10;
            double precio = 10.90;
            string nombre = "Josue";
            bool esVerdadero = false;
            char letra = 'A';

            if (numero > 10)
            {
                Console.WriteLine("Hola Mundo");
            }
            else
            {
                Console.WriteLine("Chao");
            }

            for (int i = 0; i < numero; i++)
            {
                Console.WriteLine("Hola: " + nombre);
            }

            Console.WriteLine("Ingresa un número:");
            int num = int.Parse(Console.ReadLine());

            //Ciclio While
            int contador = 0;
            while(contador < num)
            {
                Console.WriteLine("Contador: " + contador);
                contador++;
            }
            Console.ReadKey();
        }
    }
}
