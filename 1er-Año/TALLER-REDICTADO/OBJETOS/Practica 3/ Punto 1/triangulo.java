package tema3;

public class triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String cLinea;
    private String cRelleno;

    public triangulo(double lado1, double lado2, double lado3, String cLinea, String cRelleno) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.cLinea = cLinea;
        this.cRelleno = cRelleno;
    }

    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getcLinea() {
        return cLinea;
    }

    public String getcRelleno() {
        return cRelleno;
    }


    public void setcLinea(String cLinea) {
        this.cLinea = cLinea;
    }

    public void setcRelleno(String cRelleno) {
        this.cRelleno = cRelleno;
    }
    
    public double calcularPerimetro() {
        return this.lado1 + this.lado2 + this.lado3;
    }
    
    public double calcularArea() {
        double s = this.calcularPerimetro() / 2;
        return Math.sqrt(s * (s-this.lado1)*(s-this.lado2) * (s-this.lado3));
    }
}
