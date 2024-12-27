/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio.pkg4;
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
public class Ejercicio4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Scanner sc = new Scanner(System.in);
        int dias = 5;
        int turnos = 8;
        
        Persona [][] personas = new Persona [dias][turnos];
        int dni, edad, dia, turno, i, j;
        String nombre;
        Boolean ok = true;
        Boolean encontrado;
        int cantInscriptos = 0;
        
        
        while(cantInscriptos < 10 && ok){
            nombre = GeneradorAleatorio.generarString(3);
            if(nombre.equals("ZZZ")){
                ok = false;
            }
            dni = GeneradorAleatorio.generarInt(99999);
            edad = GeneradorAleatorio.generarInt(99);
            encontrado = false;
            
            System.out.println("Ingrese el Dia en que se quiere presentar al casting: ");
            dia = (sc.nextInt()-1);
            
            while(!encontrado){
                if(dia <= dias && dia >= 0){
                   i = 0;
                   while(i<turnos && !encontrado){
                        if(personas[dia][i] == null){ //pregunto si esta vacia
                            turno = i;
                            personas[dia][turno] = new Persona(nombre, dni, edad);
                            encontrado = true;
                            cantInscriptos ++;
                        }
                        i ++;                }
                    if(!encontrado){
                        System.out.println("El dia elegido esta totalmente ocupado, elija otro dia: ");
                        dia = sc.nextInt();
                    }
                } else{
                        System.out.println("El numero ingresado es incorrecto, Ingrese otro: ");
                        dia = sc.nextInt();
                    }            
            }
        }
        
        int cant;
        //informo 
        for(i=0;i<dias;i++){
            cant = 0;
            System.out.println("DIA: " + (i+1));
            for(j=0;j<turnos;j++){
                if(personas[i][j] != null){
                    System.out.println("Turno: " + (j+1) + ", Nombre de persona a entrevistar: " + personas[i][j].getNombre());
                   cant++; 
                }
                
            }
            System.out.println("La cantidad de inscriptos a entrevistar en el dia: " + (i+1) + ", es de: "+ cant + " Inscriptos");
            
        }
    }
    
}
