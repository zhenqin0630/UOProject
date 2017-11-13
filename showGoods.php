<!doctype html>
<?php
include('connectionData.txt');
$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');
?>

<html>
<head>
  <title>Show all of the goods in this market</title>
  </head>
  <body bgcolor="ffff">
  
  
<?php
  
$goods = $_GET['id'];
$goods = mysqli_real_escape_string($conn, $goods);
$query = "select g.goods_name, g.original_price as price, m.manufacturer_name, s.supplier_name, g.description
          from goods g join manufacturer m on g.manufacturer_ID=m.manufacturer_ID
                       join supplier s on g.supplier_ID=s.supplier_ID";
	  
?>



<p>
Market's Goods:
<hr>
</p>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
printf("%-25s %-10s %-20s %-20s %-22s <br/>", goods_name, price, manufacturer_name, supplier_name, description);
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    printf("%-25s %-10s %-20s %-20s %-22s <br/>", $row[goods_name], $row[price], $row[manufacturer_name], $row[supplier_name], $row[description]);
  }
print "</pre>";

mysqli_free_result($result);
mysqli_close($conn);
?>

<p>
<br>
<h4>Type of production</h4>
<br>
<a href='food.php?id=food'>Foods</a> 
&nbsp;&nbsp;&nbsp;&nbsp; 
<a href='daily.php?id=daily'>Daily Use</a>
<br>
<a href='shoes.php?id=shoes'>Shoes</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href='clothes.php?id=clothes'>Clothes</a>
<br><br>
<h4>
Supplier information:
</h4>
<a href='supplierDetail.php?id=supplier'>Supplier</a>
<br><br><br><br><br>
<a href='welcome.html'>Back to menu</a>
</p>



</body>
</html>