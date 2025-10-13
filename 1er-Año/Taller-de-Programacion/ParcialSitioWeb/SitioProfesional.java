package parcial.sitio.web;
public class SitioProfesional extends Sitio{
	private TorneoProfesional [] vTorneos;
	private int cantTorneosPro;
	private int cantMaxTorneos;
	
	
	public SitioProfesional(String miNombre, String miDireccion, int cantMax) {
		super(miNombre,miDireccion);
		this.cantMaxTorneos = cantMax;
		this.vTorneos = new TorneoProfesional[this.cantMaxTorneos];
		this.cantTorneosPro = 0;
	}

	public TorneoProfesional[] getvTorneos() {
		return vTorneos;
	}

	public void setvTorneos(TorneoProfesional[] vTorneos) {
		this.vTorneos = vTorneos;
	}

	public int getCantTorneosPro() {
		return cantTorneosPro;
	}

	public void setCantTorneosPro(int cantTorneosPro) {
		this.cantTorneosPro = cantTorneosPro;
	}

	public int getCantMaxTorneos() {
		return cantMaxTorneos;
	}

	public void setCantMaxTorneos(int cantMaxTorneos) {
		this.cantMaxTorneos = cantMaxTorneos;
	}
	
	public void agregarAlVector(TorneoProfesional torneo) {
		vTorneos[cantTorneosPro] = torneo;
	}
	
	public boolean registrarTorneoProfesional(TorneoProfesional torneo) {
		boolean aux = false;
		if (this.cantTorneosPro < this.cantMaxTorneos) {
			agregarAlVector(torneo);
			aux = true;
			this.cantTorneosPro++;
		}
	return aux;
	}
	
	public double contarRecaudacion(){
		double recaudacion = 0;
		for(int i = 0; i < cantTorneosPro;i++) {
			recaudacion += (vTorneos[i].getMontoRecaudado() - vTorneos[i].getMontoPagado());
		}
		return recaudacion;
	}
	
	public double cotizarSitio() {
		double cantTotal = 0;
		cantTotal += 1000 * cantTorneosPro;
		cantTotal += contarRecaudacion();
		return cantTotal;
	}
	
}
