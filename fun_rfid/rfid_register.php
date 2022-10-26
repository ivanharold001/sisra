<?php
include_once "functions.php";
if (!isset($_GET["serial"])) {
    exit("serial no esta presente.");
}
onRfidSerialRead($_GET["serial"]);
