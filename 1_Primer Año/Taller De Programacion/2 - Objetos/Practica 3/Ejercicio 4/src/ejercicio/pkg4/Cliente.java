 package ejercicio.pkg4;

public class Cliente {
    private String nombre;
    private int dni;
    private int edad;
    
    public Cliente(String unNombre, int unDni, int unaEdad){
        nombre = unNombre;
        dni = unDni;
        edad = unaEdad;
    }
    
    public Cliente(){
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
     @Override
    public String toString() {
        return "Cliente{" + "nombre=" + nombre + ", dni=" + dni + ", edad=" + edad + '}';
    }
}
