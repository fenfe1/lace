<?php

require '../vendor/autoload.php';  // Load Composer

use Lace\Foundation;

$person = new Foundation();

echo "\n";
echo $person->getName() . " \n";  // Should say Rencia
echo "\n";
