// Creo la clase AUTOR
package ejercicio.pkg3;

//Esta seria la clase autor pero le pongo Ejercicio2 para saber cual problema es 
public class Autor {
    private String nombre;
    private String biografia;
    private String origen;
    
    // Constructor con todos los atributos
    public Autor (String unNombre, String unaBiografia, String unOrigen){
        nombre = unNombre;
        biografia = unaBiografia;
        origen = unOrigen;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    // Método toString para representar la información del autor+
    public String toString(){
        return "Nombre: " + nombre + ", Biografia: " + biografia + ", Origen: " + origen;
    }
    
}
