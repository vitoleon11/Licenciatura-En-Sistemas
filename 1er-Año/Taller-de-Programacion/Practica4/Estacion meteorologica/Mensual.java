
package tema4.PUNTO4;

public class Mensual extends Estacion {
    

    public Mensual(String nombre, double latitud,double longitud, int añoInicio, int cantAños) {
        super(nombre,latitud,longitud,añoInicio,cantAños);
    }
    
    public double calcularPromedioMensual(int mes) {
        double suma = 0;
        for(int i=0;i < getCantAños();i++) {
            suma += this.getTemperatura(mes, i+ getAñoInicio());
        }
        return suma;
    }
    
    public String toString() {
        String [] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo","Junio","Julio", "Agosto","Septiembre","Octubre","Noviembre", "Diciembre"};
        String aux = super.toString();
        for(int i = 0; i < 12; i++) {
            aux += "- " + meses[i]+": " + calcularPromedioMensual(i + 1) + " °C; \n" ;
        }
        return aux;
    }
}
