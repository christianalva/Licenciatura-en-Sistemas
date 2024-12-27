package ejercicio.pkg4;

import PaqueteLectura.GeneradorAleatorio;


public class Ejercicio4 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int [][] matriz = new int [8][4];
        int numeroOficina, numeroPiso;
        
        //ingreso numero de piso
        numeroPiso = GeneradorAleatorio.generarInt(9)+1;
        while(numeroPiso != 9){
            //ingreso numero de oficina
            numeroOficina = GeneradorAleatorio.generarInt(4)+1;
            //sumo la cantidad en la matriz 
            matriz[numeroPiso-1][numeroOficina-1] = matriz[numeroPiso-1][numeroOficina-1]+1;
                    
                    
            numeroPiso = GeneradorAleatorio.generarInt(9)+1;
        }
        
        //imprimo la matriz
        int i, j;
        for(i=0;i<8;i++){
            for(j=0;j<4;j++){
                System.out.println("Piso: " + (i+1) + ", Oficina: " + (j+1) + ": " + matriz[i][j] + " Personas.");
            }
            System.out.println();
        }
        
        
        
    }
    
}
