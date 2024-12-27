
package ejercicio.pkg4;
import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Cliente inquilino;
    
    public Habitacion(){
        this.costo = GeneradorAleatorio.generarDouble((6001 + 2000));
        this.ocupada = false;       
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = (this.costo+costo);
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }
    
    public Cliente getInquilino(){
        return inquilino;
    }
    
    //agrego nuevo inquilino
    public void setInquilino(Cliente inquilino){
        this.inquilino = inquilino;
    }

    @Override
    public String toString() {
        return "Habitacion{" + "costo=" + costo + ", ocupada=" + ocupada + ", inquilino=" + inquilino + '}';
    }
    
    
}
