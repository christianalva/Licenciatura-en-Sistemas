
package ejercicio.pkg1;

public class Circulo extends Figura{
    private double radio;
    
    public Circulo(double radio,  String unColorR, String unColorL){
        super (unColorR, unColorL);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    
    public double calcularArea() {
       return (Math.PI * Math.pow(radio, 2));
    }


    public double calcularPerimetro() {
        return ((2*Math.PI) * radio);
    }
    
    public String toString(){
       String aux = super.toString() + 
                    " Radio: " + getRadio();
       return aux;
    }
}
