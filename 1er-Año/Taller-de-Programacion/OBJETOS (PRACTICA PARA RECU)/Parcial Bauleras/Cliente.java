l
 */
public class Cliente {
    private int DNI;
    private String nombre;
    private int telefono;
    private String localidad;
    private boolean seguroAd;

    public int getDNI() {
        return DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public int getTelefono() {
        return telefono;
    }

    public String getLocalidad() {
        return localidad;
    }

    public boolean isSeguroAd() {
        return seguroAd;
    }

    public Cliente(int DNI, String nombre, int telefono, String localidad, boolean seguroAd) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.telefono = telefono;
        this.localidad = localidad;
        this.seguroAd = seguroAd;
    }
    
}
