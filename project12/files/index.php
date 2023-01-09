<!DOCTYPE html>
<html>
<body>

<h1>The Server greets you...</h1>

<h2>
<?php

echo "Server Hostname is: ".gethostname();

?>

</br>

<?php
/**
 * Gets IP address.
 */
function getIpAddress()
{

    $localIP = getHostByName(getHostName());
  
    // Displaying the address 
    return $localIP;
}

echo "  ";
echo "\n";

echo "IP Address is: " . getIpAddress();

?>
</h2>

</body>
</html>