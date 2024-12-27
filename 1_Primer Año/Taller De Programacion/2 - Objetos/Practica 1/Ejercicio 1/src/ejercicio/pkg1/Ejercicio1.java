/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio.pkg1;

/**
 *
 * @author chris
 */
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
      
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        
        int numAleatorio = GeneradorAleatorio.generarInt(12);
        
        while(numAleatorio != 11){
           System.out.println("2x" + numAleatorio + "="+ tabla2[numAleatorio]);
           numAleatorio = GeneradorAleatorio.generarInt(12);
        }
        System.out.println("El numero Aleatorio generado es el 11. ");
        
        
    }
    
}
