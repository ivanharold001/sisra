<?php
if (!isset($_GET["student_id"])) {
    exit("Estudiante no existe.");
}
include_once "functions.php";
$estudiante = getEstudianteRfidById($_GET["student_id"]);
$serial = "";
if ($estudiante) {
    $serial = $estudiante->rfid_serial;
}
echo json_encode($serial); // no afecta