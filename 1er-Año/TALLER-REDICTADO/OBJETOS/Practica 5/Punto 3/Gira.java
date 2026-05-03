package prac5punto3;
public class Gira extends Recital{
    private String nombreGira;
    private Fecha[] vFechas;
    private int dimL = 0;
    private int fechaActual = 0;

    
    
    public Gira(String nombreGira, String nombreBanda, int cantTemas,int cantFechas ) {
        super(nombreBanda, cantTemas);
        this.nombreGira = nombreGira;
        vFechas = new Fecha[cantFechas];
    }
    
    public void agregarFecha(Fecha f) {
        vFechas[dimL] = f;
        dimL++;
    }
    
    public void actuar(){
        System.out.println("Buenas noches " + vFechas[fechaActual].getCiudad());
        super.actuar();
        fechaActual++;
    }
    
    public double calcularCosto() {
        return 30000 * dimL;
    }
    
}
