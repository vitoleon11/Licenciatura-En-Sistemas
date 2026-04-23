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
package tema2;
import PaqueteLectura.Lector;
public class Prac2Punto4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona[][] mCasting = new Persona[5][8];
        int [] vDimL = new int[5];
        int i;
        for (i = 0;i < 5;i++) {
            vDimL[i]  = 0 ;
        }
        String nombre;
        int DNI;
        int edad;
        int dimL = 0;
        int dia;
        nombre = Lector.leerString();
        while (!nombre.equals("ZZZ") && dimL < 40) {
            dia = Lector.leerInt();
            DNI = Lector.leerInt();
            edad = Lector.leerInt();
            if (vDimL[dia - 1] < 7) {
                vDimL[dia]++;
                mCasting[dia][vDimL[dia]] = new Persona(nombre,DNI,edad);
                dimL++;
            }
            else {
                System.out.println("No hay turnos disponibles en el dia: " + dia);
            }
            nombre = Lector.leerString();
        }
        }
    }
    
