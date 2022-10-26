<?php
include_once "functions.php";
$estudiantes = getEstudiantes();
echo json_encode($estudiantes);