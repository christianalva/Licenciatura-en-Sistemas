// Estantes
package ejercicio.pkg3;


public class Ejercicio3 {
    
    public static void main(String[] args) {
        // Crear un estante vacío
        Estantes estante = new Estantes();
        
        Autor autor1 = new Autor("Herbert Schildt", "Autor de multiples libros sobre Java", "Estados Unidos");
        Autor autor2 = new Autor("John Horton", "Especialista en Desarrollo de videojuegos", "Reino Unido");
        Autor autor3 = new Autor("Louisa May Alcott", "Escritora estadounidense", "Estados Unidos");
        
        Libro libro1 = new  Libro( "Java: A Beginner's Guide", "Mcgraw-Hill", 2014, autor1, "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games", "CreateSpace Independent Publishing", autor2, "978-1512108347");
        Libro libro3 = new Libro("Mujercitas", "Editorial Molino", 1868, autor3, "123-456", 15.99);
        
        //Agrego libro
        estante.agregarLibro(libro1);
        estante.agregarLibro(libro2);
        estante.agregarLibro(libro3);
        
        int i;
        for(i=0;i<estante.getCant();i++){
            Libro libro = estante.imprimir(i);
            System.out.println(libro);
        }
        
        Libro libros = estante.buscarLibro("Mujercitas");
        
        System.out.println();
        
        if(libros == null){
            System.out.println("El libro mujercitas no se encuentra en el estante.");
        }else{
            System.out.println("El autor del libro mujercitas es: " + libros.getPrimerAutor().toString());
        }
              
        /*
        C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que enen como máximo N libros? ¿Cómo instanciaría el estante?
        le pasaria a Estantes estante = new Estantes(); una variable con la capacidad maxima que tenga el vector de la siguiente manera
        Estantes estante = new Estantes(capacidadMaxima);
        y quedaria: 
        
        public  Estantes(int DF){
        libros = new Libro[DF]; // Inicializa el arreglo de libros
        cant = cant;
    }
        
        */    
    }
    
}
