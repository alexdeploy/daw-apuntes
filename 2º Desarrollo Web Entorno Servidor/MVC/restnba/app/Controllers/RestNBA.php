<?php
namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;
use App\Models\JugadorModel;
use App\Models\EquipoModel;

class RestNBA extends ResourceController {

    protected $modelName = 'App\Models\JugadorModel';
    protected $format = 'json';

    /**
    * Funciónn que nos devuelve el estado de la petición, en cado de error muestra un mensaje
    */
    private function genericResponse($data, $msj, $code){

        if ($code == 200) {
            return $this->respond(array(
            "data" => $data,
            "code" => $code
        )); //, 404, "No hay nada"
        } else {
            return $this->respond(array(
                "msj" => $msj,
                "code" => $code
            ));
        }
    }
    /**
    * Función donde obtenemos el base_url
    */
    private function url($segmento){

        if(isset($_SERVER['HTTPS'])){
            $protocol = ($_SERVER['HTTPS'] && $_SERVER['HTTPS'] != "off") ? "https" : "http";
        }else{
            $protocol = 'http';
        }

        return $protocol . "://" . $_SERVER['HTTP_HOST'] . $segmento;
    }

    private function map($data){

        $jugadores = array();

        foreach($data as $row){
        $jugador = array(
        "id" => $row['id'],
        "nombre" => $row['Nombre'],
        "anyo_inicio" => $row['Anyo_Inicio'],
        "anyo_fin" => $row['Anyo_Fin'],
        "posicion" => $row['Posicion'],
        "altura" => $row['Altura'],
        "peso" => $row['Peso'],
        "nacimiento" => $row['Nacimiento'],
        "procedencia" => $row['Procedencia'],
        "equipo" => array(
        "id" => $row['ID_equipo'],
        "nombre" => $row['Nombre_equipo'],
        "ciudad" => $row['Ciudad'],
        "conferencia" => $row['Conferencia'],
        "division" => $row['Division'],
        ),
        "links" => array(
        array("rel" => "self","href" =>
        $this->url("/restnba/".$row['id']),"action" => "GET", "types"
        =>["text/xml","application/json"]),
        array("rel" => "self","href" =>
        $this->url("/restnba/".$row['id']), "action"=>"PUT", "types" =>
["application/x-www-form-urlencoded"]),
array("rel" => "self","href" =>
$this->url("/restnba/".$row['id']), "action"=>"PATCH" ,"types" =>
["application/x-www-form-urlencoded"]),
array("rel" => "self","href" =>
$this->url("/restnba/".$row['id']), "action"=>"DELETE", "types"=> [] )
)
);
array_push($jugadores, $jugador);
}
return $jugadores;
}
// OPERACIONES TIPO GET: nos devuelve todos los datos o un único dato filtrado por id
public function index()
{
$data = $this->model->getAll();
$jugadores = $this->map($data);
return $this->genericResponse($jugadores, null, 200);
}
public function show($id = null)
{
$data = $this->model->get($id);
$jugador = $this->map($data);
return $this->genericResponse($jugador, null, 200);
}
// OPERACIONES TIPO POST: crea un nuevo recurso, en este caso un nuevo jugador
public function create()
{
$jugadores = new JugadorModel();
$equipos = new EquipoModel();
if ($this->validate('jugadores')) {
if (!$this->request->getPost('ID_equipo'))
return $this->genericResponse(null, array("ID_equipo" => "No
se ha pasado el id del equipo por parámetro"), 500);
if (!$equipos->get($this->request->getPost('ID_equipo'))) {
return $this->genericResponse(null, array("ID_equipo" => "El
equipo no existe"), 500);
}
$id = $jugadores->insert([
'Nombre' => $this->request->getPost('Nombre'),
'ID_equipo' => $this->request->getPost('ID_equipo'),
'Anyo_Inicio' => $this->request->getPost('Anyo_Inicio'),
'Anyo_Fin' => $this->request->getPost('Anyo_Fin'),
'Posicion' => $this->request->getPost('Posicion'),
'Altura' => $this->request->getPost('Altura'),
'Peso' => $this->request->getPost('Peso'),
'Nacimiento' => $this->request->getPost('Nacimiento'),
'Procedencia' => $this->request->getPost('Procedencia')
]);
//Internamente $this->model hace referencia a $modelName =
'App\Models\JugadorModel';
return $this->genericResponse($this->model->find($id), null,
200);
}
//Hemos creado validaciones en el archivo de configuración Validation.php
$validation = \Config\Services::validation();
//Si no pasa la validación devolvemos un error 500
return $this->genericResponse(null, $validation->getErrors(), 500);
}
// OPERCIONES TIPO PUT O PATCH: actualización de un recurso
public function update($id = null)
{
$jugadores = new JugadorModel();
$equipos = new EquipoModel();
//Al ser un método de tipo PUT o patch debemos recoger los datos usando el método getRawInput
$data = $this->request->getRawInput();
if ($this->validate('jugadores')) {
if (!$data['ID_equipo'])
return $this->genericResponse(null, array("ID_equipo" => "No
se ha pasado el id del equipo por parámetro"), 500);
if (!$jugadores->get($id)) {
return $this->genericResponse(null, array("id" => "El
jugador no existe"), 500);
}
if (!$equipos->get($data['ID_equipo'])) {
return $this->genericResponse(null, array("ID_equipo" => "El
equipo no existe"), 500);
}
$jugadores->update($id, [
'Nombre' => $data['Nombre'],
'ID_equipo' => $data['ID_equipo'],
'Anyo_Inicio' => $data['Anyo_Inicio'],
'Anyo_Fin' => $data['Anyo_Fin'],
'Posicion' => $data['Posicion'],
'Altura' => $data['Altura'],
'Peso' => $data['Peso'],
'Nacimiento' => $data['Nacimiento'],
'Procedencia' => $data['Procedencia'],
]);
return $this->genericResponse($this->model->find($id), null,
200);
}
}
// OPERACIONES DELETE: borrado de un recurso
public function delete($id = null)
{
$jugadores = new JugadorModel();
$jugadores->delete($id);
return $this->genericResponse("Jugador eliminado", null, 200);
}
}