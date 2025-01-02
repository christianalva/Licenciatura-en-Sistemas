
package ejercicio.pkg1;

public class Ejercicio1 {

    
    public static void main(String[] args) {
        //Triangulo
       Triangulo newTriangulo = new Triangulo(2,3,4, "Rojo", "Blanco");
       System.out.println(newTriangulo.toString());
       //Circulo
       Circulo newCirculo = new Circulo(3.4, "dorado", "marron");
       System.out.println(newCirculo.toString());
       //Despinto el circulo 
       System.out.println("Circulo despintado: ");
       newCirculo.despintar();
       System.out.println(newCirculo.toString());
    }
    
}
