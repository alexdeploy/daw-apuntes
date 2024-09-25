const fetch = require("node-fetch");

/* import fetch from "node-fetch"; */

const pokemon = fetch(" https://pokeapi.co/api/v2/pokemon/bulbasaur")
    .then(res => res.json())

async function movimientos(){

    let movimientos= []
    try{
        await pokemon.then(res => {
            res.moves.map(moves => movimientos.push(moves.move.name))
        })    
    }catch(error){
        console.log(error)
    }
    return movimientos
}

/* const moviments = await movimientos() */

/* console.log(moviments); */

module.exports = movimientos