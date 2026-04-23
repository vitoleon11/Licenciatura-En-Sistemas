package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Prac2Punto2 {
    public static void main(String[] args) {
        Persona[] vPersonas = new Persona[15];
        int edad;
        String nombre;
        int DNI;
        int dimL = 0;
        int cant65 = 0;
        int menorDNI = 999;
        Persona pMenor = new Persona();
        pMenor = null;
        edad = GeneradorAleatorio.generarInt(101);
        while (edad != 0 && dimL < 15) {
            nombre = GeneradorAleatorio.generarString(4);
            DNI = GeneradorAleatorio.generarInt(100);
            vPersonas[dimL] = new Persona(nombre,DNI,edad);
            dimL++;
            edad = GeneradorAleatorio.generarInt(101);
        }
        for (int i = 0;i < dimL;i++) {
            if (vPersonas[i].getEdad() > 65) {
                cant65++;
            }
            if (vPersonas[i].getDNI < menorDNI) {
                menorDNI = vPersonas[i].getDNI();
                pMenor = vPersonas[i];
            }
        }
    }
    
}
