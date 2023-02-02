#pragma once
#include <stdlib.h>
#include <cstdlib>
#include <iostream>
#include <functional>

template<class T>
class vector 
{
public:
	vector();
	void agregar(T valor);
	T obtener(int indice);
	int obtenerTamano();
	void rellenar(int n, std::function<T()>generador);
	void ordenar(std::function<bool(T a, T b)>comparador);
	void recorrer(std::function<void(T elemento)>iterador);
	T* begin();
	T* end();
private:
	T* dato = nullptr;
	int tamano{ 0 };
};

template<class T>
vector<T>::vector() 
{
	dato = (T*)malloc(0);
}

template<class T>
void vector<T>::agregar(T valor) 
{
	dato = (T*)realloc(dato, sizeof(T) * tamano + 1);
	*(dato + tamano-1) = valor;
	tamano++;
}

template<class T>
T vector<T>::obtener(int indice)
{
	return *(dato + indice);
}

template<class T>
int vector<T>::obtenerTamano()
{
	return tamano;
}

template<class T>
void vector<T>::rellenar(int n, std::function<T()>generador)
{
	for (int i = 0; i < n; i++) 
	{
		int valor = generador();
		agregar(valor);
	}
}

template<class T>
void vector<T>::ordenar(std::function<bool(T a, T b)>comparador) 
{
	for (int i = 0; i < tamano-1;i++) 
	{
		for (int j = 0; j < tamano-1; j++)
		{
			T a = *(dato + i);
			T b = *(dato + j);
			if (comparador(a, b)) {
				*(dato + i) = b;
				*(dato + j) = a;
			}
		}
	}
}

template <class T>
void vector<T>::recorrer(std::function<void(T elemento)>iterador) 
{
	for (int i=0;i<tamano; i++) 
	{
		T valor = *(dato + 1);
		iterador(valor);
	}
}

template <class T>
T* vector<T>::begin() 
{
	return dato;
}

template <class T>
T* vector<T>::end()
{
	return (dato+tamano-1);
}