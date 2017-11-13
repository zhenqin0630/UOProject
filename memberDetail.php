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

$member_ID = $_POST['member_ID'];

$member_ID = mysqli_real_escape_string($conn, $member_ID);

$query = "select m.member_name, g.goods_name, o.goods_num, g.original_price,(o.goods_num*g.original_price) price
          from member m join receipt r on m.member_ID = r.member_ID
          join orders o on r.receipt_num = o.receipt_num
          join goods g on g.goods_ID = o.goods_ID
          where m.member_ID = ";
$query = $query."'".$member_name."' ORDER BY o.goods_num;";
?>

<?php
$total_price=0;
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
printf("%-25s %-30s %-18s %-16s %-16s <br/>",member_name, goods_name,goods_number,price_per_each,price);
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    printf("%-25s %-30s %-18s %-16s %-16s <br/>", $row[member_name], $row[goods_name], $row[goods_num], $row[original_price], $row[price]);
    $total_price += $row[price];
  }
print "</pre>";

mysqli_free_result($result);
mysqli_close($conn);

	  
print "the total price is: ";
print $total_price;
print "$";
?>

</body>
</html>
