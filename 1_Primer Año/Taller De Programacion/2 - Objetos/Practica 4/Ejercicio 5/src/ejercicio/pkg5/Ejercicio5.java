/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio.pkg5;

/**
 *
 * @author chris
 */
public class Ejercicio5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Crear el visor de figuras modificado
        VisorFiguras visor = new VisorFiguras();
        
        // Crear dos cuadrados y un rectángulo
        Cuadrado c1 = new Cuadrado(10, "Violeta", "Rosa");
        Cuadrado c2 = new Cuadrado(30, "Rojo", "Naranja");
        Rectangulo r = new Rectangulo(20, 10, "Azul", "Celeste");
        
        // Guardar las figuras en el visor
        visor.guardar(c1);
        visor.guardar(c2);
        visor.guardar(r);
        
        // Mostrar las figuras almacenadas
        visor.mostrar();
    }
    
}
