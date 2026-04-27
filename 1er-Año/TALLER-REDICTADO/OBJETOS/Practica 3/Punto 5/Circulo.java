package tema3;

/**
 *
 * @author vitol
 */
public class Circulo {
    private double radio;
    private String cRelleno;
    private String cLinea;

    public Circulo(double radio, String cRelleno, String cLinea) {
        this.radio = radio;
        this.cRelleno = cRelleno;
        this.cLinea = cLinea;
    }

    public double getRadio() {
        return radio;
    }

    public String getcRelleno() {
        return cRelleno;
    }

    public String getcLinea() {
        return cLinea;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setcRelleno(String cRelleno) {
        this.cRelleno = cRelleno;
    }

    public void setcLinea(String cLinea) {
        this.cLinea = cLinea;
    }
    
    public double calcularPerimetro() {
        return 2 * this.radio * Math.PI;
    }
    
    public double calcularArea() {
        return Math.PI * (this.radio * this.radio);
    }
    
}
