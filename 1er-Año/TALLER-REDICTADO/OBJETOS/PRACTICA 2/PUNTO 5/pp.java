package tema2;
import PaqueteLectura.Lector;
public class Prac2Punto5 {
    
    public static void main(String[] args) {
        Partido[] vPartidos = new Partido[20];
        String local;
        String visitante;
        int gLocal;
        int gVisitante;
        int dimL = 0;
        visitante = Lector.leerString();
        while (!visitante.equals("ZZZ") && dimL < 20) {
            local = Lector.leerString();
            gLocal = Lector.leerInt();
            gVisitante = Lector.leerInt();
            vPartidos[dimL] = new Partido(local,visitante,gLocal,gVisitante);
            dimL++;
            visitante = Lector.leerString();
        }
        int cantRiver = 0;
        int cantGolesBoca = 0;
        for (int i = 0;i < dimL;i++) {
            System.out.println(vPartidos[i].getLocal() + "-Local " + vPartidos[i].getGolesLocal() + " VS " + vPartidos[i].getVisitante() + "-VISITANTE " + vPartidos[i].getGolesVisitante());
            if (vPartidos[i].getGanador().equals("River")) {
                cantRiver++;
            }
            if (vPartidos[i].getLocal().equals("Boca")) {
                cantGolesBoca += vPartidos[i].getGolesLocal();
            }
        }
    }
    
}
