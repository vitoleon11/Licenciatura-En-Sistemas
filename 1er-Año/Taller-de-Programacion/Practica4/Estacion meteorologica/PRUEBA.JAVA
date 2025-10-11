
package tema4.PUNTO4;


import PaqueteLectura.GeneradorAleatorio;
public class MeteorologiaPrueba {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Anual unAño = new Anual("La Plata",-34.921,57.955,2021,3);
        Mensual unMes = new Mensual("Mar del Plata",-38.002,-57.556,2020,4);
         for (int i= 0;i < unAño.getCantAños();i++){
             for(int j=0; j<12;j++){
                unAño.setTemperatura(j+1, unAño.getAñoInicio()+i,GeneradorAleatorio.generarDouble(100));
             }
        }
        for(int i = 0; i<unMes.getCantAños();i++) {
            for(int j= 0; j<12;j++) {
                unMes.setTemperatura(j+1,unMes.getAñoInicio()+i,GeneradorAleatorio.generarDouble(100));
            }
        }
       System.out.println(unAño.toString());
       System.out.println(unAño.mesYAñoMayorTemp());
       System.out.println(unMes.toString());
       System.out.println(unMes.mesYAñoMayorTemp());
    }
    
}
