
package punto2practica5;
import PaqueteLectura.Lector;
/**
 *
 * @author vitol
 */
public class Punto2Practica5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacionamiento e1 = new Estacionamiento("Polla","Negra","8:00","15:00",3,3);
        Auto a1 = new Auto("Emiliano","AC200CJ");
        Auto a2 = new Auto("Matias","OVF345");
        Auto a3 = new Auto("Vito", "NIV231");
        Auto a4 = new Auto("Alan","MAL066");
        Auto a5 = new Auto("Hector","AD137QF");
        Auto a6 = new Auto("Maga","JPQ635");
        e1.agregarAuto(a1, 0, 0);
        e1.agregarAuto(a2, 0, 1);
        e1.agregarAuto(a3, 1, 2);
        e1.agregarAuto(a4, 2, 0);
        e1.agregarAuto(a5, 2, 1);
        e1.agregarAuto(a6, 2, 2);
        System.out.println(e1.toString());
        System.out.println(e1.cantAutosPlaza(1));
        String patente = Lector.leerString();
        System.out.println(e1.devolverPorPatente(patente));
    }
    
}
