package tema3;

/**
 *
 * @author vitol
 */
public class Prac3Punto4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Hotel h = new Hotel(10);
        Cliente c1 = new Cliente("Vito",47057111,20);
        Cliente c2 = new Cliente("Matias", 48453765, 18);
        Cliente c3 = new Cliente("Tomas",47326865,19);
        h.agregarCliente(c1, 3);
        h.agregarCliente(c2, 1);
        h.agregarCliente(c3, 9);
        System.out.println(h.toString());
        h.aumentarCosto(3000);
        System.out.println(h.toString());
    }
    
}
