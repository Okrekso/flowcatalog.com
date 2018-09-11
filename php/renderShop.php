<?php
$con = mysqli_connect("localhost","root","","FShop");
$offset=$_GET['offset']; $offset=$offset*6;
$result = mysqli_query($con,"SELECT * FROM SHOP LIMIT $offset,6");
$items=array();
while($row=mysqli_fetch_row($result))
{
    array_push($items,$row);
}
echo json_encode($items);
?>