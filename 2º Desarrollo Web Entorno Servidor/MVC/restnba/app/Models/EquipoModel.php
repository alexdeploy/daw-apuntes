<?php namespace App\Models;
use CodeIgniter\Model;
class EquipoModel extends Model
{
protected $table = 'equipos';
protected $primaryKey = 'id';
protected $allowedFields = ['Nombre', 'Ciudad',
'Conferencia','Division'];
/**
* Obtenemos un único equipo
*/
public function get($id){
$sql = "SELECT * FROM `equipos` WHERE equipos.id=:id:";
$query = $this->query($sql, [
'id' => $id,
]);
return $query->getResult('array');
}
}
