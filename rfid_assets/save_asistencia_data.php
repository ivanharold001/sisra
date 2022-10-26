<?php
include_once "functions.php";
$payload = json_decode(file_get_contents("php://input"));
if (!$payload) exit("No hay datos presentes");
$response = saveAttendanceData($payload->date, $payload->student);
echo json_encode($response);
