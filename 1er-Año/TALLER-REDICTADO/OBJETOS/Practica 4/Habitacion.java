
package tema3;

/**
 *
 * @author vitol
 */
public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Cliente cliente;
    
    public void setCosto(double costo) {
        this.costo = costo;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public double getCosto() {
        return costo;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public Cliente getCliente() {
        return cliente;
    }
    
    
}
