/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package alejandrosorianoprgextra2021;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;



/**
 *
 * @author alexs
 */
public class Pregunta2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        File f = new File("accesos.txt");
        
        grabar(f);
        
        accesos(f);
    }
    
    public static void grabar(File f){
    
        try{
            
        FileWriter fw = new FileWriter(f);
        
        long miliseconds = f.lastModified();
        Date date = new Date(miliseconds);

        /* NO ME FUNCIONA...
        String timeStamp = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.-getInstance().getTime());
        */
        
        } catch (Exception e){
        
        }
    }
    
    public static void accesos(File f){
    
        try {
            
            Scanner sc = new Scanner(f);
            
            int accesos = 1;
            
            if (sc.hasNextLine()) {
                accesos++;
            }else{
            
                System.out.println("Aplicación ejecutada 3 veces.");
            }
            
        } catch (Exception ex) {
            
            ex.printStackTrace();
        }
        
    }
    
}
