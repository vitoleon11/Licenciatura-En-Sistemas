public class Circulo extends Figura {
    private double radio;
    
    public Circulo(double miRadio, String colorR,String colorL){
        super(colorR,colorL);
        setRadio(miRadio);
    }

    public double getRadio() {
        return radio;
    }
    public String toString() {
        String aux = super.toString() + 
        " el radio del circulo es " + getRadio();
        return aux;
    }
    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularArea() {
        return Math.PI * Math.pow(getRadio(), 2);
    }
    public double calcularPerimetro() {
        return 2 * Math.PI * getRadio();
    }
}
