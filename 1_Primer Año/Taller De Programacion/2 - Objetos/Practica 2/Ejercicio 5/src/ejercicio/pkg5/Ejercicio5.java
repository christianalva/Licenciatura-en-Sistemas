package ejercicio.pkg5;

/*
Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un 
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin 
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el 
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto 
partido sabe responder a los siguientes mensajes:

getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” X
setVisitante(X) modifica el nombre del equipo visitante al “String” X
setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna 
un String vacío). 
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en 
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con 
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:


- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Estudiantes jugando de local
*/


//CAMBIO A BOSTA POR ESTUDIANTESSS (ESTUDIOOOOOOOOOOOOOOOOOOOO)

import ejercicio.pkg5.Partido;
import PaqueteLectura.Lector;

public class Ejercicio5 {
    public static void main(String[] args) {
        int DF = 20;
        boolean ok = true;
        Partido [] partidos = new Partido [DF];
        String nombreLocal, nombreVisitante;
        int golesLocal, golesVisitante;
        int cant = 0;
        
        
        while(cant <20 && ok){
            System.out.println("Ingrese el nombre del equipo local: ");
            nombreLocal = Lector.leerString();
            System.out.println("Ingrese el nombre del equipo visitante: ");
            nombreVisitante = Lector.leerString();
            
            if(nombreVisitante.equals("ZZZ")){
                ok = false;
            } else {
                System.out.println("Goles del equipo local: ");
                golesLocal = Lector.leerInt();
                System.out.println("Goles del equipo visitante: ");
                golesVisitante = Lector.leerInt();
            
                partidos[cant] = new Partido(nombreLocal, nombreVisitante, golesLocal, golesVisitante);
            
                cant++;
            } 
           
        }
        
        int i;
        int ganaRiber = 0;
        int golesEstudio = 0;

        //informar partidos
        for (i=0;i<cant;i++){
            System.out.println(partidos[i].getLocal() + ": " + partidos[i].getGolesLocal() + " VS " + partidos[i].getVisitante() + ": " + partidos[i].getGolesVisitante());
            if(partidos[i].getGanador().equals("Riber")){
                ganaRiber++;
            }
            if(partidos[i].getLocal().equals("Estudiantes")){
                golesEstudio = golesEstudio + partidos[i].getGolesLocal();
            }
        }
        
        System.out.println();
        System.out.println("La cantidad de partidos que gano riber es de: " + ganaRiber + " Partidos.");
        System.out.println("La cantidad de goles que metio Estudiantes jugando de Local es de: " + golesEstudio + " Goles.");
    }
    
}
