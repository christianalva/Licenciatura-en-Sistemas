
package ejercicio.pkg2;

public class Ejercicio2 {

    public static void main(String[] args) {
        System.out.println("JUGADOR: ");
        Jugadores newJugador = new Jugadores("Lionel Messi", 1000, 4, 30, 10);
        System.out.println(newJugador.toString());
        
        System.out.println("ENRENADOR: ");
        Entrenador newEntrenador = new Entrenador("Christian", 10000, 2, 2);  
        System.out.println(newEntrenador.toString());
    }
    
}
