import fetch from 'node-fetch'

/*
* Hace una petición a 'https://rickandmortyapi.com/api/episode'
*
* @return los datos de los episodios (primera página)
*/

async function getAllEpisodes(){

    console.log("Obteniendo todos los episodios...")

    const url = 'https://rickandmortyapi.com/api/episode'

    return await fetch(url)
        .then(data => data.json())
        .then(data => data.results)

}

/*
* Busca los datos de los episodios en los que ha salido el personaje.
*
* @param responses Las respuestas de las promesas paralelas (Los datos del personaje y los datos de todos los episodios)
*
* @return los datos de los episodios que coinciden con los episodios en los que sale el personaje
*/
async function getCoincidences(...responses){

    console.log("Obteniendo coincidencias de episodios...")
        
    let characterEpisodes = responses[0].episode;
    let allEpisodes = responses[1];

    return characterEpisodes.map(element => allEpisodes.filter(episode => episode.url == element))

}

/*
* 
*/
async function getCharacters(responses){

    console.log("Obteniendo los personajes con los que coincide...")

    let companionsArray = []
    let arrayHelper = []

    responses.map(response => response.map(data => arrayHelper.push(data)))

    arrayHelper.forEach(data => data.characters.map(character => companionsArray.push(character)))

    let companionsUnique = [...new Set(companionsArray)]

  return companionsUnique

}

async function getAllCharacters(){
    
    const url = "https://rickandmortyapi.com/api/character"

    return await fetch(url)
        .then(data => data.json())
        .then(data => data.results)
}


export {
    getAllEpisodes,
    getCharacters,
    getCoincidences,
    getAllCharacters
}