/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author leon.montesi
 */
import PaqueteLectura.Lector;
public class Prac2Punto3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona[][] mCasting = new Persona[5][8];
        String nombre;
        int DNI;
        int edad;
        int dimL = 0;
        nombre = Lector.leerString();
        while (!nombre.equals("ZZZ")) {
            DNI = Lector.leerInt();
            edad = Lector.leerInt();
            mCasting[dimL / 8][dimL % 8] = new Persona(nombre,DNI,edad);
            dimL++;
            nombre = Lector.leerString();
        }
        int fila;
        int col;
        for(int i = 0;i < dimL;i++) {
            fila = i / 8;
            col = i % 8;
            System.out.println(mCasting[fila][col].toString() + " \n ");
        }
    }
    
}
