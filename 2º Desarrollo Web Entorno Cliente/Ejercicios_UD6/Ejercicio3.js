
// Función lazyMultiply
const lazyMultiply = (a) => (b) => a * b;

// Pasando un solo parámetro -> Devuelve una función
const perTwo = lazyMultiply(2) // [Function (anonymous)]

// Pasando un segundo parámetro -> Devuelve el resultado
perTwo(3) // [6]

// -------------

// Pasando dos parámetros -> Devuelve el resultado.
const fourPerFive = lazyMultiply(4)(5)

console.log(fourPerFive) // [20]