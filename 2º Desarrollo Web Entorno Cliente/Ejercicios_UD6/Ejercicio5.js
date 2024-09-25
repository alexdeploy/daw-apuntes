let direcciones = [
    {
    // Válido
    pais: 'España', region: '', cp: '46014',
    ciudad: 'Valencia', direccion: 'Carrer Misericòrdia, 34',
    complemento: '',
    movil: '', fijo: '961 20 69 90'
    },
    {
    // Inválido: no tiene movil o fijo
    pais: 'España', region: '', cp: '46960',
    ciudad: 'Aldaia', direccion: 'C/ Montcabrer, 22',
    complemento: 'Pol. Ind. La Lloma',
    movil: '', fijo: ''
    },
    {
    // Inválido: no tiene país
    pais: '', region: 'Alicante', cp: '',
    ciudad: 'Petrer', direccion: 'Los Pinos, 7',
    complemento: '',
    movil: '', fijo: '965 37 08 88'
    }
]

/**
* Debe tener informados el país, la ciudad y la dirección
* Debe tener informado o el móvil o el fijo
* Debe incluir una región o un código postal (cp)
*/

let paisCiudadODireccion = element => element.ciudad && element.pais && element.direccion !== "";
let movilOFijo = element => element.movil || element.fijo !== "";
let regionOCp = element => element.region || element.cp !== "";

// Option 1
let validarCampos = element => paisCiudadODireccion(element) && movilOFijo(element) && regionOCp(element);

const res1 = direcciones.filter(validarCampos);

console.log(res1);

// Option 2
const res2 = direcciones.filter(paisCiudadODireccion).filter(movilOFijo).filter(regionOCp);

console.log(res2);

// ¿Cual sería más apropiada?