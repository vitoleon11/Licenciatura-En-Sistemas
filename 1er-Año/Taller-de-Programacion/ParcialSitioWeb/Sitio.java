package parcial.sitio.web;
public abstract class Sitio {

	private String nombre;
	private String direccionWeb;
	private int cantUsuarios;
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDireccionWeb() {
		return direccionWeb;
	}

	public void setDireccionWeb(String direccionWeb) {
		this.direccionWeb = direccionWeb;
	}

	public int getCantUsuarios() {
		return cantUsuarios;
	}

	public void setCantUsuarios(int cantUsuarios) {
		this.cantUsuarios = cantUsuarios;
	}
	public Sitio(String miNombre,String miDireccion) {
		this.nombre = miNombre;
		this.direccionWeb = miDireccion;
		this.cantUsuarios = 0;
	}
	
	public String toString() {
		String aux = "";
		aux += this.getNombre() +";" + this.getDireccionWeb() + ";" + this.getCantUsuarios() + ";" + this.cotizarSitio();
		return aux;
	}
	
	public abstract double cotizarSitio();
}

