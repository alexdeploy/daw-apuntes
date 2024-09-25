import {suma, resta, division, multiplicacion} from '../src/controller.js';

describe('Operaciones',()=> {

    test('Suma dos numeros',()=> {

        let num1 = 5;
        let num2 = 10;

        let resultado = suma(num1,num2);

        expect(resultado).toEqual(15);

    });

    test('Resta dos numeros',()=> {

        let num1 = 10;
        let num2 = 5;

        expect(resta(num1,num2)).toEqual(5);

    });

    test('Divide dos numeros',()=> {

        let num1 = 20;
        let num2 = 10;

        expect(division(num1,num2)).toEqual(2);
    });

    test('Multiplica dos numeros',()=> {

        let num1 = 10;
        let num2 = 25;

        expect(multiplicacion(num1,num2)).toEqual(250);

    })
})