package parcial.sitio.web;

public class TorneoProfesional {
	private String nomTorneo;
	private String fecha;
	private double montoRecaudado;
	private double montoPagado;

	public String getNomTorneo() {
		return nomTorneo;
	}

	public void setNomTorneo(String nomTorneo) {
		this.nomTorneo = nomTorneo;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public double getMontoRecaudado() {
		return montoRecaudado;
	}

	public void setMontoRecaudado(double montoRecaudado) {
		this.montoRecaudado = montoRecaudado;
	}

	public double getMontoPagado() {
		return montoPagado;
	}

	public void setMontoPagado(double montoPagado) {
		this.montoPagado = montoPagado;
	}
	
}
