<?php
function connection(){
    require 'dbconfig.php';
    $conn = mysqli_connect($url, $username, $password, $dbname);
    return $conn;
}

function close($conn){
    mysqli_close($conn);
}

function dbSelect($link, $query){
    return mysqli_query($link, $query);    
}

function fetch($result, $type){
    if($type === 'assoc'){
        return mysqli_fetch_assoc($result);
    }else if('array'){
        return mysqli_fetch_array($result);
    }
}

function fetchAll($result, $type='assoc'){
    if($type === 'assoc' || $type === ''){
        $detail = [];
        while($row = mysqli_fetch_assoc($result)){
            $detail[] = $row;
        }
        return $detail;
    }
    return false;
}
?>
