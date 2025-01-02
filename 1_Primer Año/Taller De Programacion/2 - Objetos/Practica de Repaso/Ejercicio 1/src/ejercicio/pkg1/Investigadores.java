
package ejercicio.pkg1;

public class Investigadores {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidios [] subsidio;
    private int cant;
    
    public Investigadores(String nombre, int categoria, String especialidad){
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidio = new Subsidios [5];
        this.cant = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    
    public void agregarSubsidio(Subsidios unSubsidio){
        if(cant < 5){
            subsidio[cant] = unSubsidio;
            cant ++;
        } else {
            System.out.println("El investigador ya tiene el maximos de subcidios disponibles.");
        }
        
    }
    
    public double sumarSubsidios(){
        double aux = 0;
        for(int i=0; i<5;i++){
            if (subsidio[i] != null) {
                aux += subsidio[i].getMonto();
            }
        }
        return aux;
    }

    @Override
    public String toString() {
        return "Investigador: " + "nombre:" + nombre + ", categoria:" + categoria + ", especialidad:" + especialidad + ", Total subsidios Otorgados: " + sumarSubsidios() + "\n";
    }
    
    
}
