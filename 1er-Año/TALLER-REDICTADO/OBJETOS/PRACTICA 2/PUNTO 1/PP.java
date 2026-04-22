package tema2;

import PaqueteLectura.Lector;


public class Prac2punto1 {

    public static void main(String[] args) {
        Persona p = new Persona();
        p.setDNI(Lector.leerInt());
        p.setEdad(Lector.leerInt());
        p.setNombre(Lector.leerString());
        System.out.println(p.toString());
    }
    
}
