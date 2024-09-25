
function createIDGenerator(n){

    let id = 0; // ID Scope
    
    return function generarCadena(){
        let cadena = "";
        // Crea la longitud de la cadena.
        for (let i = 1; i < n; i++) {
            cadena += "0"
        }
        // Incrementa ID
        id++
        return cadena + id;
    }
}

const len3Id = createIDGenerator(3);

console.log(len3Id()); // 001
console.log(len3Id()); // 002

const len5Id = createIDGenerator(5);

console.log(len5Id()); // 00001
console.log(len5Id()); // 00002
console.log(len5Id()); // 00003
