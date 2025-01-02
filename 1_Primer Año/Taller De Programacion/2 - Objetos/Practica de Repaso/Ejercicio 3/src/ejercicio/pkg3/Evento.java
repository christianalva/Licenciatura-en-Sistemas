
package ejercicio.pkg3;

public class Evento extends Recitales{
	private String motivo;
	private String contratante;
	private String diaEvento;
	
    public Evento(String nombreBanda, int cantTemas, String motivo, String contratante, String diaEvento){
        super(nombreBanda, cantTemas);
        this.motivo = motivo;
	this.contratante = contratante;
	this.diaEvento = diaEvento;
    }
    
    public String actuar(){
        String aux = "";
        if(this.getMotivo().equalsIgnoreCase("show de beneficencia")){
            aux += "Recuerden colaborar con: " + this.getContratante();
            aux += super.actuar() + "\n" ;
        } else if(this.getMotivo().equalsIgnoreCase("show de TV")){
            aux += "Saludos amigos televidentes.";
            aux += super.actuar() + "\n" ;
        } else if(this.getMotivo().equalsIgnoreCase("show privado")){
            aux += "Un feliz cumpleaños para: " + this.getContratante();
            aux += super.actuar() + "\n" ;
        }
        return aux;
        
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }
        
        
	
	
    public double calcularCosto(){
        double aux = 0;
        if(this.getMotivo().equalsIgnoreCase("show de beneficencia")){
            aux = 0;
        } else if(this.getMotivo().equalsIgnoreCase("show de TV")){
            aux = 50000;
        } else if(this.getMotivo().equalsIgnoreCase("show privado")){
           aux = 150000;
        }
        return aux ;
    }
}
