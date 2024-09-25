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
public class Alumno extends Persona{
    
    private String NIA;

    public Alumno(int id, String nombre, String NIA) {
        super(id, nombre);
        this.NIA = NIA;
    }

    public String getNIA() {
        return NIA;
    }

    public void setNIA(String NIA) {
        this.NIA = NIA;
    }
    
    @Override
    public String toString(){
    
        return super.toString() + " NIA: " + this.NIA;
        
    }
    
}
