using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ejercicio3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int nota;

            do
            {
                Console.WriteLine("\nIngresa la nota:");
                nota = int.Parse(Console.ReadLine());

                if (nota < 0 || nota > 10)
                {
                    Console.WriteLine("\nERROR! Nota incorrecta, debe ser mayor que 0 y menor que 10");
                }
                else if (nota >= 5)
                {
                    Console.WriteLine("\nAPROBADO");
                }
                else
                {
                    Console.WriteLine("\nSUSPENDIDO");
                }
            } while (nota < 0 || nota > 10);

            Console.ReadKey();
        }
    }
}
