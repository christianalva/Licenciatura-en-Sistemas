
package ejercicio.pkg3;

public class GIra  extends Recitales{
    private String nombreGira;
    private Fechas [] fechas;
    private int cantFechas;
    private int maxFechas;
        
    
    public GIra(String nombreBanda, int cantTemas, String nombreGira, int maxFechas){
        super(nombreBanda, cantTemas);
        this.nombreGira = nombreGira;
        this.maxFechas = maxFechas;
        this.fechas = new Fechas[maxFechas];
        this.cantFechas = 0;
                
        for(int i=0;i<maxFechas;i++){
            fechas[i] = null;
        }
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public Fechas[] getFechas() {
        return fechas;
    }

    public void setFechas(Fechas[] fechas) {
        this.fechas = fechas;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public void setCantFechas(int cantFechas) {
        this.cantFechas = cantFechas;
    }

    public int getMaxFechas() {
        return maxFechas;
    }

    public void setMaxFechas(int maxFechas) {
        this.maxFechas = maxFechas;
    }
    
    public boolean HayEspacio(){
        return this.getCantFechas() < this.getMaxFechas();
    }
    
    public void agregarFecha(Fechas newFecha){
        if(this.HayEspacio()){
           this.fechas[cantFechas] = newFecha;
           cantFechas ++;
        }else {
            System.out.println("No se puede agregar mas Fechas");
        }
    }
        
    
    public String actuar(){
        String aux = "";
        for(int i=0;i<cantFechas;i++){
            aux += "Gira numero: " + (i+1) + " Buenas noches " + this.fechas[i].getCiudad() + "\n";
            aux += super.actuar() + "\n";         
        }
        return aux;
    }
        
    public double calcularCosto(){
        return 30000 * maxFechas;
    }
	
}
