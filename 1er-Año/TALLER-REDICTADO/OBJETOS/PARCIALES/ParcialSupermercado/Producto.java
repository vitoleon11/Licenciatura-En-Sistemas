
public class Producto {
    private int codigo;
    private String nombre;
    private String marca;
    private int cantUnidades;
    private double precioUnidad;

    public Producto(int codigo, String nombre, String marca, int cantUnidades, double precioUnidad) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.marca = marca;
        this.cantUnidades = cantUnidades;
        this.precioUnidad = precioUnidad;
    }

    @Override
    public String toString() {
        return "Producto{" + codigo + " - " + nombre + " - " + marca + " - " + cantUnidades + " - " + precioUnidad + "} \n";
    }

    public int getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public double getPrecioUnidad() {
        return precioUnidad;
    }

    public int getCantUnidades() {
        return cantUnidades;
    }

    public String getMarca() {
        return marca;
    }
    
    
    
}
