package ejercicio.pkg3;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import java.util.Scanner;

public class Ejercicio3 {
    
    public static void main(String[] args) {
        //Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar();
        int [][] matriz = new int [5][5];
        int [] sumaElementos = new int [5];
        int valor;
        Scanner sc = new Scanner(System.in); //
        int i, j; 
        int sumaFila = 0;
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        for(i=0; i<5; i++){
            for(j=0; j<5; j++){
                matriz[i][j] = GeneradorAleatorio.generarInt(31);//pongo en la matriz numeros entre 0 y 30
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        for(i=0; i<5; i++){
            for(j=0; j<5; j++){
                System.out.print(matriz[i][j] + "\t");
            }
            System.out.println();
        }
        
        System.out.println();
        
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        for(j=0; j<5; j++){
            sumaFila = sumaFila + matriz[1][j]; 
            System.out.print(matriz[0][j] + "\t");
        }
        System.out.println("La suma de los elementos de la fila 1 es de: " + sumaFila);
        
        System.out.println("");
        System.out.println("");
        

        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        for(j=0;j<5;j++){
            for(i=0;i<5;i++){
                sumaElementos[j] = sumaElementos[j] + matriz[i][j]; 
            }
        }
        System.out.println("Suma de elementos de cada columna: ");
        for(i=0;i<5;i++){
            System.out.print(sumaElementos[i] + "\t");
        }
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        int fila = 0;
        int columna = 0;
        boolean ok = false;
        System.out.println();
        System.out.println();
        System.out.println("Ingrese un valor entero a buscar en la matriz: ");
        valor = sc.nextInt();
        
        for(i=0;i<5;i++){
            for(j=0;j<5;j++){
                if(valor == matriz[i][j]){
                    ok = true;
                    fila = i;
                    columna = j;
                }
            }
        }
        if(ok){
            System.out.println("El valor: " + valor + ", se encuentra en la fila: " + fila + " y columna: " + columna);
        } else {
            System.out.println("No se encontro el elemento.");
        }
    }
    
}
