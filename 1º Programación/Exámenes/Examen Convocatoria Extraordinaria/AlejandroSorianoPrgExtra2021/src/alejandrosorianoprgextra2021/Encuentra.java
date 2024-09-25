/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package alejandrosorianoprgextra2021;

import java.util.Scanner;

/**
 *
 * @author alexs
 */
public class Encuentra implements Acciones {
    
    final int maximo = 10;
    int aleatorio;
    int numero = 0;
    int intentos;

    @Override
    public void empezar() {
        
        aleatorio = 1 + (int) (Math.random() * maximo);
        
    }

    @Override
    public void jugar() {
        
        Scanner sc = new Scanner(System.in);
        
        System.out.println("Adivina un numero entre 1 y " + maximo + ":");
        
        
        do{
            numero = sc.nextInt();
            
            if (numero > aleatorio) {
                System.out.println("El numero es mayor.");
            }
            if (numero < aleatorio) {
                System.out.println("El numero es menor.");
            }
            intentos++;
        
        }while(numero!=aleatorio);
        
        System.out.println("Has acertado!");
    }
    
    @Override
    public void terminar() {
        
        System.out.println("Encontrado el numero despues de: " + intentos + " intentos");
        
    }
    
}
