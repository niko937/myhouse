<?php 
include 'top.php';
require ("fonctionnalite.php")

 ?>
<body /visuel/Images/background.jpg>

	<div class="titre_PageFonc">
		Nouvelle fonctionnalité
	</div>

	<form id=formulaire method="post" action= enctype="multipart/form-data">
		
		<fieldset id="form-fonctionnalite"> <legend></legend> <br>

			<label>Fonctionnalite</label>  
			<select name="Fonctionnalite" type="text">
				<option value="Temperature">Temperature</option>
				<option value="Humidite">Humidite</option>
				<option value="Luminosite">Luminosite</option>
				<option value="Volet">Volet</option>
			</select><br><br><br>

			<label>Cle Produit</label>  
			<input name="CleProduit" type="integer"></input> <br>
			
		</fieldset>
	</form>
</body>
<div>
				<input class="ajouter_fonc" type="submit" value="Ajouter" />
			</div>

<?php include 'bottom_ajout_fonction.php'; ?>