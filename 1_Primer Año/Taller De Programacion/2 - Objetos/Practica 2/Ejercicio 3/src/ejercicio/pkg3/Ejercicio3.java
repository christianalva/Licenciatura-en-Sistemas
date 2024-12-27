/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio.pkg3;

import PaqueteLectura.GeneradorAleatorio;
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
    
public class Ejercicio3 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dias = 5;
        int turnos = 8;
        
        Persona [][] personas = new Persona [dias][turnos];
        int dni, edad, dia, turno;
        String nombre;
        Boolean ok = true;
        int cantInscriptos = 0;
        
        
        while(cantInscriptos < 40 && ok){
            nombre = GeneradorAleatorio.generarString(3);
            if(nombre.equals("ZZZ")){
                ok = false;
            }
            dni = GeneradorAleatorio.generarInt(99999);
            edad = GeneradorAleatorio.generarInt(99);
            
            dia = cantInscriptos/turnos;
            turno = cantInscriptos%turnos;
            
            personas[dia][turno] = new Persona(nombre, dni, edad);
             
            cantInscriptos ++;
             
        }
        
        
        // Informo 
        int i, j;
        for(i=0;i<dias;i++){
            for(j=0;j<turnos;j++){
                System.out.println("Dia: " + (i+1) + ", Turno: " + (j+1) + ", Persona: " + personas[i][j].toString());
            }
        }
               
    }
    
}
