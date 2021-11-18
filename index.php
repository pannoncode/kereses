<?php
    require_once 'booklist.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>My Books</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css" rel="stylesheet">

    </head>
    <body>
        <form action="searchlist.php" method="POST">
            <input class="dataTable-input" placeholder="Search..." type="text" name="search" id="search">
            <button type="submit" name="submit" value="search">Keresés</button>
        </form>
        <table id="example" class="table table-striped table-bordered" style=" width:100%; text-align:center;">
            <thead>
                <tr>
                    <th>Író</th>
                    <th>Könyv címe</th>
                    <th>Műfaj</th>
                    <th>Kiadás éve</th>
                    <th>Kiadó</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if(isset($books)){
                    foreach ($books as $key => $value) {  
                ?>
                <tr>
                    <td><?php print($value['auth_name']); ?></td>
                    <td><?php print($value['book_title']); ?></td>
                    <td><?php print($value['styles']); ?></td>
                    <td><?php print($value['release_year']); ?></td>
                    <td><?php print($value['pub_name']); ?></td>
                </tr>
                <?php
                    }
                }
                ?>
            </tbody>
        </table>
    </body>
</html>
