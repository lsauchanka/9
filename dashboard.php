<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']))
	{
		header('Location: index.php');
		exit();
	}
	
?>
<!DOCTYPE HTML>
<html lang="pl">
<header>
	<meta charset="utf-8" />
		<style>
			td {
				border: solid #000 1px;
				padding: 5px;
			}
		</style>
</header>
<body>
	
	Dla zalogowanych użytkowników!
	<?php
	echo "<p>Witaj ".$_SESSION['imie'].'! [ <a href="wyloguj.php">Wyloguj się!</a> ]</p>';
	$id = $_SESSION['id'];

	$conn = new mysqli("localhost", "root", "", "mydata") or die ("Błąd połączenia");
	/*TO ZAPYTANIE NIE ZOSTAŁO SKOŃCZONE*/
		$wynik = $conn->query("SELECT * FROM kursy, uzytkownik, uzytkownicy_kursy WHERE uzytkownicy_kursy.iduzytkownik='$id' AND uzytkownicy_kursy.iduzytkownik=uzytkownik.id");
		
			if($wynik->num_rows > 0){
				
				echo "<table>";
				echo "<tr>";
				echo "<th>nazwa</th>";
				echo "<th>miejsce</th>";
				echo "<th>data</th>";
				echo "<th>cena</th>";
				echo "<th>płatność</th>";
				echo "</tr>";
				
				while( $wiersz = $wynik->fetch_assoc() ){
					echo "<tr>";
					
					echo "<td>" . $wiersz["nazwa"] . "</td>";
					echo "<td>" . $wiersz["miejsce"] . "</td>";
					echo "<td>" . $wiersz["data"] . "</td>";
					echo "<td>" . $wiersz["cena"].",00 PLN" . "</td>";
					if($wiersz["status_platnosc"] > 0) {
						echo "<td>opłacone</td>";
					}else{
						echo "<td>brak opłaty</td>";
					}
					
					echo "</tr>";
				}
				
				echo "</table>";
				
			}else {
				echo "Nie ma nic w bazie danych";
			}
			
			$conn->close()


	?>
</body>
</html>