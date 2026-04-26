/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
public class Estante {
    private Libro[] vLibros;
    private int dimL;
    
    public Estante() {
        this.vLibros = new Libro[20];
        this.dimL = 0;
    }
    
    
    public int getCantLibros() {
        return this.dimL;
    }
    
    public boolean estaLleno() {
        return dimL == 20;
    }
    
    public void agregarLibro(Libro miLibro) {
        if (!estaLleno()) {
            this.vLibros[dimL] = miLibro;
            this.dimL++;
        }
    }
    
    public Libro devolverLibro(String titulo) {
        int i = 0;
        boolean encontre = false;
        while (i < dimL) {
            if (vLibros[i].getTitulo().equals(titulo)) {
                return vLibros[i];
            }
            i++;
        }
        return null;
    }
    
}
