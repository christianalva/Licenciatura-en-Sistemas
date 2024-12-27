//A)
package ejercicio.pkg4;

public class Hotel {
    Habitacion [] unaHabitacion;
    private int DL;
    private int DF;

    public Habitacion[] getUnaHabitacion() {
        return unaHabitacion;
    }

    public void setUnaHabitacion(Habitacion[] unaHabitacion) {
        this.unaHabitacion = unaHabitacion;
    }

    public int getDL() {
        return DL;
    }

    public void setDL(int DL) {
        this.DL = DL;
    }
    
    public Hotel(int n){
        this.DF = n; // Establece la cantidad total de habitaciones en el hotel
        unaHabitacion = new Habitacion [DF]; // Inicializa el arreglo de habitaciones con 'DF' elementos
        
        for(int i=0; i<this.DF; i++){ // Bucle para crear cada habitación con su costo y estado
            unaHabitacion[i] = new Habitacion(); // Inicializa cada habitación como vacía y con costo aleatorio
        }
        this.DL = 0; // Inicializa la dimensión lógica a 0 (ninguna habitación ocupada)
    }
    
   
    public void ingresarCliente(Cliente uncliente, int x){
        this.unaHabitacion[x].setInquilino(uncliente); // Asigna el cliente a la habitación 'x'
        this.unaHabitacion[x].setOcupada(true); // Marca la habitación como ocupada
        DL++; // Incrementa la dimensión lógica, indicando que hay una habitación más ocupada
    }
    
    public void ingresarClienteEnHabitacion(Cliente cliente, int x){
        if(!unaHabitacion[x-1].isOcupada()){
            unaHabitacion[x-1].setInquilino(cliente);
            unaHabitacion[x-1].setOcupada(true);
            DL ++;
        } else {
            System.out.println("La habitación ya está ocupada.");  // Mensaje de error si la habitación ya está ocupada
        }
    }
    
    public void aumentarPrecio(double precio){
        for(int i=0;i<DF;i++){
            unaHabitacion[i].setCosto(precio);
        }
    }
    
    public Habitacion imprimir(int pos){
        return unaHabitacion[pos];
    }

    public int getDF() {
        return DF;
    }

    public void setDF(int DF) {
        this.DF = DF;
    }
    
}
