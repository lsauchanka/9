<?php

	session_start();
	
	if ((isset($_SESSION['zalogowany'])) && ($_SESSION['zalogowany']==true))
	{
		header('Location: dashboard.php');
		exit();
	}

?>

<!DOCTYPE HTML>
<html lang="pl">
<header>
	<meta charset="utf-8" />
		
</header>
<body>

	<a href="rejestracja.php">Rejestracja - załóż konto!</a>
	<br /><br />

	<form action="zaloguj.php" method="post">
	
		Login: <br /> <input type="text" name="login" /> <br />
		Hasło: <br /> <input type="password" name="haslo" /> <br /><br />
		<input type="submit" value="Zaloguj się" />
	
	</form>
	
<?php
	if(isset($_SESSION['blad']))	echo $_SESSION['blad'];
?>
	
	

</body>
</html>