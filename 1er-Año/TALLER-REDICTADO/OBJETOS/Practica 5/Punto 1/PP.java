package prac5punto1;
public class Prac5Punto1 {
    public static void main(String[] args) {
        Proyecto p = new Proyecto("App para linkedin", 100, "Gonzalo Villarreal");
        Investigador inv1 = new Investigador("Vita Pincha",1,"Informatica");
        Investigador inv2 = new Investigador("Matias Brugo",2, "Peluqueria");
        Investigador inv3 = new Investigador("Tomas Bilba",3,"Marketing");
        Subsidio sub1 = new Subsidio(1500,"Porque si");
        Subsidio sub2 = new Subsidio(2500,"Porque me pinta");
        Subsidio sub3 = new Subsidio(1500,"Porque si");
        Subsidio sub4 = new Subsidio(2500,"Porque me pinta");
        Subsidio sub5 = new Subsidio(1500,"Porque si");
        Subsidio sub6 = new Subsidio(2500,"Porque me pinta");
        p.agregarInvestigador(inv1);
        p.agregarInvestigador(inv2);
        p.agregarInvestigador(inv3);
        inv1.agregarSubsidio(sub1);
        inv1.agregarSubsidio(sub2);
        inv2.agregarSubsidio(sub3);
        inv2.agregarSubsidio(sub4);
        inv3.agregarSubsidio(sub5);
        inv3.agregarSubsidio(sub6);
        p.otorgarTodos("Vita Pincha");
        System.out.println(p);
    }
    
}
