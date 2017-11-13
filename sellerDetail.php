<!doctype html>
<!doctype html>
<?php
include('connectionData.txt');
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');
?>

<html>
<head>
  <title>Seller Detail</title>
  </head>
  <body bgcolor="ffff">
<hr>


<?php
$seller = $_POST['seller'];
$seller = mysqli_real_escape_string($conn, $seller);
$query = "select s.SSN, concat(e.first_name, ' ', e.last_name)name, e.age, e.gender, e.phone, e.address, s.salary, s.supervisor_name
          from (select se.SSN, se.salary, concat(em.first_name, ' ', em.last_name)supervisor_name 
                from seller se 
                join employee em on se.super_ssn = em.SSN)s
          join employee e on s.SSN=e.SSN
          order by s.salary DESC";
?>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
printf("%-12s %-20s %-6s %-8s %-20s %-30s %-10s %-20s <br/>", SSN, name, age, gender, phone, address, salary, supervisor);
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    printf("%-12s %-20s %-6s %-8s %-20s %-25s %-10s %-20s <br/>", $row[SSN], $row[name], $row[age], $row[gender], $row[phone], $row[address], $row[salary], $row[supervisor_name]);
  }
print "</pre>";

mysqli_free_result($result);
mysqli_close($conn);
?>

</body>
</html>