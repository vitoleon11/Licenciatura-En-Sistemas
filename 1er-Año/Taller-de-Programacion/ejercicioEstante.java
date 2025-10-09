 */
package tema3;

/**
 *
 * @author vitol
 */
public class Estante {
    private Libro [] estante = new Libro[20];
    
    
    
    
    public Estante() {
        estante = new Libro[20];
}
    
    public int librosAlmacenados(int cantidad) {
        
    }

    public Libro[] getEstante() {
        return estante;
    }

    public void setEstante(Libro[] estante) {
        this.estante = estante;
    }
}
