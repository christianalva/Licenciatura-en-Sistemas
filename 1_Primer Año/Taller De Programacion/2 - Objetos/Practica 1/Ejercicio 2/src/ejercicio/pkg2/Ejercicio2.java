/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ejercicio.pkg2;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ejercicio2 {

    public static void main(String[] args) {
       
        //Paso 2: Declarar la variable vector de double 
        int DF = 15;
        //Paso 3: Crear el vector para 15 double 
        double [] tabla = new double[DF];
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double numero;
        double cantTotal = 0.0;
        double promedio;
        int cantAlturasMayores = 0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i=1;i<=DF;i++){
            numero = Lector.leerDouble();
            tabla[i] = numero;
            cantTotal = cantTotal + numero;
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedio = cantTotal/DF;
        System.out.println("El promedio de las alturas es de : " + promedio + "CM");
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i=1; i<=DF; i++){
            if(tabla[i] > promedio){
                cantAlturasMayores = cantAlturasMayores + 1; 
            }
        }
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de Jugadores por encima del promedio: " + promedio + " es de: " + cantAlturasMayores + " Jugadores.");
    }
    
}
