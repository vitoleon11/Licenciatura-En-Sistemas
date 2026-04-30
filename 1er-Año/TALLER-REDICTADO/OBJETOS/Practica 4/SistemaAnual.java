package tema4;

public class SistemaAnual extends Sistema {

    public SistemaAnual(Estacion est, int anioInicio, int cantAnios) {
        super(est, anioInicio, cantAnios);
    }
    
    
    public String toString() {
        String aux = super.getEstacion().getNombre() + " (" + super.getEstacion().getLatitud() + " - " + super.getEstacion().getLongitud() + "): \n";
        for (int i = 0; i < super.getCantAnios(); i++) {
            double suma = 0;
            for (int j = 0; j < 12; j++) {
                suma += super.getTemperaturaMatriz(i,j);
            }
            double promedio = suma / 12.0;
            aux += "- Año " + (i + super.getAnioInicio()) + ": " + promedio + "; \n";
        }
        return aux;
    }
    
}
