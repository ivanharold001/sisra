<?php
if (!isset($_GET["student_id"])) {
    exit("estudiante_id es requerido.");
}
include_once "functions.php";
$estudianteId = $_GET["student_id"];
setReaderForEstudiantePairing($estudianteId);