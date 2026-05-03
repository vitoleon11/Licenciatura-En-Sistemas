package prac5punto1;

/**
 *
 * @author vitol
 */
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio [] vSubsidios;
    private int dimL;
    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        vSubsidios = new Subsidio[5];
        dimL = 0;
    }
    
    public void agregarSubsidio(Subsidio sub) {
        vSubsidios[dimL] = sub;
        dimL++;
    }
    
    
    
    public double devolverMontoSubsidios() {
        double total = 0;
        for (int i = 0; i < dimL ; i++) {
            if (vSubsidios[i].isOtorgado()) {
                total += vSubsidios[i].getMonto();
            }
        }
        return total;
    }
    
    public void otorgarTodos(){ 
        for (int i = 0; i < dimL;i++) {
            if (!vSubsidios[i].isOtorgado()) {
                vSubsidios[i].setOtorgado(true);
            }
        }
    }
    
    

    public String getNombre() {
        return nombre;
    }

    @Override
    public String toString() {
        return "Investigador: " + nombre + ", categoria: " + categoria + ", especialidad " + especialidad + " total dinero subsidios: " + devolverMontoSubsidios() + " \n";
    }
    
}
