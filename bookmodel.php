<?php

require_once 'connection.php';

function getAllBooks() {
    $conn = connection();
    if (!$conn) {
        return false;
    }
    $sql = "SELECT * "
            . "FROM books "
            . "LEFT JOIN authors ON (books.auth_id = authors.id) "
            . "LEFT JOIN publisher ON (books.pub_id = publisher.id) "
            . "LEFT JOIN styles ON (books.style_id = styles.id)";

    $result = dbSelect($conn, $sql);
    if (!$result) {
        return false;
    }
    $detail = fetchAll($result);
    close($conn);
    return $detail;
}

function searchBooks() {
    $conn = connection();
    if (!$conn) {
        return false;
    }
    //var_dump($_POST['search']);
    $search_value = $_POST['search'];
    //var_dump($search_value);
    $sql = "SELECT * "
            . "FROM books "
            . "LEFT JOIN authors ON (books.auth_id = authors.id) "
            . "LEFT JOIN publisher ON (books.pub_id = publisher.id) "
            . "LEFT JOIN styles ON (books.style_id = styles.id)"
            . "WHERE book_title "
            . "LIKE '%$search_value%' "
            . "OR styles LIKE '%$search_value%' "
            . "OR auth_name LIKE '%$search_value%'"
            . "OR release_year LIKE '%$search_value%'"
            . "OR pub_name LIKE '%$search_value%'";           
    //print '<br>';
    //var_dump($sql); 
    $result = dbSelect($conn, $sql);
    if (!$result) {
        return false;
    }
    $detail = fetchAll($result);
    close($conn);
    return $detail;
}
?>
