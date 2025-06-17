<?php

    //Zmienne serwera i bazy danych do funkci "connect" 

    $server     = "127.0.0.1";
    $username   = "root";
    $password   = "newpassword";
    $db         = "zaliczenie2";

    //Otwiera połączenie z serwerem

    $conn = mysqli_connect( $server, $username, $password, $db );

    // Sprawdzenie połączenia 

        if (!$conn) 
        {
            die( "Connection failed: " . mysqli_connect_error() );
        }else { 
            echo "Połączono pomyślnie!";
        }
?>
