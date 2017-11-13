<!doctype html>
<?php
include('connectionData.txt');
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');
?>

<html>
<head>
  <title>Market Clothes List</title>
  </head>
  <body bgcolor="ffff">
  
<?php
$clothes = $_GET['id'];
$clothes = mysqli_real_escape_string($conn, $clothes);
$query = "select g.goods_name, c.size, c.color, c.type, c.material, g.original_price, m.manufacturer_name
          from goods g join manufacturer m on g.manufacturer_ID = m.manufacturer_ID
          join clothes c on c.good_ID = g.goods_ID";
?>

<p>
<h2>Market's Clothes List</h2>
<hr>
</p>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
printf("%-20s %-9s %-9s %-8s %-10s %-9s %-15s <br/>", name, size, color, type, material, price, manufacturer_name);
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    printf("%-20s %-9s %-9s %-8s %-10s %-9s %-15s <br/>", $row[goods_name],$row[size],$row[color],$row[type], $row[material], $row[original_price], $row[manufacturer_name]);
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