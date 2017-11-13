<!doctype html>
<?php

include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Another Simple PHP-MySQL Program</title>
  </head>
  
  <body bgcolor="white">
  
<hr>
  
  
<?php
  
$employee = $_POST['employee'];

$employee = mysqli_real_escape_string($conn, $employee);
// this is a small attempt to avoid SQL injection
// better to use prepared statements

$query = "SELECT SSN, CONCAT(first_name," ", last_name) AS employee_name, gender, phone, age, address
          FROM employee";


?>



<p>
<hr>
Market's members:
</p>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
printf("%-12s %-25s %-6s %-22s %-5s %-30s <br/>", SSN, employee_name, gender, phone, age, address);
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    printf("%-12s %-25s %-6s %-22s %-5s %-30s <br/>", $row[SSN], $row[employee_name], $row[gender], $row[phone], $row[age], $row[address]);
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

<p>
Please enter a SSN which you want to know more detail.  like 944355 and so on.
<p>

<form action="employeeDetail.php" method="POST">

<input type="text" name="SSN"> <br>
<input type="submit" value="submit">
<input type="reset" value="erase">
</form>


</body>
</html>