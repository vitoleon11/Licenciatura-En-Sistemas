package prac5punto3;
public abstract class Recital {
    private String nombreBanda;
    private String [] vTemas;
    private int dimL;
    
    public Recital(String nombreBanda, int cantTemas) {
        this.nombreBanda = nombreBanda;
        vTemas = new String[cantTemas];
        dimL = 0;
    }
    
    public void agregarTema(String nombre) {
        vTemas[dimL] = nombre;
        dimL++;
    }
    
    public void actuar() {
        for (int i = 0; i < dimL;i++) {
            System.out.println("Y ahora tocaremos " + vTemas[i]);
        }
    }
    
    public abstract double calcularCosto();
}
