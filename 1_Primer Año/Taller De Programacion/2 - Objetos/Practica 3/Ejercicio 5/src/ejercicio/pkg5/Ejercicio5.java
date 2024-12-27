
package ejercicio.pkg5;
import PaqueteLectura.Lector;

public class Ejercicio5 {

    public static void main(String[] args) {
        double radio;
        String colorRelleno, colorLinea;
        
        System.out.println("Ingrese el radio del circulo: ");
        radio = Lector.leerInt();
        System.out.println("Ingrese el color de relleno: ");
        colorRelleno = Lector.leerString();
        System.out.println("Ingrese el color de la linea: ");
        colorLinea = Lector.leerString();
        
        Circulo circulo = new Circulo(radio, colorRelleno, colorLinea);
        
        System.out.println(circulo.toString());
        System.out.println("El Perimetro del circulo es de: " + circulo.calcularPerimetro(radio));
        System.out.println("El area del circulo es de: " + circulo.calcularArea(radio));
  
                
    }
    
}
