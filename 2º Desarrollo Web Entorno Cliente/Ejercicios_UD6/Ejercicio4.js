let double = (x) => x*2;
let add3 = (x) => x+3;

function doublePipe(...params){

    return function(x){
       params.map(funcion => x = funcion(funcion(x))) // 'x' se utiliza como acumulador.
       return x
    }
}

let multiplyPerFourAndAddSix = doublePipe(double, add3);

console.log(multiplyPerFourAndAddSix(10)) // 46 = (10*2*2+3+3)

let addSixAndMultiplyPerFour = doublePipe(add3,double);

console.log(addSixAndMultiplyPerFour(10)); // 64 = (10+3+3)*2*2