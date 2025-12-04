package parcialtorneos;

/**
 *
 * @author vitol
 */
public class TorneoTenis extends Torneo {
    private int cantJugadores;
    private String tipoCancha;

    
    
    public TorneoTenis(int cantJugadores, String tipoCancha, String nombre, String fechaInicio, double costoIns, double montoPremio) {
        super(nombre, fechaInicio, costoIns, montoPremio);
        this.cantJugadores = cantJugadores;
        this.tipoCancha = tipoCancha;
    }
    
    public double obtenerRecaudacion() {
        return this.cantJugadores * this.getCostoIns();
    }
}
