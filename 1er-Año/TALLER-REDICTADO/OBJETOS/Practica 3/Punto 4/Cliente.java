public class Cliente {
    private String nombre;
    private int DNI;
    private int edad;

    public Cliente(String nombre, int DNI, int edad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
    }

    @Override
    public String toString() {
        return nombre + ", DNI: " + DNI + ", tiene " + edad + " años.";
    }
    
}
