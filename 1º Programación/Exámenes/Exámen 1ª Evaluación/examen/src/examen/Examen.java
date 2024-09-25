/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examen;
import java.io.File;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.util.Scanner;
/**
 *
 * @author alexs
 */
public class Examen {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        
        File alumnos = new File("alumnos.txt");
      
        
        Alumno a1 = new Alumno(1,"Felipe Garcia","a2");
        Alumno a2 = new Alumno(2,"Paco Aldarias","b2");

        leerYMostrar(alumnos);
        /*
        System.out.println(a1.toString());
        System.out.println(a2.toString());
        */
    }
    
    public static void grabar(Alumno a){
    
        String fichero = "alumnos.txt";
        File f = new File(fichero);
        
        try {
            
            FileWriter fw = new FileWriter(fichero, true);
            
            int id = a.getId();
            String nombre = a.getNombre();
            String NIA = a.getNIA();
            
            fw.write(id + ";");
            fw.write(nombre + ";");
            fw.write(NIA);
            fw.write("\n");
            fw.close();
            
        } catch (IOException ex) {
            
            ex.printStackTrace();
        }
        
    }
    
    public static void leerYMostrar(File f){
    
        try {
            
            Scanner sc = new Scanner(f);
            
            String[] alumno = sc.nextLine().split(";");
            sc.next();
            int id = Integer.parseInt(alumno[0]);
            String nombre = alumno[1];
            String NIA = alumno[2];
            System.out.println(id + " " + nombre + " " + NIA);
            
        } catch (FileNotFoundException e) {
            System.err.println("Archivo no encontrado.");
        } catch (ArrayIndexOutOfBoundsException e){
            System.err.println("Array fuera de posición.");
        }
        
        
        
        
    }
    
}
