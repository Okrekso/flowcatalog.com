<?php
$con = mysqli_connect("localhost","root","","FShop");

$itemsC=$_GET['itemsCount'];
$offset=$_GET['offset']; $offset=$offset*$itemsC;

$result = mysqli_query($con,"SELECT * FROM SHOP LIMIT $offset,$itemsC");
$items=array();
while($row=mysqli_fetch_row($result))
{
    array_push($items,$row);
}
echo json_encode($items);
?>