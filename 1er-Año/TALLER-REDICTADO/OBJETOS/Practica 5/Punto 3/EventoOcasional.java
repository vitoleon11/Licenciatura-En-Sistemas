
package prac5punto3;
public class EventoOcasional extends Recital{
    private String motivo;
    private String nombreContratante;
    private String dia;

    public EventoOcasional(String motivo, String nombreContratante, String dia, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.dia = dia;
    }
    
    
    public void actuar() {
        if (motivo.equals("Show de Beneficiencia")) {
            System.out.println("Recuerden colaborar con: " + nombreContratante);
        }
        else if (motivo.equals("Show de TV")) {
            System.out.println("Saludos amigos televidentes");
        }
        else  {
            System.out.println("Un feliz cumpleaños para" + nombreContratante);
        }
        super.actuar();
    }
    
    public double calcularCosto() {
        if (motivo.equals("Show de Beneficiencia")) {
            return 0;
        }
        else if (motivo.equals("Show de TV")) {
            return 50000;
        }
        else  {
            return 150000;
        }
    }
}
