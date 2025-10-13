package parcial.sitio.web;

public class SitioAmateur extends Sitio {
	private int cantTorneos;
	private int clicks;

	public int getCantTorneos() {
		return cantTorneos;
	}

	public void setCantTorneos(int cantTorneos) {
		this.cantTorneos = cantTorneos;
	}

	public int getClicks() {
		return clicks;
	}

	public void setClicks(int clicks) {
		this.clicks = clicks;
	}
	
	
	
	
	
	public SitioAmateur(String miNombre, String miDireccion) {
		super(miNombre, miDireccion);
		this.cantTorneos = 0;
		this.clicks = 0;
	}
	
	public void registrarTorneoAmateur(int cantClicks) {
		this.clicks += cantClicks;
		this.cantTorneos++;
	}
	
	public double cotizarSitio() {
		double cantTotal = 0;
		cantTotal += 10 * this.clicks;
		cantTotal += 50 * super.getCantUsuarios();
		return cantTotal;
	}
	
	
}
