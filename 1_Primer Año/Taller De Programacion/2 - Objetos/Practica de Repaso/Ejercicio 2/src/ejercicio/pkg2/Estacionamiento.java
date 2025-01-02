/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio.pkg2;

/**
 *
 * @author chris
 */
public class Estacionamiento {

    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private Auto[][] newAuto;
    private int numPiso;
    private int numPlaza;

    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int numPiso, int numPlaza) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.numPiso = numPiso;
        this.numPlaza = numPlaza;
        this.newAuto = new Auto[this.numPiso][this.numPlaza];//creo el array donde almacenare los autos
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(String horaApertura) {
        this.horaApertura = horaApertura;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }

    public Auto[][] getNewAuto() {
        return newAuto;
    }

    public void setNewAuto(Auto auto, int piso, int plaza) {
        if (newAuto[piso - 1][plaza - 1] == null) {
            this.newAuto[piso - 1][plaza - 1] = auto;
        } else {
            System.out.println("El lugar requerido esta ocupado.");
        }
    }

    //retorna el lugar el que se encuentra un numero de patente si es q existe 
    public String getPisoYPlaza(String patente) {
        String aux = "Auto Inexistente.";
        for (int i = 0; i < numPiso; i++) {
            for (int j = 0; j < numPlaza; j++) {
                if (newAuto[i][j] != null && newAuto[i][j].getPatente().equals(patente)) {
                    aux = "El auto se encuentra en el piso " + (i+1) + " y plaza " + (j+1);
                    return aux;
                }
            }
        }
        return aux;
    }
    
    public int getcantAutos(int plaza){
        int cant = 0;
        for(int i=0;i<numPiso;i++){
            for(int j=0;j<numPlaza;j++){
                if(newAuto[i][j] != null && j == (plaza-1)){
                    cant++;
                }
            }
        }
        
        return cant;
    }
    

    @Override
    public String toString() {
        String aux = "Estacionamiento - " + "nombre: " + nombre
                        + ", direccion: " + direccion + ", horaApertura: "
                        + horaApertura + ", horaCierre: " + horaCierre + "\n";
        for(int i=0;i<numPiso;i++){
            for(int j=0;j<numPlaza;j++){
                if(newAuto[i][j] == null){
                    aux += "Libre" + "-";
                } else {
                    aux += newAuto[i][j].toString() + "-";
                }
            }
            aux += "\n";
        }
        return aux;
    }

}
