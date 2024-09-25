/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tcv_5_2;

import java.util.Arrays;


public class Alumno {
    private String nombre;
    private String apellido;
    private String codigo;
    private double[] notas;
    
    /*
        Constructor con parámetros.
        Cuidado al copiar el vector notas, no se debe hacer 'this.notas = notas' ya que se copian referencias de
        memoria. Recordad que se debe utilizar el método 'arraycopy' visto en la unidad 7.
    */
    public Alumno(String nombre, String apellido, double[] notas){
        this.nombre = nombre;
        this.apellido = apellido;
        this.codigo = generarCodigo();
        this.notas = new double[5];
        System.arraycopy(notas, 0, this.notas, 0, notas.length); 
    }
    
    /*
        Constuctor por defecto.
    */
    public Alumno(){
        this.nombre = "";
        this.apellido = "";
        this.codigo = "";
        this.notas = new double[5]; 
        
        for(int i = 0; i < this.notas.length; i++)
            this.notas[i] = 0;
        
        // También podéis utilizar el método 'fill' de la clase Arrays en lugar del for.
        // Arrays.fill(notas, 0);
    }
    
    /*
        Método para generar el código a partir del nombre, apellido y un número aleatorio entre 0 y 100.
        Este método debe ser privado ya que sólo debe ser utilizado en esta clase.
    */
    private String generarCodigo(){
        String cod;
        
        cod = this.nombre.substring(0, 1) + this.apellido.substring(0, 1) + String.valueOf((int)Math.floor(Math.random() * (100 - 0 + 1) + 0));
        
        return cod;
    }
    
    /*
        Método para calcular la media de las notas.
    */
    public double calcularMedia(){
        int i;
        double suma = 0, media;
        
        for(i = 0; i < this.notas.length; i++)
            suma = suma + this.notas[i];
        
        media = suma / this.notas.length;
        
        return media;
    }
    
    /*
        Método para mostrar la información del alumno.
    */
    public void mostrarAlumno(){
        System.out.println("Nombre: " + this.nombre);
        System.out.println("Apellido: " + this.apellido);
        System.out.println("Codigo: " + this.codigo);
        System.out.print("Notas: ");
        
        for(int i = 0; i < this.notas.length; i++){
            System.out.print(this.notas[i] + " ");
        }
        
        System.out.println();
    }

    /*
        Métodos get y set
    */
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCodigo() {
        return codigo;
    }

    public double[] getNotas() {
        return notas;
    }

    /*
        Al igual que en el constructor se debe utilizar el método 'arraycopy' para la copia del vector.
    */
    public void setNotas(double[] notas) {
        System.arraycopy(notas, 0, this.notas, 0, notas.length);
    }
}
