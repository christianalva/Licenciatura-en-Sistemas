/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio.pkg5;

public class VisorFiguras {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura [] vector;
 
    public VisorFiguras(){
        vector = new Figura[capacidadMaxima];
        guardadas = 0;
    }
    
    public void guardar(Figura f){
        if(quedaEspacio()){
            vector[guardadas] = f;
            guardadas ++;
        }else{
            System.out.println("No hay espacio.");
        }
    }
    public void mostrar(){
        if(guardadas == 0){
            System.out.println("No hay figuras para mostrar");
        }else{
            for(int i = 0;i<guardadas;i++){
                System.out.println(vector[i].toString());
            }
        }
    }
    
    public int getGuardadas() {
        return guardadas;
    }
    public boolean quedaEspacio(){
        return guardadas < capacidadMaxima;
    }

}

