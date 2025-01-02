
package ejercicio.pkg2;

public class Ejercicio2 {

    public static void main(String[] args) {
       Estacionamiento newEstacionamiento;
       Auto newAuto;
       
       Auto auto1 = new Auto("Juan", "ABC123");
       Auto auto2 = new Auto("Maria", "DEF456");
       Auto auto3 = new Auto("Carlos", "GHI789");
       Auto auto4 = new Auto("Ana", "JKL012");
       Auto auto5 = new Auto("Pedro", "MNO345");
       Auto auto6 = new Auto("Luisa", "PQR678");
       
       newEstacionamiento = new Estacionamiento("Los piojos", "Direccion", "8:00", "21:00", 5, 10);
       newEstacionamiento.setNewAuto(auto1, 1, 3);
       
       
       
       System.out.println(newEstacionamiento.toString());
       // Dada una patente, obtener un String que contenga el número de piso y plaza donde está dicho auto en el estacionamiento. En caso de no encontrarse, retornar el mensaje “Auto Inexistente”.
       System.out.println(newEstacionamiento.getPisoYPlaza("ABC123"));
       //Dado un número de plaza Y, obtener la cantidad de autos ubicados en dicha plaza (teniendo en cuenta todos los pisos).
       System.out.println("La cantidad de autos ubicados es de: " + newEstacionamiento.getcantAutos(3));
    
    
    }
    
}
