// ELEMENTOS

const display = document.getElementById("display");
const buttons = document.getElementsByClassName("calc-button");
const log = document.getElementsByTagName("p");

var operation = [];

for (let i = 0; i < buttons.length; i++) {

    const element = buttons[i];

    let action = element.getAttribute('data-action');

    switch(action){

        case "+":
            element.addEventListener("click", () => sumarORestar(element));
            break;
        case "-": 
            element.addEventListener("click", () => sumarORestar(element))
            break;
        case "=":
            element.addEventListener("click", result);
            break;
        case "C":
            element.addEventListener("click", () => deleteOperation(element));
            break;
        case "AC":
            element.addEventListener("click", () => deleteOperation(element));
            break;
        case ".":
            // Está roto.
            break;
        case (action):
            element.addEventListener("click", () => addToDisplay(element));
            break;
    };

};

// FUNCIONES.

function sumarORestar(element){

    let valor = display.textContent;
    let operador = element.getAttribute('data-action');
    let ultimoValor = valor.charAt(valor.length -1);

    // Si el último valor es un número añade el operador, sino no.
    if(parseInt(ultimoValor)){
        display.textContent += operador; 
    }else{
        valor = valor;
    }

    /*
    let pos = 0;

    operation.push(valor);
    operation.push(operador);

    if(parseInt(valor)){
        log[pos].innerHTML = operador;
    }
    */
};

function addToDisplay(element){

    let valor = element.getAttribute('data-action');

    // Si hay un 0, se sustituye.
    if(display.textContent == 0){

        display.textContent = valor;

    }else{
        // Si no es un 0, se van añadiendo.
        display.textContent = display.textContent + valor;
    }

    /*
    let ultimoClick = operation[operation.length-1];
    
    if(ultimoClick == "+" || ultimoClick == "-"){

        display.textContent = valor;
        console.log("Ha reconocido el signo");
    }
    */
};

function result(){

    let cadena = "";

    operation.push(parseInt(display.textContent));
    
    for (let i = 0; i < operation.length; i++) {
        cadena += operation[i];
    }

    console.log(cadena + " = ");

    // Sustituir display por el valor del resultado de la operación.

    // Resetea la operación.
    operation = [];

}

function deleteOperation(element){

    let action = element.getAttribute("data-action");

    if(action == "C"){

        //Borra el display
        display.textContent = 0;

    } else {

        // Borra el display
        display.textContent = 0;

        // Borra el Log
        for (let i = 0; i < log.length; i++) {
            log[i].innerHTML = "";
        }

        operation = [];
    }

    

}

