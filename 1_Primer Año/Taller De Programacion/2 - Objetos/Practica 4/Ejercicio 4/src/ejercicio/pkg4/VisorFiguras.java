/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio.pkg4;

public class VisorFiguras {
    private int mostradas;
 
    public VisorFiguras(){
        mostradas=0;
    }
    public void mostrar(Figura f){
        System.out.println(f.toString()); 
        mostradas++;
    }
    public int getMostradas() {
        return mostradas;
    }
}

/*
¿Qué imprime el programa?
Paso por paso:
El objeto VisorFiguras se crea y se inicializa el contador mostradas en 0.

Luego, se crean tres figuras:

c1 es un cuadrado de lado 10, con relleno "Violeta" y borde "Rosa".
r es un rectángulo de largo 20 y ancho 10, con relleno "Azul" y borde "Celeste".
c2 es un cuadrado de lado 30, con relleno "Rojo" y borde "Naranja".
El método mostrar del visor se llama tres veces:

Primera llamada: imprime la representación de c1.
Segunda llamada: imprime la representación de r.
Tercera llamada: imprime la representación de c2.
Finalmente, se imprime el número de figuras mostradas, que es 3.


¿Por qué imprime esto?
Cada vez que se llama al método mostrar, se invoca el método toString() de la figura recibida. La salida que ves es el resultado de concatenar las propiedades de las clases Cuadrado y Rectangulo con las propiedades heredadas de Figura.
El contador mostradas se incrementa en cada llamada a mostrar, por lo que al final del programa el visor habrá mostrado tres figuras, y el valor de visor.getMostradas() es 3.
*/