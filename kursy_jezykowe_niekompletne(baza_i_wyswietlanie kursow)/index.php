<?php 

    include ('connect.php');
?>
<html lang="pl"> 
    <head> 
        
        <!-- Wymagane tagi meta --> 
        
        <meta charset="utf-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- END --> 
        
        <!-- Dodatkowe tagi meta -->
        
        <meta name="description" content="Techniki Internetowe II"> 
        <meta name="keywords" content="zaliczenie, techniki komputerowe, cwiczenie">
        <meta name="author" content="Kamil Ewertowski">
        <meta property="og:image" content="/img/favicon.png">
        <!-- END --> 
        
        <link rel="stylesheet" href="/css/normalize.css" type="text/css"> 
        <link rel="stylesheet" href="/css/style.css" type="text/css"> 
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    
        <title>Strona na zaliczenie cwiczenia 2 - TI - Zajzd 4 </title> 
        
    </head>
    
    
    <body> 
    
    <header class="header">
    
    </header>
        
    <section>
        <div id="uzytkownik" class="form">
            <fieldset> 
                <h2> Lista dostępnych kursow </h2>
                
                <?php 
                $query = "SELECT * FROM kurs";               // wybor danej tabeli z bazy danych 
                $result = mysqli_query( $conn, $query);            // przypisanie tabeli do zmiennej 
                
                if( mysqli_num_rows($result) > 0)
                {
                    while( $row = mysqli_fetch_assoc($result) ) 
                    { 
                    echo 
                        "<ul> 
                        <li><span style='color:green ; font-weight:700;'>ID Kursu:</span>" . $row["id"] . "</li>
                        <li><span style='color:green ; font-weight:700;'>Nazwa Kursu:</span>" . $row["nazwa"] . "</li>
                        </ul>
                        <br/>"; 
                    } 
                } 
                else 
                { 
                    echo "Whoops! brak danych.";       
                }
                ?> 
            </fieldset>
        </div>
    </section>
        
    <aside class="sidebar"> 
            <h5>Lista uzytkownikow:</h5>
            <ul>
                <?php 
                $query = "SELECT * FROM uzytkownik";               // wybor danej tabeli z bazy danych 
                $result = mysqli_query( $conn, $query);            // przypisanie tabeli do zmiennej 
        
                if( mysqli_num_rows($result) > 0)
                {
                    while( $row = mysqli_fetch_assoc($result) ) 
                    { 
                        echo "<li>". $row["login"] ."</li><br>"; 
                    }
                } 
                else 
                { 
                    echo "Whoops! brak danych.";       
                }
                ?>
            </ul>
        </aside>

    <footer class="footer"> 
            <p> Copyright &copy; 2020  Kamil Ewertowski </p> 
    </footer>
    </body>
</html>