
package tema4.PUNTO4;

public class Estacion {
    private String nombre;
    private double latitud;
    private double longitud;
    private int añoInicio;
    private int cantAños;
    private double temperatura [][];

    public Estacion(String nombre, double latitud, double longitud, int añoInicio, int cantAños) {
        setNombre(nombre);
        setLatitud(latitud);
        setLongitud(longitud);
        setAñoInicio(añoInicio);
        setCantAños(cantAños);
        this.temperatura = new double[cantAños][12];
        for(int i= 0; i<cantAños;i++) {
            for(int j = 0;j<12;j++) {
                this.temperatura[i][j] = 99999;
            }
        }
    }
    
    
    public void setTemperatura(int mes, int año,double temp) {
        this.temperatura[año - getAñoInicio()][mes-1] = temp;
    }

    
    public String toString() {
        return getNombre() + "(" + getLatitud() + "S - " + getLongitud() + " O): \n";
    }
    
    public double getTemperatura(int mes, int año) {
        double aux = this.temperatura[año - getAñoInicio()][mes-1];
        return aux;
    }
    
    public String mesYAñoMayorTemp() {
        double maxTemp = -99999;
        String mensaje = "gork";
        for(int i = 0; i< getCantAños(); i++) {
            for(int j = 0; j<12; j++) {
                if(this.temperatura[i][j] > maxTemp) {
                    maxTemp = this.temperatura[i][j];
                    mensaje = "En el año " + (getAñoInicio()+i) + " en el mes " + (j+1) + " la mayor temperatura fue: " + this.temperatura[i][j];
                } 
            }
        }
        return mensaje;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public int getAñoInicio() {
        return añoInicio;
    }

    public void setAñoInicio(int añoInicio) {
        this.añoInicio = añoInicio;
    }

    public int getCantAños() {
        return cantAños;
    }

    public void setCantAños(int cantAños) {
        this.cantAños = cantAños;
    }

    
    
}
