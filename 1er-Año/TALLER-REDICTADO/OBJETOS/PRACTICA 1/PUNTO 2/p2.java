
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos

import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
         Double[] vector;
        //Paso 3: Crear el vector para 15 double 
        vector = new Double[15];
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double altura;
        int cantJ;
        double sumaAlt;
        double promedio;
        sumaAlt = 0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=0;i < 15;i++) {
            System.out.println("Ingrese altura del jugador" + (i+1));
            altura = Lector.leerDouble();
            vector[i] = altura;
            sumaAlt += altura;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedio = sumaAlt / 15;
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        cantJ = 0;
        for (i = 0;i < 15; i++) {
            if (vector[i] > promedio) {
                cantJ++;
            }
        }
        //Paso 9: Informar la cantidad.
        System.out.println("El promedio es: " + promedio);
        
        System.out.println("La cantidad de jugadores mayores al promedio es: " + cantJ );
    }
    
}
