<?php
    $mysql_host = "mysql-server";
    $mysql_user = "testuser";
    $mysql_pass = "testpass";
    $mysql_database = "testdb";


    $mysqli = new mysqli(
        $mysql_host,
        $mysql_user,
        $mysql_pass,
        $mysql_database
    );

    if ($mysqli->connect_errno) {
        printf("%s\n", $mysqli->$connect_error);
        exit("Invalid database connection");
    }

    if ($entries = $mysqli->query("SELECT * FROM User")) {
        foreach ($entries as $entry) {
            echo "{$entry['name']}, {$entry['selary']}";
        }
    }
?>