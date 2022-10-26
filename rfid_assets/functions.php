<?php
if (!defined("RFID_STATUS_FILE")) {
    define("RFID_STATUS_FILE", "rfid_status");
}
if (!defined("RFID_STATUS_READING")) {
    define("RFID_STATUS_READING", "r");
}
if (!defined("RFID_STATUS_PAIRING")) {
    define("RFID_STATUS_PAIRING", "p");
}
if (!defined("PAIRING_EMPLOYEE_ID_FILE")) {
    define("PAIRING_EMPLOYEE_ID_FILE", "pairing_employee_id_file");
}
/******************************/
function getEstudiantesWithRfid()
{
    $query = "SELECT student_id, rfid_serial FROM rfid_estudiante";
    $db = getDatabase();
    $statement = $db->query($query);
    return $statement->fetchAll();
}

/*****************************/
function onRfidSerialRead($rfidSerial)
{
    if (getReaderStatus() === RFID_STATUS_PAIRING) {
        pairEstudianteWithRfid($rfidSerial, getPairingEstudianteId());
        setReaderStatus(RFID_STATUS_READING);
    } else {
        $estudiante = getEstudianteByRfidSerial($rfidSerial);
        if ($estudiante) {
            saveEstudianteAttendance($estudiante->student_id);
        }
    }
}
function deleteEstudianteAttendanceByIdAndDate($employeeId, $date)
{
    $query = "DELETE FROM attendance where student_id = ? and date = ?";
    $db = getDatabase();
    $statement = $db->prepare($query);
    return $statement->execute([$employeeId, $date]);
}

/***************************ojo*/
// funcion para almacenar la hora de entrada
function saveEstudianteAttendance($employeeId)
{
    // para calibrar la Zona Horaria
    date_default_timezone_set('America/Santo_Domingo');
    //$time = date('h:i:s A');
    $time = date('h:i A', time());

    $date = date("Y-m-d");
    deleteEstudianteAttendanceByIdAndDate($employeeId, $date);
    $status = "presence";
    $query = "INSERT INTO attendance(student_id, date, status) VALUES (?, ?, ?)";
    $db = getDatabase();
    $statement = $db->prepare($query);
    return $statement->execute([$employeeId, $date, $status]);
}


/*****************************/
function setReaderForEstudiantePairing($employeeId)
{
    setReaderStatus(RFID_STATUS_PAIRING);
    setPairingEstudianteId($employeeId);
}

function setPairingEstudianteId($employeeId)
{
    file_put_contents(PAIRING_EMPLOYEE_ID_FILE, $employeeId);
}

function getPairingEstudianteId()
{
    return file_get_contents(PAIRING_EMPLOYEE_ID_FILE);
}

/***********************/
function pairEstudianteWithRfid($rfidSerial, $employeeId)
{
    removeRfidFromEstudiante($rfidSerial);
    $query = "INSERT INTO rfid_estudiante(student_id, rfid_serial) VALUES (?, ?)";
    $db = getDatabase();
    $statement = $db->prepare($query);
    return $statement->execute([$employeeId, $rfidSerial]);
}
/***********************/
function removeRfidFromEstudiante($rfidSerial)
{
    $query = "DELETE FROM rfid_estudiante WHERE rfid_serial = ?";
    $db = getDatabase();
    $statement = $db->prepare($query);
    return $statement->execute([$rfidSerial]);
}

/***********************/
function getEstudianteByRfidSerial($rfidSerial)
{
    $query = "SELECT e.student_id, e.name FROM student e INNER JOIN rfid_estudiante
    ON rfid_estudiante.student_id = e.student_id
    WHERE rfid_estudiante.rfid_serial = ?";

    $db = getDatabase();
    $statement = $db->prepare($query);
    $statement->execute([$rfidSerial]);
    return $statement->fetchObject();
}

/*****************************/
function getEstudianteRfidById($student_id)
{
    $query = "SELECT rfid_serial FROM rfid_estudiante WHERE student_id = ?";
    $db = getDatabase();
    $statement = $db->prepare($query);
    $statement->execute([$student_id]);
    return $statement->fetchObject();
}

/************************/
function getReaderStatus()
{
    return file_get_contents(RFID_STATUS_FILE);
}
/****************************/
function setReaderStatus($newStatus)
{
    if (!in_array($newStatus, [RFID_STATUS_PAIRING, RFID_STATUS_READING])) {
        return;
    }
    file_put_contents(RFID_STATUS_FILE, $newStatus);
}

function getEstudianteWithAttendanceCount($start, $end)
{
    $query = "select student.name, 
sum(case when status = 'presence' then 1 else 0 end) as presence_count,
sum(case when status = 'absence' then 1 else 0 end) as absence_count 
 from attendance
 inner join student on student.student_id = attendance.student_id
 where date >= ? and date <= ?
 group by student_id, name;";
    $db = getDatabase();
    $statement = $db->prepare($query);
    $statement->execute([$start, $end]);
    return $statement->fetchAll();
}


// Crear un query que obtenga toda la lista de los estudiantes que asistan el mismo dia por la fecha
// y que los datos no se repitan
function getEstudianteWithAttendanceToday($fecha){
    $query = "SELECT DISTINCT e.student_id, e.name, em_at.status
    FROM student as e, attendance as em_at 
    WHERE e.student_id = em_at.student_id
    and date = ?";
    $db = getDatabase();
    $statement = $db->prepare($query);
    $statement->execute([$fecha]);
    return $statement->fetchAll(); // o puede ser fetchObject();
}

function saveAttendanceData($date, $employees)
{
    // para calibrar la Zona Horaria
    date_default_timezone_set('America/Santo_Domingo');
    //$time = date('h:i:s A');
    $time = date('h:i A', time());
    deleteAttendanceDataByDate($date);
    $db = getDatabase();
    $db->beginTransaction();
    $statement = $db->prepare("INSERT INTO attendance(student_id, date, status) VALUES (?, ?, ?)");
    foreach ($employees as $employee) {
        $statement->execute([$employee->student_id, $date, $employee->status]);
    }
    $db->commit();
    return true;
}

function deleteAttendanceDataByDate($date)
{
    $db = getDatabase();
    $statement = $db->prepare("DELETE FROM attendance WHERE date = ?");
    return $statement->execute([$date]);
}

/*********************** ESTO ES PARA LA ASISTENCIA */
function getAttendanceDataByDate($date)
{
    $db = getDatabase();
    $statement = $db->prepare("SELECT student_id, status FROM attendance WHERE date = ?");
    $statement->execute([$date]);
    return $statement->fetchAll();
}
/*function getAttendanceDataByDate($date)
{
    $db = getDatabase();
    $statement = $db->prepare("SELECT employee_id, status FROM student_attendance WHERE date = ?");
    $statement->execute([$date]);
    return $statement->fetchAll();
}*/

function deleteEstudiante($id)
{
    $db = getDatabase();
    $statement = $db->prepare("DELETE FROM student WHERE id = ?");
    return $statement->execute([$id]);
}

function updateEstudiante($nro_lista, $name, $id)
{
    $db = getDatabase();
    $statement = $db->prepare("UPDATE student SET nro_lista = ?, name = ? WHERE id = ?");
    return $statement->execute([$nro_lista, $name, $id]);
}
function getEstudianteById($id)
{
    $db = getDatabase();
    $statement = $db->prepare("SELECT id, nro_lista, name FROM student WHERE id = ?");
    $statement->execute([$id]);
    return $statement->fetchObject();
}

function saveEstudiante($nrolista, $name)
{
    $db = getDatabase();
    $statement = $db->prepare("INSERT INTO students(nro_lista, name) VALUES (?, ?)");
    return $statement->execute([$nrolista, $name]);
}

/*********************falta nro lista*/
function getEstudiantes()
{
    $db = getDatabase();
    $statement = $db->query("SELECT student_id, name FROM student");
    return $statement->fetchAll();
}

function getVarFromEnvironmentVariables($key)
{
    if (defined("_ENV_CACHE")) {
        $vars = _ENV_CACHE;
    } else {
        $file = "env.php";
        if (!file_exists($file)) {
            throw new Exception("El archivo de entorno ($file) no existe. por favor créalo");
        }
        $vars = parse_ini_file($file);
        define("_ENV_CACHE", $vars);
    }
    if (isset($vars[$key])) {
        return $vars[$key];
    } else {
        throw new Exception("La clave especificada (" . $key . ") no existe en el archivo de entorno");
    }
}

function getDatabase()
{
    $password = getVarFromEnvironmentVariables("MYSQL_PASSWORD");
    $user = getVarFromEnvironmentVariables("MYSQL_USER");
    $dbName = getVarFromEnvironmentVariables("MYSQL_DATABASE_NAME");
    $database = new PDO('mysql:host=localhost;dbname=' . $dbName, $user, $password);
    $database->query("set names utf8;");
    $database->setAttribute(PDO::ATTR_EMULATE_PREPARES, FALSE);
    $database->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $database->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
    return $database;
}
