<?php
$con = mysqli_connect("localhost","root","","FShop");
$result = mysqli_query($con,"SELECT * FROM SHOP LIMIT 20");
$items=array();
while($row=mysqli_fetch_row($result))
{
    array_push($items,$row);
}
echo json_encode($items);
?>