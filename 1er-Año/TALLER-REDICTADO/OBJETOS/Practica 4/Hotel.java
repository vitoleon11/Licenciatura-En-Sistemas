
package tema3;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author vitol
 */
public class Hotel {
    private Habitacion[] vHabitaciones;
    private int dimF;
    
    public Hotel(int n) {
        vHabitaciones = new Habitacion[n];
        dimF = n;
        for (int i = 0;i<n;i++) {
            vHabitaciones[i] = new Habitacion();
            vHabitaciones[i].setCosto(GeneradorAleatorio.generarDouble(6001) + 2000);
            vHabitaciones[i].setOcupada(false);
        }
    }
    
    public void agregarCliente(Cliente c, int x) {
        vHabitaciones[x-1].setCliente(c);
        vHabitaciones[x-1].setOcupada(true);
    }
    
    public void aumentarCosto(double monto) {
        for (int i =0;i < dimF;i++) {
            vHabitaciones[i].setCosto(vHabitaciones[i].getCosto() + monto);
        }
    }
    
    public String toString() {
        String aux = "";
        for(int i = 0;i < dimF; i++) {
            aux += "Habitacion " + (i+1) + " $" + String.format("%.2f", vHabitaciones[i].getCosto()) + " - ";
            if (vHabitaciones[i].isOcupada()) {
                aux += "Está ocupada por: " + vHabitaciones[i].getCliente().toString() + "\n";
            }
            else {
                aux += "Está libre \n";
            }
        }
        return aux;
    }
    
}
