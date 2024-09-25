
/**
 * Para que sea una función pura...
 * 
 * No tiene efectos colaterales: No altera variables externas.
 * 
 * Depender de variables globales es un indicador de función impura, por eso MINIMUM la he movido a el interior de la función.
 */

function mergeValues(arrayOfIntegers) {

    const MINIMUM = 15;

    let result = arrayOfIntegers.reduce((element, sum) => element + sum);

    result = Math.max(result, MINIMUM);

    return [result];
}

// Creo las variables para comprobar posteriormente si se modifican.
let data = [10,20,30,40]
let data2 = [1,2,3,4]

console.log(mergeValues(data)) // [100]
console.log(mergeValues(data2)) // [15] (MINIMUM)

// Comprobar si se ha modificado el array original (NO)
console.log(data);
console.log(data2);
