
package ejercicio.pkg1;

public class Triangulo extends Figura{
    
    private int lado1;
    private int lado2;
    private int lado3;
    
    public Triangulo(int lado1, int lado2, int lado3, String unColorR, String unColorL){
        super(unColorR,unColorL);//Super invoca al constructor de la super clase
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }


    public double calcularArea() {
        // Formula de Heron
        double s = (lado1 + lado2 + lado3)/2;
        double area = s*(s-lado1)*(s-lado2)*(s-lado3);
        return Math.sqrt(area);
    }
    
    public double calcularPerimetro() {
        return (lado1 + lado2 + lado3);
    }

    public int getLado1() {
        return lado1;
    }

    public void setLado1(int lado1) {
        this.lado1 = lado1;
    }

    public int getLado2() {
        return lado2;
    }

    public void setLado2(int lado2) {
        this.lado2 = lado2;
    }

    public int getLado3() {
        return lado3;
    }

    public void setLado3(int lado3) {
        this.lado3 = lado3;
    }

    public String toString(){
       String aux = super.toString() + 
                    " Lado 1: " + getLado1() +
                    " Lado 2: " + getLado2() +
                    " Lado 3: " + getLado3() ;
       return aux;
    }
    
    
}
