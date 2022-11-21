<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once dirname(__FILE__) . '/../config/database.php';
include_once dirname(__FILE__) . '/../models/order.php';

$database = new Database();
$db = $database->connect(); 

$data = json_decode(file_get_contents("php://input"));
if (!empty($data))
{
    $order = new Order($db);
    if ($order->setOrder($data->user_ID, $data->total_price, $data->break_ID, $data->status_ID, $data->pickup_ID, $data->json))
    {
        http_response_code(201);
        echo json_encode(array("Message"=> "Created"));
    }
    else
    {
        http_response_code(503);
        echo json_encode(array("Message"=>$data));
    }
}
else
{
    http_response_code(400);
    die(json_encode(array("Message" => "Bad request")));
}
?>