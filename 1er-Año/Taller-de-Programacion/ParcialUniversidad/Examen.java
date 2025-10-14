package parcialexamenes;

/**
 *
 * @author vitol
 */
public class Examen {
    private int mes;
    private int año;
    private double calificacion;
    private String modalidad;
    private Alumno infoAlumno;

    
    public int getAño() {
        return año - 2000;
    }

    
    public Alumno getInfoAlumno() {
        return infoAlumno;
    }

    public String getModalidad() {
        return modalidad;
    }

    public double getCalificacion() {
        return calificacion;
    }

    public int getMes() {
        return mes;
    }

    
    
    public Examen(int mes, int año, double calificacion, String modalidad, Alumno infoAlumno) {
        this.mes = mes;
        this.año = año;
        this.calificacion = calificacion;
        this.modalidad = modalidad;
        this.infoAlumno = infoAlumno;
    }
    
    
}
