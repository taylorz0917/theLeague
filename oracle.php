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
   print "Sucessfully connected to Oracle!\n";

    $statement = oci_parse($connection, 'SELECT * FROM stats');
    oci_execute($statement);

    while (($row = oci_fetch_object($statement))) {
        var_dump($row);
    }
}
oci_free_statement($test);
oci_close($connection);
?>
