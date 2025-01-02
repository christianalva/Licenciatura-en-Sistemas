
package ejercicio.pkg3;

public abstract class Recitales {
    private String nombreBanda;
    private String [] temas;    
    private int cantTemas;
    private int cantActual;
	
    public Recitales(String nombreBanda, int cantTemas){
        this.nombreBanda = nombreBanda;
        this.cantTemas = cantTemas;
	this.temas = new String[cantTemas];
        this.cantActual = 0;
        for(int i=0;i<cantTemas;i++){
            temas[i] = null;
        }
    }

    public void setTemas(String[] temas) {
        this.temas = temas;
    }

    public String[] getTemas() {
        return temas;
    }

    public int getCantTemas() {
        return cantTemas;
    }

    public void setCantTemas(int cantTemas) {
        this.cantTemas = cantTemas;
    }

    public int getCantActual() {
        return cantActual;
    }

    public void setCantActual(int cantActual) {
        this.cantActual = cantActual;
    }
    
    public boolean HayLugar(){
        return this.getCantActual() < this.getCantTemas();
    }
    
    public void agregarTema(String newTema){
        if(this.HayLugar()){
            this.temas[cantActual] = newTema;
            cantActual ++;
        }else{
            System.out.println("No se pueden agregar mas Temas.");
        }
    }
    
    public String concatenador() {
        String aux = "";
        for(int i=0;i<cantActual;i++){
            aux += ("Y ahora tocaremos..." + this.getTemas()[i] + "\n");
        }
        
        return aux;
    }
        
    public String actuar(){
        String aux = "";
        aux += " " + this.concatenador();
        
        return aux;
    }
    
    public abstract double calcularCosto();
	
}
