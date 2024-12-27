/*
1-
A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el 
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String). 
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para: 

- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)

B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área. 

NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son 
los lados y s =
𝐚+𝐛+𝐜
2
. La función raíz cuadrada es Math.sqrt(#)
*/
package ejercicio.pkg1;

public class Triangulos {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    
    public Triangulos (double ladoUno, double ladoDos, double ladoTres, String relleno, String linea){
        lado1 = ladoUno;
        lado2 = ladoDos;
        lado3 = ladoTres;
        colorRelleno = relleno;
        colorLinea = linea;
        
    }
    
    //Setter recibe
    public void setLado1 (double lado1){
        //El uso de this en this.lado1 = lado1; permite diferenciar claramente entre el atributo de la clase y el parámetro del constructor o método, y asegura que el valor del parámetro se asigne correctamente al atributo del objeto
        this.lado1 = lado1;
    } 
    
    public void setLado2 (double lado2){
        this.lado2 = lado2;
    }
    
    public void setLado3 (double lado3){
        this.lado3 = lado3;
    }
    
    public void setRelleno (String colorRelleno){
        this.colorRelleno = colorRelleno;
    }
    
    public void setLinea (String colorLinea){
        this.colorLinea = colorLinea;
    }
    
    
    //GETTER devuelbe
    public double getLado1(){
        return lado1;
    }
    
    public double getLado2(){
        return lado2;
    }
    
    public double getLado3(){
        return lado3;
    }
    
    public String getRelleno(){
        return colorRelleno;
    }
    
    public String getLinea(){
        return colorLinea;
    }
    
    //sobre escribo toString() para que me devuelva lo que yo quiero saber
    public String toString(){
        return "Lado 1: " + lado1 + ", Lado 2: " + lado2 + ", Lado 3: " + lado3 + ", Color relleno: " + colorRelleno + ", Color linea: " + colorLinea;
    }
    
    public double calcularPerimetro(){
        return (lado1 + lado2 + lado3); 
    }
    
    public double calcularArea(){
        double s, area;
        s = (lado1 + lado2 + lado3)/2;
        area = s*(s-lado1)*(s-lado2)*(s-lado3);
        return Math.sqrt(area); 
    }
}
