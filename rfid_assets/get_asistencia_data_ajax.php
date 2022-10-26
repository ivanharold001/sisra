<?php
if (!isset($_GET["timestamp"])) {
    exit("[]");
}
include_once "functions.php";
$date = $_GET["timestamp"];
$data = getAttendanceDataByDate($date);
echo json_encode($data);
