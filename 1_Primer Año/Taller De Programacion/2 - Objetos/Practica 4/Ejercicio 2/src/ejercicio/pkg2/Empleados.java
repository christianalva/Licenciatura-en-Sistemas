
package ejercicio.pkg2;

public abstract class Empleados {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleados(String unNombre, double unSueldo, int unaAntiguedad){
        setNombre(unNombre); 
        setSueldo(unSueldo);
        setAntiguedad(unaAntiguedad);
    }
    
    @Override
    public String toString() {
        String aux = "nombre: " + nombre + ", sueldo:" + sueldo + 
                     ", antiguedad:" + antiguedad + ", EFECTIVIDAD: " +
                      this.calcularEfectividad() + ", SUELDO A COBRAR: " + 
                      this.calcularSueldoACobrar();
        return aux;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
      
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
 
}