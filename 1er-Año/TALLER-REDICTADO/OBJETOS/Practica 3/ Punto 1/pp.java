package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author vitol
 */
public class Prac3Punto1 {
    public static void main(String[] args) {
        triangulo t = new triangulo(Lector.leerDouble(),Lector.leerDouble(),Lector.leerDouble(),Lector.leerString(),Lector.leerString());
        System.out.println("El triangulo tiene un perimetro de: " + t.calcularPerimetro()+ "cm, y un area de: " + t.calcularArea()+ " cm.");
    }
    
}
