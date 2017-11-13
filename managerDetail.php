<!doctype html>
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
  <body bgcolor="ffff">
<hr>


<?php
$manager = $_POST['manager'];
$manager = mysqli_real_escape_string($conn, $manager);
$query = "select m.SSN, e.first_name, e.last_name, m.job_title, e.age, e.gender, e.phone, e.address, m.salary
          from manager m left join employee e on m.SSN=e.SSN
          order by m.salary DESC";
?>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
printf("%-12s %-25s %-15s %-6s %-8s %-20s %-30s %-10s <br/>", SSN, name, job_title, age, gender, phone, address, salary);
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    printf("%-12s %-13s %-12s %-15s %-6s %-8s %-20s %-25s %-10s <br/>", $row[SSN], $row[first_name], $row[last_name], $row[job_title] $row[age], $row[gender], $row[phone], $row[address], $row[salary]);
  }
print "</pre>";

mysqli_free_result($result);
mysqli_close($conn);
?>

</body>
</html>