
public class Empresa {
    private String nombre;
    private String direccion;
    private double costoPorMes;
    private Cliente [][] mClientes;
    private int cantClientes;
    private int cantSectoresMax;
    private int cantBaulerasMax;
    
    public Empresa(String miNombre,String miDireccion,double miCosto,int miCantSectoresMax,int miCantBaulerasMax) {
        this.nombre = miNombre;
        this.direccion = miDireccion;
        this.costoPorMes = miCosto;
        this.mClientes = new Cliente[miCantSectoresMax][miCantBaulerasMax];
        this.cantSectoresMax = miCantSectoresMax;
        this.cantBaulerasMax = miCantBaulerasMax;
        this.cantClientes = 0;
        this.inicializarMatriz();
    }
    
    private void inicializarMatriz() {
        for(int i = 0; i < this.cantSectoresMax;i++) {
            for (int j = 0;j < this.cantBaulerasMax; j++) {
                this.mClientes[i][j] = null;
            }
        }
    }
    
    public void agregarCliente(Cliente c) {
        if (this.cantClientes < this.cantSectoresMax * this.cantBaulerasMax) {
            int s = this.cantClientes / this.cantBaulerasMax;
            int b = this.cantClientes % this.cantBaulerasMax;
            this.mClientes[s][b] = c;
            this.cantClientes++;
        }
    }
    
    public String clientesHornos(int sectorX) {
        String aux = "";
        int b = this.cantClientes % this.cantBaulerasMax;
        for(int i = 0; i < b; i++) {
            if (this.mClientes[sectorX-1][i].getLocalidad().equals("Los Hornos")) {
                aux += "Dni :" + this.mClientes[sectorX-1][i].getDNI() + " nombre: " + this.mClientes[sectorX-1][i].getNombre() + " telefono: " + this.mClientes[sectorX-1][i].getTelefono() + " localidad: " + this.mClientes[sectorX-1][i].getLocalidad() + " asegurado : " + this.mClientes[sectorX-1][i].isSeguroAd() + "\n" ;
            }
        }
        return aux;
    }
    
    
    public int sectorMasClientes() {
        int s = this.cantClientes / this.cantBaulerasMax;
        int b = this.cantClientes % this.cantBaulerasMax;
        int maxSector = -1;
        int maxClientes = -1;
        int maxClientesActual = 0;
        for (int i = 0; i < s; i++) {
            for(int j = 0; j < b ; j++) {
                if (this.mClientes[i][j].isSeguroAd()) {
                    maxClientesActual++;
                }
            }
            if (maxClientesActual > maxClientes){
                maxSector = i;
                maxClientes = maxClientesActual;
            }
            maxClientesActual = 0;
        }
        return maxSector;
    }
    
    public String toString() {
        String aux = "Empresa: " + this.nombre + "- " + this.direccion + ";" + this.costoPorMes + "\n";
        for (int i = 0; i < this.cantSectoresMax ; i++) {
            aux += "Sector " + (i+1) + ": \n";
            for (int j = 0 ; j < this.cantBaulerasMax ; j++) {
                int cant = i * this.cantBaulerasMax + j;
                if (cant < this.cantClientes) {
                    aux += "Baulera " + (j+1) + ":" + this.mClientes[i][j].getDNI() + " nombre: " + this.mClientes[i][j].getNombre() + " telefono: " + this.mClientes[i][j].getTelefono() + " localidad: " + this.mClientes[i][j].getLocalidad() + " asegurado : " + this.mClientes[i][j].isSeguroAd() + " \n";
                }
            }
        }
        return aux;
    }
    
}
