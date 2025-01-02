
package ejercicio.pkg3;


public class Ejercicio3 {

    
    public static void main(String[] args) {
        Persona personas = new Persona("Matias Alva", 4332212, 20);
        System.out.println(personas.toString());
        Trabajadores trabajador = new Trabajadores("Christian Alva", 42941857, 24, "Programador");
        System.out.println(trabajador.toString());
    }
    
}
