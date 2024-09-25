package com.ceed.modeloexameneva2curso2021;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Paco Aldarias <paco.aldarias@ceedcv.es>
 * 25 abr. 2021 18:18:00
 *
 */
public class Pregunta3 {

   /**
    * @param args the command line arguments
    */
   public static void main(String[] args) {
      // TODO code application logic here

      int c = 1;

      try {
         File f = new File("src/main/java/ficheros/personas.txt");

         Scanner sc = new Scanner(f);

         while (sc.hasNext()) {
            String linea = sc.nextLine();
            String elementos[] = linea.split(";");

            Persona p = new Persona();
            p.setId(Integer.parseInt(elementos[0]));
            p.setNombre(elementos[1]);

            System.out.println(c + ". " + p.getId() + " " + p.getNombre());
            c++;
         }
         sc.close();

      } catch (FileNotFoundException ex) {
         ex.printStackTrace();
      } catch (NumberFormatException ex) {
         System.out.println("Error por de formato en linea " + c);
      }

   }

}
