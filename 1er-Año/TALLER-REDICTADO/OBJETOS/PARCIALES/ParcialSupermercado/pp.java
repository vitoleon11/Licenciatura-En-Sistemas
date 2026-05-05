public class PPrincipal {
    public static void main(String[] args) {
        Supermercado s = new Supermercado("Nini", "520",2,2);
        Producto p1 = new Producto(101, "Salchichas", "Vienna", 30, 2500);
        Producto p2 = new Producto(102, "Pan", "Bimbo", 50, 3000);
        Producto p3 = new Producto(103, "Chupetin", "Pop", 100, 300);
        Producto p4 = new Producto(104, "Alfajor", "Milka", 20, 2000);
        s.registrarProducto(p1);
        s.registrarProducto(p2);
        s.registrarProducto(p3);
        s.registrarProducto(p4);
        System.out.println(s);
    }
    
}
