<?php
// All interaction goes through the index and is
// directly to the controller
include_once 'controller/controller.php';
$controller = new Controller();
$controller->invoke();
?>