/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evaluable1;
import java.util.Scanner;
/**
 *
 * @author alexs
 */
public class Evaluable1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int num;
        System.out.println("Introduce un número: ");
        Scanner sc = new Scanner (System.in);
        num = sc.nextInt();
        do{
            if (num%2 == 0){
            num = num/2;
            } else {num = num*3 + 1;}
            System.out.print(num + ", ");
        } while (num != 1);
    }
    
    
}
