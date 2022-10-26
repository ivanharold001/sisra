<?php
if (!isset($_GET["rfid_serial"])) {
    exit("rfid_serial no esta presente.");
}

include_once "functions.php";
removeRfidFromEstudiante($_GET["rfid_serial"]);
