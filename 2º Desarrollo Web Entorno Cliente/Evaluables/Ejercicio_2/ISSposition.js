import fetch from 'node-fetch';

const button = document.getElementById("findISS");

button.addEventListener('click',()=>{

    console.log("Hola feo")

})

/* FUNCIONES */

async function getIssPosition(){
const position = await fetch("http://api.open-notify.org/iss-now.json")
    .then(data => data.json())
    .then(data => console.log(data.iss_position))
    .catch(err => err)

    return position;
}

var position = getIssPosition().then(data => console.log(data));

module.exports (
    button,
    getIssPosition
    )
