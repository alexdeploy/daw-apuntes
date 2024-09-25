import fetch from 'node-fetch'
import { getAllEpisodes, getCharacters, getCoincidences, getAllCharacters } from './utils.js'

/**************************************************************************************/

/* searchCharacter function */

async function searchCharacter(characterName){

    const url = "https://rickandmortyapi.com/api/character/?name=" + characterName;

    const character = await fetch(url)
        .then(resp => {
            // Controla el status 404
            if (resp.status == 404) throw new Error("Personaje no encontrado");

            // Controla cualquier status que no sea 200
            if (resp.status !== 200) throw new Error("Error: " + "[" + resp.status + "]");

            // Si ha encontrado el personaje, devuelve un JSON.
            return resp.json();
        })
        .then(resp => {
            // Si hay más de un personaje con ese nombre, devuelve solo el primero.
            if(resp.results.length >= 1) return resp.results[0]
        })
        .catch(err => err);

        return character;
}

/* getCompanions function */

async function getCompanions(characterName){

    const companions = await Promise.all([

        searchCharacter(characterName),
        getAllEpisodes(),
        getAllCharacters()

    ])
    .then(responses => getCoincidences(...responses))
    .then(response => getCharacters(response))

    return companions

}

/**************************************************************************************/

export {
    searchCharacter,
    getCompanions
}