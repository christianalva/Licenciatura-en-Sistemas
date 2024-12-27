
package ejercicio.pkg5;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio5 {

    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int [][] matriz = new int [5][4];
        double [] promedio = new double [4];
        int i, j;
        int puntajes;
        
        //inicializo el vector de promedios
        for(i=0;i<4;i++){
            promedio[i] = 0.0;
        }
        
        for(i=0;i<5;i++){
            for(j=0;j<4;j++){
                puntajes = GeneradorAleatorio.generarInt(10)+1;
                matriz[i][j] = puntajes;
            }
        }
        
        for(i=0;i<5;i++){
          System.out.print("Cliente: "+ i + ", Atencion al cliente: " + matriz[i][0] + ", Calidad comida: " + matriz[i][1] + ", Precio: " + matriz[i][2] + ", Ambiente: " + matriz[i][3]);
          System.out.println("");
        }
        
        //sumo el total de cada promedio en la matriz promedio
        for(i=0;i<5;i++){
            for(j=0;j<4;j++){
                promedio[j] = promedio[j] + matriz[i][j];
                //System.out.print(matriz[i][j] + "\t");
            }
        }
        
        //saco el promedio de cada uno de los aspectos
        for(i=0;i<4;i++){
            promedio[i] = promedio[i]/5;
        }
        System.out.println();
        System.out.println("Promedio Obtenido por cada aspecto: ");
        System.out.print("Atencion al cliente: " + promedio[0] + ", Calidad comida: " + promedio[1] + ", Precio: " + promedio[2] + ", Ambiente: " + promedio[3]);
        
        
    }
    
}
