

package parcialtorneos;



public abstract class Torneo {
    private String nombre;
    private String fechaInicio;
    private double costoIns;
    private double montoPremio;

    public Torneo(String nombre, String fechaInicio, double costoIns, double montoPremio) {
        this.nombre = nombre;
        this.fechaInicio = fechaInicio;
        this.costoIns = costoIns;
        this.montoPremio = montoPremio;
    }
    
    public double getCostoIns() {
        return costoIns;
    }
    
    public boolean esViable() {
        return this.obtenerRecaudacion() > this.montoPremio * 2;
    }
            
    public String toSring() {
        String aux = "Nombre del torneo: " + this.nombre + ", Fecha: " + this.fechaInicio + ", Monto a otorgar: " + this.montoPremio + "\n Recaudación: " + this.obtenerRecaudacion() + " Es viable: " + this.esViable();
        return aux;
    }       
            
    public abstract double obtenerRecaudacion();
}
