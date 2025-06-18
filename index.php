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

	<h3>Kursy na które można się zapisać!</h3>
	<h5>Zaloguj lub stwórz konto by zapisać się na kurs</h5>

	<?php
		$conn = new mysqli("localhost", "root", "", "mydata") or die ("Błąd połączenia");
		$wynik = $conn->query("SELECT * FROM kursy");
		
			if($wynik->num_rows > 0){
				
				echo "<table>";
				echo "<tr>";
				echo "<th>id</th>";
				echo "<th>nazwa</th>";
				echo "<th>miejsce</th>";
				echo "<th>data</th>";
				echo "<th>cena</th>";
				echo "</tr>";
				
				while( $wiersz = $wynik->fetch_assoc() ){
					echo "<tr>";
					
					echo "<td>" . $wiersz["id"]    . "</td>";
					echo "<td>" . $wiersz["nazwa"] . "</td>";
					echo "<td>" . $wiersz["miejsce"] . "</td>";
					echo "<td>" . $wiersz["data"] . "</td>";
					echo "<td>" . $wiersz["cena"].",00 PLN" . "</td>";
					
					echo "</tr>";
				}
				
				echo "</table>";
				
			}else {
				echo "Nie ma nic w bazie danych";
			}
			
			$conn->close()
	?>
	</br>
	<a href="logowanie.php">Zaloguj się!</a>

</body>
</html>