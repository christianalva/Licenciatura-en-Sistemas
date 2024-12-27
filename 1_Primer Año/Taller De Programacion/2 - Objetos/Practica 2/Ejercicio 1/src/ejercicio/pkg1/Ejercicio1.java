/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio.pkg1;

import java.util.Scanner;

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
    
public class Ejercicio1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in); //creo el scanner para leer desde teclado
        
        System.out.println("Ingrese su Nombre: ");
        String nombre = sc.nextLine(); //leer una linea de texto;
        
        System.out.println("Ingrese Su DNI: ");
        int DNI = sc.nextInt();//leo un entero
        
        System.out.println("Ingrese su edad: ");
        int edad = sc.nextInt();
        
        // Crear un objeto Persona con los datos ingresados
        Persona persona = new Persona(nombre, DNI, edad);
        
        System.out.println(persona.toString());
        
        sc.close();
        
    }
    
}
