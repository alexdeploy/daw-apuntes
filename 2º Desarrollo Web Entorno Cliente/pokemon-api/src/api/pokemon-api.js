const url = "https://pokeapi.co/api/v2/pokemon/";

const getSprite = (pokemon) => pokemon.sprites.other['official-artwork'].front_default;

const getSpeciesUrl = (pokemon) => pokemon.species.url

async function getPokemon(name){
    return await fetch(url + name)
        .then(res => res.json())
        .catch(err => console.log(err))
}

/**
 * Obtiene la cadena de evolución del pokemon.
 * @param {*} url devuelta por `getSpeciesUrl(pokemon)`
 * @returns Object.
 */
 async function getEvolutionChain(url){
    return await fetch(url)
        .then(res => res.json())
        .then(res => fetch(res.evolution_chain.url))
        .then(res => res.json())
        .then(res => res.chain)
        .catch(err => console.log(err))
}

/**
 * Obtiene las evoluciones de forma recursiva.
 * @param {*} evolutionChain 
 * @param {*} callback Array vacío
 * @returns Array con {name: ..., url: ...} por cada evolución.
 */
async function getEvolvesTo(evolutionChain, callback){

    callback.push(evolutionChain.species)
    if(!evolutionChain.evolves_to[0]) return callback;
    
    evolutionChain = evolutionChain.evolves_to[0]

    return await getEvolvesTo(evolutionChain, callback)

}

async function getVarietiesSprites(evolutions){
    let result = [];
    await Promise.all(
        evolutions.map(res => fetch(res.url)
            .then(res => res.json())
            .then(res => res.varieties.filter(res => res.is_default == true))
            .then(res => getPokemon(res[0].pokemon.name))
            .then(res => result.push({name: res.name, sprite: getSprite(res)}))
        )
    )
    return result
}

/**
 * 
 * @param {*} name 
 * @returns 
 */
async function search(name){

    let result = {};
    
    await getPokemon(name)
       .then(res => {
           result.name = res.name
           result.sprite = getSprite(res)
           return getSpeciesUrl(res)
        })
        .then(res => {
            return getEvolutionChain(res)
        })
        .then(res => getEvolvesTo(res,[]))
        .then(res => getVarietiesSprites(res))
        .then(res => result.evolution = res)

    return result
}

module.exports = {
    search
}