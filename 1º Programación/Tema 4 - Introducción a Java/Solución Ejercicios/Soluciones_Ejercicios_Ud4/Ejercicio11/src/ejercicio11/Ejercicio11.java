/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio11;

import java.io.*;

/**
 *
 * Ejercicio 11: Programa que lee 2 números y muestra el mayor.
 */
public class Ejercicio11 {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));
        int numero1, numero2;

        System.out.print("Introduce el primer número: ");
        numero1 = Integer.parseInt(stdin.readLine()); // Transformamos la entrada en un entero.
        
        System.out.print("Introduce el segundo número: ");
        numero2 = Integer.parseInt(stdin.readLine());
        
        if(numero1 > numero2)
            System.out.println(numero1 + " es mayor que " + numero2);
        else
        {
            if(numero1 == numero2)
                System.out.println("Los números son iguales");
            else
                System.out.println(numero2 + " es mayor que " + numero1);
        }
    }
    
}
