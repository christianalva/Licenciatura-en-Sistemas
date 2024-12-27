/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package ejercicio.pkg2;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Creo Instancias de autores
        Ejercicio2 autor1 = new Ejercicio2("Herbert Schildt", "Autor de multiples libros sobre Java", "Estados Unidos");
        Ejercicio2 autor2 = new Ejercicio2("John Horton", "Especialista en Desarrollo de videojuegos", "Reino Unido");
        
        Libro libro1 = new  Libro( "Java: A Beginner's Guide", "Mcgraw-Hill", 2014, autor1, "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games", "CreateSpace Independent Publishing", autor2, "978-1512108347");
        
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        Libro libro3= new Libro(); 
    }
    
}
