package tema4;

/**
 *
 * @author vitol
 */
public class Triangulo extends Figura{
    private double ladoA;
    private double ladoB;
    private double ladoC;
    
    
    public Triangulo(double miladoA,double miladoB, double miladoC,String colorR,String colorL) {
        super(colorR,colorL);
        setLadoA(miladoA);
        setLadoB(miladoB);
        setLadoC(miladoC);
       
    }
    public double calcularPerimetro() {
        return (ladoA + ladoB + ladoC);
    } 
    public double calcularArea() {
        double s = (getLadoA() + getLadoB() + getLadoC()) / 2;
        return Math.sqrt(s*(s-getLadoA())*(s-getLadoB())*(s-getLadoC()));
    }

    @Override
    public String toString(){
        String aux = super.toString();
        return "Triangulo{" + "ladoA=" + ladoA + 
                ", ladoB=" + ladoB + 
                ", ladoC=" + ladoC + aux;
    }
    
    public double getLadoA() {
        return ladoA;
    }

    public void setLadoA(double ladoA) {
        this.ladoA = ladoA;
    }

    public double getLadoB() {
        return ladoB;
    }

    public void setLadoB(double ladoB) {
        this.ladoB = ladoB;
    }

    public double getLadoC() {
        return ladoC;
    }

    public void setLadoC(double ladoC) {
        this.ladoC = ladoC;
    }
}
