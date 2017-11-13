<!doctype html>
<?php
include('connectionData.txt');
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');
?>

<html>
<head>
  <title>Market Daily Use List</title>
  </head>
  <body bgcolor="ffff">
  
<?php
$daily = $_GET['id'];
$daily = mysqli_real_escape_string($conn, $daily);
$query = "select g.goods_name, d.type, g.original_price, m.manufacturer_name
          from goods g join manufacturer m on g.manufacturer_ID = m.manufacturer_ID
          join daily_use d on d.good_ID = g.goods_ID";
?>

<p>
<h2>Market's DailyUse List</h2>
<hr>
</p>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
printf("%-20s %-9s %-10s %-12s <br/>", name, type, price, manufacturer_name);
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    printf("%-20s %-9s %-10s %-12s <br/>", $row[goods_name], $row[type], $row[original_price], $row[manufacturer_name]);
  }
print "</pre>";

mysqli_free_result($result);
mysqli_close($conn);
?>

<p>
<br><br>
<a href='showGoods.php?id=goods'>Back to goods menu</a>
</p>
</body>
</html>