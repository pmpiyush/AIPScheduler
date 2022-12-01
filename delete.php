<?php
require("db.php");
$save=$_GET['deleteid'];
echo $save;
$res=mysqli_query($db,"DELETE FROM students WHERE name='$save' ");

?>