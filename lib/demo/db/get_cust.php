<?php
include("db.php");

$con = dbconn();
$query = "SELECT * FROM `cust`";
$exe = mysqli_query($con, $query);
$arr = [];
while($row=mysqli_fetch_array($exe) ){
    $arr[] = $row;
} 
print(json_encode($arr));

?>