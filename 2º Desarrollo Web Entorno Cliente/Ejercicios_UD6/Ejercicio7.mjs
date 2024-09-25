import fetch from 'node-fetch'

const pokemon = await fetch("https://pokeapi.co/api/v2/evolution-chain/1")
    .then(res => res.json())
    .then(res => res.chain)
    

const getName = pokemon => pokemon.species.name.charAt(0).toUpperCase() + pokemon.species.name.slice(1);
const getEvolution = pokemon => pokemon.evolves_to[0];
const convertToString = array => array.join('-');

function getPokemonAndEvolutions(pokemon){

    let evolutions = [getName(pokemon)]; // Guardo el pokemon principal

    return function hasEvolution(){
        let evolution = getEvolution(pokemon); // Obtengo la evolución del pokemon.
        if(!evolution) return evolutions; // Si no hay, devuelve 'evolutions'
        evolutions.push(getName(evolution)); // Si hay, lo guarda en 'evolutions'
        pokemon = evolution;
        return hasEvolution();
    }
}

const resultado = getPokemonAndEvolutions(pokemon) //  [ 'Bulbasaur', 'Ivysaur', 'Venusaur' ]

console.log(convertToString(resultado())); // Bulbasaur-Ivysaur-Venusaur

