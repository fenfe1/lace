<?php

require '../vendor/autoload.php';  // Load Composer

use Lace\Person;

$person = new Person();

echo "\n";
echo $person->getName() . " \n";  // Should say Rencia
echo "\n";
