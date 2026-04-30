package tema4;
public abstract class Sistema {
    private Estacion est;
    private int anioInicio;
    private int cantAnios;
    private double [][] mTemperaturas;

    public Sistema(Estacion est, int anioInicio, int cantAnios) {
        this.est = est;
        this.anioInicio = anioInicio;
        this.cantAnios = cantAnios;
        mTemperaturas = new double[cantAnios][12];
        for (int i = 0;i < cantAnios;i++) {
            for (int j = 0;j < 12;j++) {
                this.mTemperaturas[i][j] = 9999;
            }
        }
    }
    
    public void registrarTemperatura(int anio,int mes,double temp) {
        this.mTemperaturas[anio-anioInicio][mes-1] = temp;
    }
    
    public double obtenerTemperatura(int anio, int mes) {
        return this.mTemperaturas[anio-anioInicio][mes-1];
       
    }
    
    public String maxTemp() {
        double maxTemp = -1000;
        int maxMes = -1;
        int maxAnio = -1;
        for (int i = 0;i < cantAnios;i++) {
            for (int j = 0;j < 12;j++) {
                if (this.mTemperaturas[i][j] > maxTemp) {
                    maxMes = j+1;
                    maxAnio = i + anioInicio;
                    maxTemp = this.mTemperaturas[i][j];
                }
            }
        }
        return "La mayor temperatura se registro en el año: " + maxAnio + " en el mes " + maxMes + ".";
    }
    
    
    
}


