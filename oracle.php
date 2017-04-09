#!/usr/local/bin/php
<?php

// Create connection to Oracle
$connection = oci_connect($username = 'ztaylor', $password = 'mypassword', $connection_string = '//oracle.cise.ufl.edu/orcl');
if (!$connection) {
   $m = oci_error();
   echo $m['message'], "\n";
   exit;
}
else {  
    //ini_set('display_errors', 'On');
    //error_reporting(E_ALL);

    //$Player ="Player";
    $Team = "%" . $_POST['Team'] . "%";
    $query = "SELECT DISTINCT * FROM Player 
    WHERE TeamName like :Team 
    ORDER BY Year, TeamName, PlayerName";
    $statement = oci_parse($connection, $query);
    oci_bind_by_name($statement, ":Team", $Team);
    oci_execute($statement);
    echo "$Team";
    echo"<table border='2'>";
    echo "<tr><th>Player</th>
        <th>Team</th>
        <th>Offense/Defense</th>
        <th>Category</th>
        <th>Year</th></tr>";
  while ($row=oci_fetch_row($statement))
  { 
        echo"<tr><td>$row[0]</td><td>$row[1]</td><td>$row[2]</td><td>$row[3]</td><td>$row[4]</td></tr>";
  }
     echo"</table></br>";
     oci_free_statement($statement);
}
oci_commit($connection);
oci_close($connection);
?>
