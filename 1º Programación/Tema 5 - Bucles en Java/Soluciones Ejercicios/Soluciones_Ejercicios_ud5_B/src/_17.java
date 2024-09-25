//17.-Diseña un algoritmo que lea y acepte únicamente aquellos 
//que sean mayores que el último dado correctamente. 
//La introducción de números finaliza con la introducción
//de un 0. Al final se mostrará:
//a. El total de números introducidos, excluído el 0.
//b. El número de fallos cometidos.

import java.util.Scanner;

public class _17 {

    public static void main(String[] args) {
        int n, total = 0, fallos = 0, ant = 0;
        String aceptados = "";

        Scanner sc = new Scanner(System.in);
        do {
            System.out.print("Dime un número: ");
            n = sc.nextInt();

            if (n <= ant && n != 0) {
                fallos++;
                total++;

            }

            if (aceptados == "") {
                ant = n;
                aceptados += Integer.toString(n) + ", ";;
                total++;
            }

            if (n > ant) {
                ant = n;
                aceptados += Integer.toString(n) + ", ";
                total++;

            }

        } while (n != 0);

        System.out.println("Los números aceptados son:" + aceptados);
        System.out.println("Total de números introducidos: " + total);
        System.out.println("Fallos: " + fallos);
    }

}
