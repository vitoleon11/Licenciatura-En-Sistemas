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
public class Prac2Punto4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona[][] mCasting = new Persona[5][8];
        String nombre;
        int DNI;
        int edad;
        int dimL = 0;
        int dia;
        int i;
        boolean agregue;
        nombre = Lector.leerString();
        while (!nombre.equals("ZZZ") && dimL < 40) {
            dia = Lector.leerInt();
            DNI = Lector.leerInt();
            edad = Lector.leerInt();
            i = 0;
            agregue = false;
            while (i < 8 && !agregue) {
                if(mCasting[dia][i] == null) {
                    mCasting[dia][i] = new Persona(nombre,DNI,edad);
                    agregue = true;
                    dimL++;
                }
                else {
                    i++;
                }
            }
            nombre = Lector.leerString();
        }
        }
    }
    
