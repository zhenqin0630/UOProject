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
  
$member_name = $_POST['member_name'];

$member_name = mysqli_real_escape_string($conn, $member_name);
// this is a small attempt to avoid SQL injection
// better to use prepared statements

$query = "select g.goods_name, o.goods_ID, o.goods_num, g.original_price,(o.goods_num*g.original_price) price
          from member m join receipt r on m.member_ID = r.member_ID
          join orders o on r.receipt_num = o.receipt_num
          join goods g on g.goods_ID = o.goods_ID
          where m.member_name = ;"
$query = $query."'".$member_name."' ORDER BY o.goods_ID;";

?>

<p>
The query:
</p>

<?php
print $query;
?>


<p>
<hr>
Result of query:
</p>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[goods_name]  $row[goods_ID]  $row[goods_num] $row[original_price]  $row[price]";
	$total_price += $row[price];
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

<p>

the total price is:
</p>

<?php
print $total_price;
?>

<p>
<hr>
<a href="findCustState.txt" >Contents</a>
of the PHP program that created this page. 	 
</p>
</body>
</html>
	  