
package ejercicio.pkg2;

public class Entrenador extends Empleados{
    private int campeonatosGanados;
    
    public Entrenador(String unNombre, double unSueldo, int unaAntiguedad, int campeonatosGanados){
        super(unNombre, unSueldo, unaAntiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    
    public double calcularEfectividad(){
        return (double) campeonatosGanados/getAntiguedad();
    } 
    
    
    public double calcularSueldoACobrar(){
        double sueldo = getSueldo() + (0.10 * getAntiguedad() * getSueldo());
        
        if(this.campeonatosGanados >= 1 && this.campeonatosGanados <=4){
            sueldo += 5000;
        } else if(this.campeonatosGanados >= 5 && this.campeonatosGanados <=10){
            sueldo += 30000;
        } else if(this.campeonatosGanados > 10){
            sueldo += 50000;
        }
        return sueldo;
    }
    
}
