
public class SistemaMeses extends Sistema {

    public SistemaMeses(Estacion est, int anioInicio, int cantAnios) {
        super(est, anioInicio, cantAnios);
    }
    
    public String toString() {
        String aux = super.getEstacion().getNombre() + " (" + super.getEstacion().getLatitud() + " - " + super.getEstacion().getLongitud() + "): \n";
        double suma;
        for (int j = 0; j < 12 ; j++) {
            suma = 0;
            for (int i = 0; i < super.getCantAnios();i++) {
                suma += super.getTemperaturaMatriz(i, j);
            }
            double promedio = suma / super.getCantAnios();
            aux += "- Mes " + (j + 1) + ": " + promedio + "; \n";
        }
        
        return aux;
    }
    
}
