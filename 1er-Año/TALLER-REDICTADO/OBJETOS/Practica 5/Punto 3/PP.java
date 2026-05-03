package prac5punto3;
public class Prac5Punto3 {
    public static void main(String[] args) {
        EventoOcasional EO = new EventoOcasional("Privado","Marquitos","10/11/2026","Megadeth",3);
        Gira g = new Gira("Live 25","Oasis",3,2);
        EO.agregarTema("She Wolf");
        EO.agregarTema("Holy Wars");
        EO.agregarTema("Symphony of Destruction");
        g.agregarTema("Live Forever");
        g.agregarTema("I Hope I Think I Know");
        g.agregarTema("Go Let It Out");
        Fecha f1 = new Fecha("Buenos Aires", "15/11/2025");
        Fecha f2 = new Fecha("La Plata", "16/11/2025");
        g.agregarFecha(f1);
        g.agregarFecha(f2);
        System.out.println("Costo de evento: " + EO.calcularCosto());
        System.out.println("Costo de gira: " + g.calcularCosto());
        EO.actuar();
        g.actuar();
        g.actuar();
    }
}
