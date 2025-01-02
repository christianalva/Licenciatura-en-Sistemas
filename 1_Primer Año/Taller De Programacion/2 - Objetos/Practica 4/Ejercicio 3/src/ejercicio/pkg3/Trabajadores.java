
package ejercicio.pkg3;

public class Trabajadores extends Persona{
    private String tarea;
    
    public Trabajadores(String nombre, int unDNI, int edad, String tarea){
        super(nombre, unDNI, edad);
        setTarea(tarea);
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

    @Override
    public String toString() {
        return super.toString() + "Soy: " + tarea ;
    }
    
    
    
    
}
