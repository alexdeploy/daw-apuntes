/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examen;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 *
 * @author alexs
 */
public class Ficheros implements Almacen {

    
    private final String fichero = "alumnos.txt";
    
    
    
    @Override
    public void grabar(Alumno a) {
        
        File f = new File(fichero);
        
        try {
            
            FileWriter fw = new FileWriter(fichero);
            
            int id = a.getId();
            String nombre = a.getNombre();
            String NIA = a.getNIA();
            
            fw.write(id);
            fw.write(nombre);
            fw.write(NIA);
            fw.write("/n");
            fw.close();
            
        } catch (IOException ex) {
            
            ex.printStackTrace();
        }
        
    }

    
    
}
