<head>
		<title>controleur de titre à créer a voir comment...</title>
		<link rel="stylesheet" type ="text/css" media="screen" href="style.css"> 
		<meta charset=UTF-8>
</head>

<header>
		<div id="div_logo">	
			<img id="logo" src="../visuel/images/logo.png">
		</div>

		<div id="div_menu">
			<table >
				<tr>
					<td class="bouton_menu" type=button>
						<a href="../visuel/index.php"> Accueil </a>
					</td>

					<td class="bouton_menu" type=button> 
						<a href="../visuel/ma_maison.php"> Ma Maison </a>
					</td>

					<td class="bouton_menu" type=button>
						<a href="../visuel/support.php"> Support (FAQ) </a>
					</td>

					<td class="bouton_menu" type=button>
						<a href="../visuel/connexion_form.php"> 
							<?php
							session_start();
							if ($_SESSION['Identifiant']=='') {
								echo 'Connexion';
							} else {
								echo $_SESSION['Identifiant'];
							}
																
							
							?>
								
						</a>
					</td>

				</tr>
			</table>
		</div>
		<div id="barre">
		</div>
</header>
