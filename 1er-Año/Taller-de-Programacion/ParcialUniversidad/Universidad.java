/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialexamenes;

/**
 *
 * @author vitol
 */
public class Universidad {
    private Examen [][] mExamenes;
    private int cantExamenesMax;
    
    
    
    public Universidad(int miCantExamenesMax) {
        this.cantExamenesMax = miCantExamenesMax;
       this.mExamenes = new Examen[26][this.cantExamenesMax];
    }
    
    
   public void agregarNuevoExamen(Examen miExamen) {
       int i =0 ;
       boolean seAgrego = false;
       while(i < this.cantExamenesMax && !seAgrego) {
           if (this.mExamenes[miExamen.getAño()][i] == null) {
                this.mExamenes[miExamen.getAño()][i] = miExamen;
                seAgrego = true;
           }
           i++;
       }
    }
   
   public int devolverCantExamenes(String legajo,int año) { 
       int contador = 0 ;
       for(int i = 0; i < this.cantExamenesMax; i++) {
           if(this.mExamenes[año - 2000][i] != null && this.mExamenes[año-2000][i].getInfoAlumno().getLegajo().equals(legajo)) {
               contador++;
           }
       }
       return contador;
   }
   public int devolverCantMayorExamenes(String modalidad) {
       int contador = 0;
       int mayorAño = 0;
       int maximo = -999;
       for(int i =0 ; i < 26; i++ ) {
           for(int j =0; j < this.cantExamenesMax; j++) {
                if(this.mExamenes[i][j] != null && this.mExamenes[i][j].getModalidad().equals(modalidad)) {
                    contador++;
                }
               }
            if(contador > maximo) {
                maximo = contador;
                mayorAño = i + 2000;
            }
            contador = 0;
       }
       return mayorAño;
   }
    public String mayoresCalificaciones(double calificacion) {
        String aux = "";
        for(int i = 0; i < 26; i++) {
            for(int j = 0; j < this.cantExamenesMax;j++) {
                if (this.mExamenes[i][j] != null && this.mExamenes[i][j].getCalificacion() > calificacion){
                    aux += "Nombre: " + this.mExamenes[i][j].getInfoAlumno().getNombre() + " Apellido: " + this.mExamenes[i][j].getInfoAlumno().getApellido() + " Legajo: " + this.mExamenes[i][j].getInfoAlumno().getLegajo() + " Mes: " + this.mExamenes[i][j].getMes() + " Año: " + this.mExamenes[i][j].getAño() + " Calificacion: " + this.mExamenes[i][j].getCalificacion()+ "\n";
                    
                }
            }
        }
        return aux;
    }
}
