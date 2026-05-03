package prac5punto1;
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador [] vInvestigadores;
    private int dimL;
    
    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        vInvestigadores = new Investigador[50];
        this.dimL = 0;
    }
    
    public void agregarInvestigador(Investigador inv) {
        vInvestigadores[dimL] = inv;
        dimL++;
    }
    
    public double dineroTotalOtorgado() {
        double total = 0;
        for (int i = 0;i < dimL;i++) {
            total += vInvestigadores[i].devolverMontoSubsidios();
        }
        return total;
    }
    
    public void otorgarTodos(String nombre) {
        int i = 0;
        boolean otorgados = false;
        while (i < dimL && !otorgados) {
            if (vInvestigadores[i].getNombre().equals(nombre)) {
                vInvestigadores[i].otorgarTodos();
                otorgados = true;
            }
            i++;
        }
    }
    
    public String toString() {
        String aux = "Nombre proyecto: " + this.nombre + " codigo: " + codigo + ", nombre director: " + nombreDirector + ", dinero total otorgado"
        + dineroTotalOtorgado() + " \n";
        for (int i = 0; i < dimL;i++) {
            aux += vInvestigadores[i].toString();
        }
        return aux;
    }
    
}
