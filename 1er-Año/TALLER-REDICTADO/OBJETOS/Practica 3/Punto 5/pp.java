package tema3;

/**
 *
 * @author vitol
 */
public class Prac3Punto5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Circulo c = new Circulo(5,"rojo","blanco");
        System.out.println("Perimetro: " + c.calcularPerimetro()+ ", area:" + c.calcularArea() + ".");
    }
    
}
