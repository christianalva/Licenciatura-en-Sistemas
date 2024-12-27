//B)
package ejercicio.pkg4;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ejercicio4 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        int n, i;
        n = 1 + GeneradorAleatorio.generarInt(10);
        
        Hotel habitacion = new Hotel(n); // Crea un objeto 'Hotel' con 'n' habitaciones
        
        Cliente [] inquilino = new Cliente[habitacion.getDF()]; // Crea un array de clientes con capacidad para 'n' elementos
        
        for(i=0; i<(n-3); i++){ // Bucle para inicializar y asignar clientes a habitaciones
            inquilino[i] = new Cliente(); // Crea un nuevo cliente vacío
            inquilino[i].setNombre(GeneradorAleatorio.generarString(5)); // Asigna un nombre aleatorio de 5 caracteres al cliente
            inquilino[i].setDni(GeneradorAleatorio.generarInt(200)); // Asigna un DNI aleatorio al cliente (valor entre 0 y 199)
            inquilino[i].setEdad(GeneradorAleatorio.generarInt(99)); // Asigna una edad aleatoria al cliente (valor entre 0 y 98)
            
            habitacion.ingresarCliente(inquilino[i], i); // Ingresa el cliente en la habitación 'i'
        }
        
        //-----------------------------------------------------------------------------
        
        //III) Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está en el rango 1..N) y que la habitación está libre.
        int num;
        System.out.println(n);
        System.out.println("Ingrese un numero de habitacion: ");
        num = Lector.leerInt();
        Cliente nueCliente = new Cliente("Christian", 42941857, 24);
        habitacion.ingresarClienteEnHabitacion(nueCliente, num);
        
        
        //------------------------------------------------------------------------------
        //mostrar habitaciones y cliente
        for(i=0;i<habitacion.getDF();i++){
            Habitacion unaHabitacion = habitacion.imprimir(i);
            System.out.println(unaHabitacion);
        }
        /*
        
        // Mostrar todas las habitaciones, incluyendo las libres y ocupadas
        for (i = 0; i < habitacion.getDF(); i++) { // Cambia `habitacion.getDL()` por `habitacion.getDF()` para recorrer todas las habitaciones
            Habitacion unaHabitacion = habitacion.imprimir(i);
            System.out.println("Habitación " + (i + 1) + ": " + unaHabitacion); // Imprime la habitación con su información
        }
        */ 
        
        
        //----------------------------------------------------------------------
        //Aumentar el precio de todas las habitaciones en un monto recibido.
        System.out.println();
        int aumento = GeneradorAleatorio.generarInt(10000);
        habitacion.aumentarPrecio(aumento);//aumento el precio
        System.out.println("Habitaciones con el precio aumentado en " + aumento + " pesos: ");
        
        //vuelvo a mostral pero ahora con el precio aumentado
        for(i=0;i<habitacion.getDF();i++){
            Habitacion unaHabitacion = habitacion.imprimir(i);
            System.out.println(unaHabitacion);
        }
    
    }
    
}
