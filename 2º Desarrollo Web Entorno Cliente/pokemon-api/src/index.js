import "./styles.css";
import 'regenerator-runtime'
import Pokemon from "./models/Pokemon";

// dom elements
const search_btn = document.getElementById('search');
const input = document.getElementById('pokemon-name');
const pokemon_details = document.getElementById('pokemon-details');
const results = document.getElementById('results');
const evolution_data = document.getElementById('evolution-data');

// events
search_btn.addEventListener('click', (event) => {
    event.preventDefault();

    // input data
    const name = input.value;

    //pokemon instance
    const pokemon = new Pokemon(name)

    // get data -> generate result
    pokemon.getData().then(res => {

        results.classList.remove('hidden')

        const title = document.createElement('h2');
        const img = document.createElement('img')
        img.setAttribute('src',res.sprite)

        pokemon_details.appendChild(title).innerHTML = res.name;
        pokemon_details.appendChild(img)

        let i = 0;

        res.evolution.map(res => {

            if(i > 0) {
                let subtitle = document.createElement('p')
                subtitle.innerHTML = 'Evolves to...';
                evolution_data.appendChild(subtitle)
            }

            let evolution_details = document.createElement('div')
            evolution_details.classList.add('evolution_details');
            evolution_data.appendChild(evolution_details);

            let title = document.createElement('h2');
            evolution_details.appendChild(title)
            title.innerHTML = res.name

            let img = document.createElement('img')
            img.setAttribute('src', res.sprite)
            img.setAttribute('id','pokemon_image')
            evolution_details.appendChild(img)
            
            i++
        })
        

    })
})
