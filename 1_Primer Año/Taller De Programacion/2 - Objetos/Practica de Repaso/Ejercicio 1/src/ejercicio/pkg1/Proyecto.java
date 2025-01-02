/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio.pkg1;

/**
 *
 * @author chris
 */
public class Proyecto {
    private String nombreProyecto;
    private int codigo;
    private String nombreDirector;
    private Investigadores [] investigadores;
    private int pos; 
    
    public Proyecto(String nombreP, int codigo, String nombreD){
        this.nombreProyecto = nombreP;
        this.codigo = codigo;
        this.nombreDirector = nombreD;
        this.investigadores = new Investigadores [50];
        
        pos = 0;
    }
    
    public void agregarInvestigador(Investigadores unInvestigador){
        if(getPos() < 50){
            investigadores[pos] = unInvestigador;
            pos++;
        } else {
            System.out.println("Se ah alcanzasado la capacidad maxima de investigadores.");
        }
    }
    
    public Investigadores[] getInvestigadores() {
        return investigadores;
    }
    
     public double dineroTotalOtorgado(){
         double aux = 0; 
         for(int i=0; i<50;i++){
             if(investigadores[i] != null){
                 aux += investigadores[i].sumarSubsidios();
             }
         }
         return aux;
    }

    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public int getPos() {
        return pos;
    }

    public void setPos(int pos) {
        this.pos = pos;
    }
    
     @Override
    public String toString() {
        String aux = "Proyecto: nombre Proyecto: " + nombreProyecto +
                   ", codigo: " + codigo +
                   ", nombre Director: " + nombreDirector +
                   ", Total Dinero otorgado: " + dineroTotalOtorgado() + "\n";
        
                   for(int i=0;i<pos;i++){
                       aux += investigadores[i].toString();
                   }
        return aux;
     
    }
}
    

