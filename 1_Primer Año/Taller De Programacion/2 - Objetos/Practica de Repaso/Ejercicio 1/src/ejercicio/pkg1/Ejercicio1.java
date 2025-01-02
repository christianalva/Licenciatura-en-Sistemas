
package ejercicio.pkg1;
import PaqueteLectura.GeneradorAleatorio;


public class Ejercicio1 {
    
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Investigadores newInvestigador;
        Subsidios newSubsidio;
        
        Proyecto newProyecto = new Proyecto("Auto", 32323, "Christian");
        for(int i=0; i<30; i++){
            String nombre = GeneradorAleatorio.generarString(3);
            int categoria = GeneradorAleatorio.generarInt(5);
            String especialidad = GeneradorAleatorio.generarString(5);
            
            newInvestigador = new Investigadores(nombre, categoria, especialidad);
            newProyecto.agregarInvestigador(newInvestigador);
            
            double monto = GeneradorAleatorio.generarDouble(5000);
            String motivo = "no-otorgado";
            newSubsidio = new Subsidios(monto, motivo);
            newInvestigador.agregarSubsidio(newSubsidio);
        }
        
        System.out.println(newProyecto.toString());
        
        
    }
    
}
