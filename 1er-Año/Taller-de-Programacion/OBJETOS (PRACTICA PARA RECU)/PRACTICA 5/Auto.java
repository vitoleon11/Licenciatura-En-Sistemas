
package punto2practica5;

/**
 *
 * @author vitol
 */
public class Auto {
    private String nombreDueño;
    private String patente;

    public Auto(String miNombreDueño,String miPatente) {
        this.nombreDueño = miNombreDueño;
        this.patente = miPatente;
    }

    
    
    public String getNombreDueño() {
        return nombreDueño;
    }
    
    public String getPatente() {
        return patente;
    }
}
