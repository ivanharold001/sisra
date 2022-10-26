<?php
if (!isset($_GET["employee_id"])) {
    exit("estudiante_id es requerido.");
}
include_once "functions.php";
$estudianteId = $_GET["employee_id"];
setReaderForEstudiantePairing($estudianteId);