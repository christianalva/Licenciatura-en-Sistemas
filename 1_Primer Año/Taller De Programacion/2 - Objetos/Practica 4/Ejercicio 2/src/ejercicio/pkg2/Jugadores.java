    
package ejercicio.pkg2;

public class Jugadores extends Empleados {
    private int numPartidos;
    private int goles;
    
    public Jugadores(String unNombre, double unSueldo, int unaAntiguedad, int numPartidos, int goles){
        super(unNombre, unSueldo, unaAntiguedad);
        this.numPartidos = numPartidos;
        this.goles = goles;
    }

    public int getPartidos() {
        return numPartidos;
    }

    public void setPartidos(int numPartidos) {
        this.numPartidos = numPartidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    @Override
    public double calcularEfectividad() {
        return (double) this.goles/this.numPartidos;
    }

    @Override
    public double calcularSueldoACobrar() {
        double sueldo = getSueldo() + (getSueldo() * 0.10 * getAntiguedad());
        
        if (calcularEfectividad() > 0.5) {
            sueldo += getSueldo();
        }
        
        return sueldo;
    }
    
    
}
