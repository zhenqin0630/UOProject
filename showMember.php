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
  
$member = $_POST['member'];

$member = mysqli_real_escape_string($conn, $member);
// this is a small attempt to avoid SQL injection
// better to use prepared statements

$query = "select member_ID, member_name, phone, address
          from member";


?>



<p>
<hr>
Market's members:
</p>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
printf("%-5s %-20s %-22s %-30s <br/>", member_ID, member_name, phone, address);
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    printf("%-5s %-20s %-22s %-30s <br/>", $row[member_ID], $row[member_name], $row[phone], $row[address]);
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

<p>
Please enter a member ID to know more detail.  like ID 1,2,3 and so on.
<p>

<form action="memberDetail.php" method="POST">

<input type="text" name="member_ID"> <br>
<input type="submit" value="submit">
<input type="reset" value="erase">
</form>


</body>
</html>