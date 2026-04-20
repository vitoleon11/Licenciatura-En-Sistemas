package tema1;

import PaqueteLectura.Lector;
public class Prac1Punto5 {

    public static void main(String[] args) {
		double [][] matriz = new double[5][4];
		int i;
		int j;
		for (i = 0;i<5;i++) {
			for (j = 0;j<4;j++) {
				matriz[i][j] = Lector.leerDouble();
			}
		}
		double sumaP;
		for (j = 0;j < 4; j++) {
			sumaP = 0;
			for (i= 0;i< 5; i++) {
				sumaP += matriz[i][j];
			}
			System.out.println("El promedio del aspecto " + (j+1) + " es: " + (sumaP / 5));
		}
		
    }

}
