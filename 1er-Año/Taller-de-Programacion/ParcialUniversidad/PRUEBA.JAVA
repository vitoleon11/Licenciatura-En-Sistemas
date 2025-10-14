package parcialexamenes;

/**
 *
 * @author vitol
 */
import PaqueteLectura.Lector;
public class ParcialExamenes {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Universidad uni = new Universidad(200);
        Alumno A1 = new Alumno("Vito","Montesi","43/36356");
        Examen ex1 = new Examen(10,2003,6.5,"Oral",A1);
        Alumno A2 = new Alumno("Vito","Montesi","43/36356");
        Examen ex2 = new Examen(10,2002,6.5,"Escrito",A2);
        Alumno A3 = new Alumno("Vito","Montesi","43/36356");
        Examen ex3 = new Examen(10,2024,8,"Escrito",A3);
        Alumno A4= new Alumno("Vito","Montesi","43/36356");
        Examen ex4 = new Examen(10,2003,8,"Oral",A4);
        uni.agregarNuevoExamen(ex1);
        uni.agregarNuevoExamen(ex2);
        uni.agregarNuevoExamen(ex3);
        uni.agregarNuevoExamen(ex4);
        System.out.println("La cantidad de examenes del alumno Vito en el año 2003 fue :"
                + uni.devolverCantExamenes(Lector.leerString(),Lector.leerInt()));
        System.out.println("El año con mayor cantidad de examenes escritos fue: " +uni.devolverCantMayorExamenes("Ëscrito"));
        System.out.println("Informacion de examenes con mayor a 7: \n "+ uni.mayoresCalificaciones(7));
        
    }
    
}
