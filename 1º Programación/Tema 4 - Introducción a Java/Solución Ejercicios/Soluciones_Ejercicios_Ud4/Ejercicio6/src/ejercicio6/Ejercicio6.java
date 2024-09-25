/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio6;

import java.io.*;


/**
 *
 * Ejercicio 6: Programa que dado el precio de un artículo y el precio
 *              de venta real nos muestre el porcentaje de descuento realizado.
 */
public class Ejercicio6 {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));
        String entrada;
        
        float precioArticulo, precioVenta, descuento;

        System.out.print("Introduce el precio del articulo: ");
        entrada = stdin.readLine();
        precioArticulo = Float.parseFloat(entrada);
        
        System.out.print("Introduce el precio de venta: ");
        entrada = stdin.readLine();
        precioVenta = Float.parseFloat(entrada);
        
        // No se controla que el precio de venta sea mayor.
        
        descuento = ((precioArticulo - precioVenta) * 100) / precioArticulo;
        
        System.out.println("El descuento es " + descuento);
    }
    
}
