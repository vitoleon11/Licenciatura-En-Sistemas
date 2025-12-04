
package parcialtorneos;
public class ParcialTorneos {
    public static void main(String[] args) {
        
        TorneoFutbol TF = new TorneoFutbol("Mi polla negra","1/1/2026",10000,500000,5);
        
        TorneoTenis TT = new TorneoTenis(10,"Grande como el culo de mi novia","Clara Vazquez ATP","1/3/2026",20000,1000000);
        
        Equipo e1 = new Equipo("Estudiantes","La Plata","Dominguez");
        Equipo e2 = new Equipo("Boca","La Boca","Bianchi");
        Equipo e3 = new Equipo("Racing","Avellaneda","Costas");
        TF.agregarEquipo(e1);
        TF.agregarEquipo(e2);
        TF.agregarEquipo(e3);
        System.out.println(TF.toSring());
        System.out.println(TT.toSring());
    }
}
