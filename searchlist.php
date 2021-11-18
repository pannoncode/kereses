<?php

require_once 'bookmodel.php';
//var_dump($_POST['search']);
if (!$_POST['search']) {
    print ('Nem írtál be semmit!');
}

$search = searchBooks();

//print '<br>';
//var_dump($search);
require_once 'searchresult.php';
?>
