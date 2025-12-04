



package parcialtorneos;

public class TorneoFutbol extends Torneo {
    private Equipo [] vEquipos;
    private int dimL;
    private int dimF;
    
    public TorneoFutbol(String nombre, String fechaInicio, double costoIns, double montoPremio,int dimF) {
        super(nombre, fechaInicio, costoIns, montoPremio);
        this.dimL = 0;
        this.dimF = 0;
        this.inicializarVector();
    }
    
    public void inicializarVector() {
        for(int i = 0;i < this.dimF ; i++) {
            this.vEquipos[i] = null;
        }
    }
    
    public void agregarEquipo(Equipo miEquipo){
        if (dimL < dimF) {
            this.vEquipos[dimL] = miEquipo;
            dimL++;
        }
    }
    
    public double obtenerRecaudacion(){
        return dimL * 11 * this.getCostoIns();
    }
}
