/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evaluable2;

/**
 *
 * @author alexs
 */
public class Evaluable2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Creo las palabras de la sopa de letras.
        String palabra = "PACO";
        String palabra2 = "JUAN";
        String palabra3 = "ANTONIO";
        String palabra4 = "GLADYS";
        String palabra5 = "LAURA";
        String palabra6 = "RODOLFO";
        String palabra7 = "FLOR";
        String palabra8 = "DIEGO";
        String palabra9 = "FEREDICO";
        String palabra10 = "DOLORES";
        String palabra11 = "MANUEL";
        String palabra12 = "RAMONA";
        String palabra13 = "ROSANA";
        String palabra14 = "FIDEL";
        String palabra15 = "ISABEL";
        
        
        
        // Creo la matriz 15x15 y le asigno letras aleatorias.
        char[] letras = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','Ñ','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
        char[][] sopaDeLetras = new char[15][15];
        for (int i = 0; i < sopaDeLetras.length; i++) {
            for (int j = 0; j < sopaDeLetras[i].length; j++) {
                sopaDeLetras[i][j] = letras[(int) (Math.random() * 15)];
            }
        }
        // Agregar palabras en posiciones aleatorias. (incompleto)
        int fila = (int) (Math.random() * 15);
        int columna = (int) (Math.random() * 15);
        boolean enHorizontal;
        boolean enVertical;
        
        // Imprimo la matriz
        for (int i = 0; i < sopaDeLetras.length; i++) {
            for (int j = 0; j < sopaDeLetras.length; j++) {
                System.out.print(" " + sopaDeLetras[i][j] + " ");
            }
            System.out.println("");
        }
    }

    
}
