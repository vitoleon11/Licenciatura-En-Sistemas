package tema3;
public class Prac3Punto3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estante e = new Estante();
        Autor a1 = new Autor("Juan","Nacio en colombia","Medellin");
        Libro l1 = new Libro("Mujercitas","Puerto de Palos",2024,a1,"43857329845",1050.50);
        Autor a2 = new Autor("Pedro","Nacio en uruguay","montevideo");
        Libro l2 = new Libro("Homero","Puerto de Palos",2022,a2,"43857329845",1050.50);
        Autor a3 = new Autor("Roberto","Nacio en paraguay","asuncion");
        Libro l3 = new Libro("sid campeador","Puerto de Palos",2023,a3,"43857329845",1050.50);
        e.agregarLibro(l1);
        e.agregarLibro(l2);
        e.agregarLibro(l3);
        System.out.println(e.devolverLibro("Mujercitas").getPrimerAutor());
        
    }
    
}
