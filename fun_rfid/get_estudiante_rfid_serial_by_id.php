<?php
if (!isset($_GET["employee_id"])) {
    exit("Estudiante no existe.");
}
include_once "functions.php";
$estudiante = getEstudianteRfidById($_GET["employee_id"]);
$serial = "";
if ($estudiante) {
    $serial = $estudiante->rfid_serial;
}
echo json_encode($serial);