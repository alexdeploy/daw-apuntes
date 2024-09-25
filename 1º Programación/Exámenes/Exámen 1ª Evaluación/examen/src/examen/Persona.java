/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examen;

/**
 *
 * @author alexs
 */
public class Persona {
    
    private int id;
    private String nombre;

    // ENCAPSULA LOS DATOS
    public Persona(int id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }
    // GETTERS Y SETTERS
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    // FUNCIÓN TOSTRING: Se implementa en Alumno.java
    @Override
    public String toString(){
    
        return "ID: " + this.id + " Nombre: " + this.nombre;
    }
    
}
