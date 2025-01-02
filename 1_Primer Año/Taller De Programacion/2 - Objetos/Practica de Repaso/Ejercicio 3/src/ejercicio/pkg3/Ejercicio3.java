package ejercicio.pkg3;

public class Ejercicio3 {

    public static void main(String[] args) {
		GIra gira;
		gira = new GIra("nombre banda", 3, "nombre gira", 3);
                Fechas fecha1 = new Fechas("Fecha1", 12);
                Fechas fecha2 = new Fechas("Fecha3", 2);
                gira.agregarTema("tema1");
                gira.agregarFecha(fecha1);
                gira.agregarFecha(fecha2);
                System.out.println(gira.actuar());
                
                Evento evento;
                evento = new Evento("nombre banda", 3, "show de beneficencia", "christian", "lunes");
                
                System.out.println(evento.actuar());
                System.out.println("El costo del evento es de: " + evento.calcularCosto());
    
    }          

}
