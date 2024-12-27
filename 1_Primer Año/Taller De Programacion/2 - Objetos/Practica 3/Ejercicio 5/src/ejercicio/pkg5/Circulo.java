
package ejercicio.pkg5;

public class Circulo {
    private double radio;
    private String relleno;
    private  String ColorLinea;
    
    public Circulo(double radio, String relleno, String colorLinea){
        this.radio = radio;
        this.relleno = relleno;
        this.ColorLinea= colorLinea;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getColorLinea() {
        return ColorLinea;
    }

    public void setColorLinea(String ColorLinea) {
        this.ColorLinea = ColorLinea;
    }
    
    public double calcularPerimetro(double radio){
        double perimetro = (2*Math.PI * radio);
        return perimetro;
    }
    
    public double calcularArea(double radio){
        double area = (Math.PI * Math.pow(radio, 2));
        return area;
    }

    @Override
    public String toString() {
        return "Circulo{" + "radio=" + radio + ", relleno=" + relleno + ", ColorLinea=" + ColorLinea + '}';
    }
    
  
}
