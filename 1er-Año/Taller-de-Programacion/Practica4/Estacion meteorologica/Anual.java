package tema4.PUNTO4;

/**
 *
 * @author vitol
 */
public class Anual extends Estacion{
    
    
    public Anual(String nombre, double latitud, double longitud, int añoInicio, int cantAños) {
        super(nombre,latitud,longitud,añoInicio,cantAños);
    }
    
    
    public double calcularPromedioAnual(int año){
        double suma = 0;
        for(int i = 0; i < 12; i++) {
            suma += this.getTemperatura(i+1,año);
        }
        return suma/12;
    }
    
    public String toString() {
       String aux = super.toString();
       for( int i = 0; i < this.getCantAños(); i++) {
           aux += "- Año: " + (this.getAñoInicio() + i) +": " + calcularPromedioAnual(this.getAñoInicio()+ i) + "°C; \n";
       }
       return aux;
    }
}
