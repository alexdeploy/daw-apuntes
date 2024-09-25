
function map(array, funcion){

    let result = [];

    array.reduce((acc, n) => result.push(funcion(n)),0)

    return result
}

const res = map([1,2,3], x => x * 2);

console.log(res); // [2,4,6]