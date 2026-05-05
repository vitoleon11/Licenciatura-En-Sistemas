
public class Supermercado {
    private String nombre;
    private String direccion;
    private Producto[][] mProductos;
    private int dimL = 0;
    private int cantG;
    private int cantE;
    
    public Supermercado(String nombre, String direccion, int g,int e) {
        this.nombre = nombre;
        this.direccion = direccion;
        mProductos = new Producto[g][e];
        cantG = g;
        cantE = e;
    }
    
    public void registrarProducto(Producto p) {
        mProductos[dimL / cantE][dimL % cantE] = p;
        dimL++;
    }
    
    public String marcaM(String M) {
        String aux = "";
        for (int i = 0; i < cantG;i++) {
            for (int j = 0;j < cantE;j++){
                if (mProductos[i][j].getMarca().equals(M)) {
                    aux += mProductos[i][j].toString();
                }
            }
        }
        return aux;
    }
    
    public int mayorCantidadTotal() {
        int cantUnidades;
        int maxUnidades = -1;
        int maxG = -1;
        for(int i = 0;i < cantG;i++) {
            cantUnidades = 0;
            for (int j = 0;j < cantE;j++){
                cantUnidades += mProductos[i][j].getCantUnidades();
            }
            if (cantUnidades > maxUnidades) {
                maxUnidades = cantUnidades;
                maxG = i+1;
            }
        }
        return maxG;
    }
    
    public String toString(){
        String aux = "Supermercado " + nombre + " direccion: " + direccion + ". \n";
        for (int i = 0; i < cantG;i++) {
            aux += "Gondola: " + (i+1) + "\n";
            for(int j = 0;j < cantE;j++) {
                aux += "Estante: " + (j+1) + "{ " + mProductos[i][j].getCodigo() + " - " + mProductos[i][j].getNombre() + " - " + mProductos[i][j].getCantUnidades() + " - " + mProductos[i][j].getPrecioUnidad()+ "}";
            }
        }
        return aux;
    }
    
}
