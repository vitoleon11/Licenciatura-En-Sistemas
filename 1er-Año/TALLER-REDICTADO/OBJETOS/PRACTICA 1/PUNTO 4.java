
package tema1;

/**
 *
 * @author vitol
 */
import PaqueteLectura.GeneradorAleatorio;
public class Ej04edificio {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int[][] edificio = new int[8][4];
        int piso;
        int ofi;
        for (piso=0;piso<8;piso++) {
            for(ofi=0;ofi<4;ofi++) {
                edificio[piso][ofi] = 0;
            }
        }
        GeneradorAleatorio.iniciar();
        piso = GeneradorAleatorio.generarInt(9);
        ofi = GeneradorAleatorio.generarInt(4);
        System.out.println("Piso: " + piso + " oficina " + ofi);
        while (piso != 8) {
            edificio[piso][ofi]++;
            piso = GeneradorAleatorio.generarInt(9);
            ofi = GeneradorAleatorio.generarInt(4);
            System.out.println("Piso: " + piso + " oficina " + ofi);
        }
        for (piso=0;piso<8;piso++) {
            System.out.println("-----------------");
            for(ofi=0;ofi<4;ofi++) {
                System.out.print(edificio[piso][ofi]+ " | ");
            }
        }
    }
    
}
