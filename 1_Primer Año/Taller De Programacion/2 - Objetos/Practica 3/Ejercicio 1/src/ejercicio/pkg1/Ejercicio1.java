
package ejercicio.pkg1;
import PaqueteLectura.Lector;


public class Ejercicio1 {

  
    public static void main(String[] args) {
        double lado1, lado2, lado3;
        String colorRelleno, colorLinea;
        
        
        
        System.out.println("Ingrese el lado 1: ");
        lado1 = Lector.leerDouble();
        System.out.println("Ingrese el lado 2: ");
        lado2 = Lector.leerDouble();
        System.out.println("Ingrese el lado 3: ");
        lado3 = Lector.leerDouble();
        System.out.println("Ingrese el color de Relleno: ");
        colorRelleno = Lector.leerString();
        System.out.println("Ingrese el color de la lina: ");
        colorLinea = Lector.leerString();
        
        // Creación del objeto Triangulo con los datos ingresados
        Triangulos triangulo = new Triangulos(lado1, lado2, lado3, colorRelleno, colorLinea);
        
        System.out.println(triangulo.toString());
        System.out.println("El perimetro del triangulo es de: " + triangulo.calcularPerimetro());
        System.out.println("El area del triangulo es de: " + triangulo.calcularArea());
              
    }
    
}
