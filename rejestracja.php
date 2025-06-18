<?php

	session_start();
	
	if ((isset($_SESSION['zalogowany'])) && ($_SESSION['zalogowany']==true))
	{
		header('Location: dashboard.php');
		exit();
	}
	
	if (isset($_POST['login'])) {
		$wszystko_OK=true;
		$imie = $_POST['imie'];
		$login = $_POST['login'];
		$nazwisko = $_POST['nazwisko'];
		$haslo1 = $_POST['haslo1'];
		$haslo2 = $_POST['haslo2'];
		$rok = $_POST['rok'];
		
		if ($haslo1!=$haslo2)
		{
			$wszystko_OK=false;
			$_SESSION['e_haslo']="Podane hasła nie są identyczne!";
		}
		
		try{
			$conn = new mysqli("localhost", "root", "", "mydata") or die ("Błąd połączenia");
			
			$wynik = $conn->query("SELECT id FROM uzytkownik WHERE login='$login'");
			
			$ile_takich_maili = $wynik->num_rows;
			if($ile_takich_maili>0)
				{
					$wszystko_OK=false;
					$_SESSION['e_login']="Osoba o takim loginie jest zarejestrowana w bazie! Wybierz inny.";
				}
				
			if ($wszystko_OK==true) {
				if ($conn->query("INSERT INTO `uzytkownik` (`id`, `imie`, `nazwisko`, `rok_urodzenia`, `login`, `haslo`) VALUES (NULL, '$imie', '$nazwisko', '$rok', '$login', '$haslo1');")){
						$_SESSION['udanarejestracja']=true;
						header('Location: index.php');
					}
					else
					{
						throw new Exception($conn->error);
					}
			}
			
			$conn->close();
		}catch(Exception $e){
			echo '<span style="color:red;">Brak połączenia z bazą danych</span>';
		}
	}

?>

<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	
	<style>
		.error
		{
			color:red;
			margin-top: 10px;
			margin-bottom: 10px;
		}
	</style>
</head>

<body>
	
	<form method="post">
	
		Login: <br /> <input type="text" name="login" /><br />
		<?php
			if (isset($_SESSION['e_login']))
			{
				echo '<div class="error">'.$_SESSION['e_login'].'</div>';
				unset($_SESSION['e_login']);
			}
		?>
		Imię: <br /> <input type="text" name="imie" /><br />
		Nazwisko: <br /> <input type="text" name="nazwisko" /><br />
		Rok urodzenia: <br /> <input type="numer" name="rok" /><br />
		Twoje hasło: <br /> <input type="password" name="haslo1" /><br />
		<?php
			if (isset($_SESSION['e_haslo']))
			{
				echo '<div class="error">'.$_SESSION['e_haslo'].'</div>';
				unset($_SESSION['e_haslo']);
			}
		?>	
		
		Powtórz hasło: <br /> <input type="password" name="haslo2" /><br />
		<br />
		
		<input type="submit" value="Zarejestruj się" />
		
	</form>

</body>
</html>