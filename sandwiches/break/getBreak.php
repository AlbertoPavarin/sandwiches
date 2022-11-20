<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once dirname(__FILE__) . '/../config/database.php';
include_once dirname(__FILE__) . '/../models/break.php';

$database = new Database();
$db = $database->connect();

if (!strpos($_SERVER["REQUEST_URI"], "?BREAK_ID="))
{
    http_response_code(400);
    die(json_encode(array("Message" => "Bad request")));
}

$id = explode("?BREAK_ID=" ,$_SERVER['REQUEST_URI'])[1];

$break = new Break_($db);

$stmt = $break -> getBreak($id);

if ($stmt->num_rows > 0)
{
    $break_arr = array();
    $break_arr['records'] = array();
    while($record = $stmt->fetch_assoc())
    {
       extract($record);
       $break_record = array(
        'break_time' => $break_time,
       );
       array_push($break_arr['records'], $break_record);
    }
    echo json_encode($break_arr);
    http_response_code(200);
}
else {
    echo "\n\nNo record";
}
?>