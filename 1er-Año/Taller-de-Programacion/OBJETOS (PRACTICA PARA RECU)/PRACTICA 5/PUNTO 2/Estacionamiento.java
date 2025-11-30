
package punto2practica5;

/**
 *
 * @author vitol
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private Auto [][] vAutos;
    private int numPisos;
    private int numPlazas;
    
    public Estacionamiento(String miNombre, String miDireccion){
        this.nombre = miNombre;
        this.direccion = miDireccion;
        this.horaApertura = "8:00";
        this.horaCierre = "21:00";
        this.numPisos = 5;
        this.numPlazas = 10;
        vAutos = new Auto[numPisos][numPlazas];
    }
    
    public Estacionamiento(String miNombre, String miDireccion, String miHoraApertura, String miHoraCierre, int miNumPisos,int miNumPlazas) {
        this.nombre = miNombre;
        this.direccion = miDireccion;
        this.horaApertura = miHoraApertura;
        this.horaCierre = miHoraCierre;
        vAutos = new Auto[miNumPisos][miNumPlazas];
        this.numPisos = miNumPisos;
        this.numPlazas = miNumPlazas;
    }
    
    public void agregarAuto(Auto autoA, int X, int Y) {
        this.vAutos[X][Y] = autoA;
    }
    
    public String devolverPorPatente(String miPatente) {
        String aux = "Auto Inexistente";
        for(int i = 0;i < numPisos; i++) {
            for ( int j = 0 ; j < numPlazas; j++) {
                if ((vAutos[i][j].getPatente().equals(miPatente)) && (vAutos[i][j] != null)) {
                    return "El auto está en el piso " + (i+1) + " y en la plaza " + (j+1);
                }
            }
        }
        return "Auto Inexistente";
    }
    
    public int cantAutosPlaza(int Y) {
        int total = 0;
        for (int i= 0; i < numPisos; i++) {
            if (this.vAutos[i][Y] != null) {
                total++;
            }
        }
     return total;
    }
     
    public String toString() {
        String aux = "";
        for(int i = 0; i < numPisos; i++) {
            for ( int j = 0; j < numPlazas; j++) {
                aux += "Piso "+ (i+1) + " Plaza " + (j+1) + ": " ;
                if (this.vAutos[i][j] == null) {
                   aux += "libre \n";
                } else {
                    aux += "Nombre: " + this.vAutos[i][j].getNombreDueño() + " Patente: " + this.vAutos[i][j].getPatente() + "\n";
                }
            }
        }
        return aux;
    }
    
    
    
    
    
}
