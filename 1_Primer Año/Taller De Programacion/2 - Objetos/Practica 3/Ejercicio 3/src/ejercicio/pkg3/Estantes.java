package ejercicio.pkg3;
    
public class Estantes {
    private int DF = 20;
    private Libro [] libros;
    private int cant = 0;
    
    public  Estantes(){
        libros = new Libro[DF]; // Inicializa el arreglo de libros
        cant = cant;
    }

    public Libro[] getLibros() {
        return libros;
    }
    
    public boolean estaLleno(){
         // Compara si la cantidad actual de libros en el estante es igual a la capacidad máxima permitida
        return cant == DF;
        // Si 'cantidadLibros' es igual a 'CAPACIDAD_MAXIMA', devuelve 'true' indicando que el estante está lleno
        // Si 'cantidadLibros' es menor que 'CAPACIDAD_MAXIMA', devuelve 'false' indicando que aún hay espacio en el estante
    }
    
    public int getCant(){
        return cant;
    }
    
    //agrego Libro
    public boolean agregarLibro(Libro unLibro){
        if(!estaLleno()){ // Si el estante no está lleno
            libros[cant] = unLibro; // Agrega el libro en la siguiente posición libre
            cant ++;
            return true;// Indica que el libro se agregó exitosamente
        }else {
            return false;
        }
       
    }
    
    //Busco libro 
    public Libro buscarLibro(String nombre){
        int i;
        for(i=0;i<DF;i++){
            if(libros[i].getTitulo().equalsIgnoreCase(nombre)){
                return libros[i]; // Devuelve el libro encontrado
            }
        }
        return null; // Si no se encuentra el libro, devuelve null
    }
    
    
    public Libro imprimir(int pos){
        return libros[pos]; 
    }
    
}
