"""
    Dilema de las Ocho Reinas en un tablero de ajedrez.
    Este problema lógico indica que se deben colocar en un tablero de ajedrez 8 reinas, de forma
    que ninguna de estas se amenace una a otra. 

    Autor: Ednan Josué Merino Calderón

    Versión: 1.1
"""


def free(fila, columna):
        """ Determina si la casilla fila x columna está libre de amenazas.

        @param fila: Fila
        @param columna: columna
        @return: True si la casilla está libre de amenazas por otras reinas.
        """
        for i in range(8):
            if tablero[fila][i] == '♕' or tablero[i][columna] == '♕':
                return False

        if fila <= columna:
            c = columna - fila
            r = 0
        else:
            r = fila - columna
            c = 0
        while c < 8 and r < 8:
            if tablero[r][c] == '♕':
                return False
            r += 1
            c += 1

        if fila <= columna:
            r = 0
            c = columna + fila
            if c > 7:
                r = c - 7
                c = 7
        else:
            c = 7
            r = fila - (7 - columna)

        while c >= 0 and r < 8:
            if tablero[r][c] == '♕':
                return False
            r += 1
            c -= 1
        return True

def agregar_reina(n):
        """ Agrega n reinas al tablero.
        @param: n Reinas a Agregar
        @return True si se pudo agregar las reinas requeridas
        """
        if n < 1:
            return True
        #Ciclo de "Fors" anidados, donde se genera el algoritmo de imprimir tablero y agregar las reinas
        for idx_fila in range(8):
            for idx_columna in range(8):
                if free(idx_fila, idx_columna):
                    tablero[idx_fila][idx_columna] = '♕'
                    if agregar_reina(n-1):
                        return True
                    else:
                        tablero[idx_fila][idx_columna] = '_'
        return False
tablero = []
for i in range(8):
    #Se imprima un caracter que simula una casilla, para dar una mejor comprensión del tablero
    tablero.append(['_'] * 8)
#Se llama a la función agregar reina y se agregan 8 reinas 
agregar_reina(8)
for fila in tablero:
    #Se imprime el puntero fila
    print(*fila)