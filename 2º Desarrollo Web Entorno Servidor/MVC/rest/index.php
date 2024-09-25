<?php

header('Content-Type: application/json');

/**
 * Respuesta de error
 */

function error($message){
    $response = array(
        'tipo' => 'error',
        'msj' => $message
    );
    return $response;
}

/**
 * Conectar a la base de datos.
 */
function connect_db(){

    $dbName = 'nba';
    $user = 'root';
    $password = '';

    try{
        $conn = new PDO('mysql:host=localhost;dbname=' . $dbName, $user, $password);
    }catch(PDOException $e){
        return $e->getMessage();
    }
    return $conn;
}

/**
 * Crear URL para HATEOAS
 */

function url($segmento){
    if(isset($_SERVER['HTTPS'])){
        $protocol = ($_SERVER['HTTPS'] && $_SERVER['HTTPS'] != 'off') ? "https" : "http";
    }else{
        $protocol = 'http';
    }
    return $protocol . '://' . $_SERVER['HTTP_HOST'] . $segmento;
}



function listar(){

    $table = '';
    $jugadores = array();
    $sql = "SELECT j.*, e.Ciudad, e.Conferencia, e.Division, e.Nombre AS Nombre_equipo FROM `jugadores` AS j INNER JOIN equipos AS e ON j.ID_equipo=e.id";

    try{
        $db = connect_db();
        $statement = $db->prepare($sql);
        $statement->execute();

        foreach($statement->fetchAll(PDO::FETCH_ASSOC) as $row){
            $data = array(
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
                    "division" => $row['Division']
                ),
            "url" => url("apirest/index.php?opcion=obtener&id=" . $row["id"])
            );
            array_push($jugadores,$data);
        }
    }catch(PDOException $e){
        return $e->getMessage();
    }
    return $jugadores;
}

function obtener($id){

    $jugador = array();
    $sql = 'SELECT j FROM jugadores WHERE id=:id';

    try{
        $db = connect_db();
        
        $statement = $db->prepare($sql);
        $statement->bindParam(':id',$id);
        $statement->execute();

        foreach($statement->fetchAll(PDO::FETCH_ASSOC) as $row){

            $data = array(
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
                "url" => url("apirest/index.php?option=obtener&id=" . $row['id'])
            );
            array_push($jugador,$data);
        }
    }catch(PDOException $e){
        return error($e->getMessage());
    }
    return $jugador;
}



if($_GET['opcion'] == 'listar'){
    echo  json_encode(listar());
}elseif($_GET['opcion'] == 'obtener'){
    return json_encode(obtener($_GET['id']));
}else{
    json_encode(error('No se ha especificado el parámetro.'));
}

?>