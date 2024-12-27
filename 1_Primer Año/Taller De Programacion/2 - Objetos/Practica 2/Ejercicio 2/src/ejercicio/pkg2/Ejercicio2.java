
package ejercicio.pkg2;
import java.util.Scanner;
import PaqueteLectura.GeneradorAleatorio;

class Persona {
    private String nombre;
    private int DNI;
    private int edad; 
    
    public Persona(String unNombre, int unDNI, int unaEdad){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad; 
    }
    
    public Persona(){
     
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
        return aux;
    }
}

public class Ejercicio2 {

    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DF = 15;
        // Creo un vector de a lo sumo 15 personas
        Persona [] personas = new Persona[DF];
         // Declaro una variable de tipo Persona para almacenar temporalmente la información de cada persona
        Persona persona;
        int cantPersonas = 0;
        int edad, dni;
        int mayores65 = 0;
        String nombre;
        
        edad = GeneradorAleatorio.generarInt(99);
        while (edad != 0 && cantPersonas < DF){
            dni = GeneradorAleatorio.generarInt(1000)+100;
            nombre = GeneradorAleatorio.generarString(10);
            
            // Creo un nuevo objeto Persona con el nombre, dni y edad generados aleatoriamente
            persona = new Persona(nombre, dni, edad);
             // Almaceno el objeto Persona en la posición correspondiente del vector personas
            personas[cantPersonas] = persona;
            cantPersonas += 1;
            edad = GeneradorAleatorio.generarInt(50);
        }
        
        int i;
        //muestro las personas creadas
        for(i=0;i<15;i++){
            System.out.println(personas[i].toString());
        }
        
        Persona menorDNI = personas[0];
        
        for(i=0;i<15;i++){
            if(personas[i].getEdad() > 65){
                mayores65 ++;
            }
            if(personas[i].getDNI() < menorDNI.getDNI()){
                //min = personas[i].getDNI();
                menorDNI = personas[i];
               
            }
        }
        
        System.out.println("");
        System.out.println("La cantidad de personas mayores a 65 es de: " + mayores65 + " personas.");
        System.out.println("La persona con menor DNI es: ");
        System.out.println(menorDNI.toString());
    }
    
}
