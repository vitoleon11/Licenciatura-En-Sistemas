package tema4;

public class SistemaAnual extends Sistema {

    public SistemaAnual(Estacion est, int anioInicio, int cantAnios) {
        super(est, anioInicio, cantAnios);
    }
    
    public String toSring() {
        String aux = "";
        for (int i = 0; i < super.getCantAnios(); i++) {
            double suma = 0;

            for (int j = 0; j < 12; j++) {
                suma += this.mTemperaturas[i][j];
            }

            double promedio = suma / 12.0;

            sb.append("- Año ")
              .append(anioInicio + i)
              .append(": ")
              .append(formatearTemp(promedio))
              .append(" ºC;\n");
        }

    }
    
}
