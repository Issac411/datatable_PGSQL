<!DOCTYPE html>
<html lang="fr">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>

    <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/dataTables.select.min.js"></script>
    <script type="text/javascript" src="js/datatables.js"></script>

    <style type="text/css" media="all">@import "css/jquery.dataTables.min.css";</style>
    
	<?php
	//----------------------------------------------^ 
	// On oublie pas d'importer les librairies de datatable, on va aussi penser a utiliser un fichier CSS pour que ça ai une apparence.
		//ZEUB ZEUB ZUEB OUI
	?>
    <title>Utilisation du datable</title>

</head>
<body>
 	<h2>Liste d'essais</h2>
 		<div id="selecteur"></div>

        <table id="articles" class="display" width="100%" cellspacing="0">		
        <thead>
            <tr>
			<th>Id</th>
			<th>Id TVA</th>
			<th>Id Categorie</th>
			<th>Description</th>
			<th>Libelle</th>
			<th>TVA</th>
			<th>Prix unitaire hors des taxes</th>
			<th>Prix TTC</th>
			<th>disponible</th>
			<th>Réduction</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
			<th>Id</th>
			<th>Id TVA</th>
			<th>Id Categorie</th>
			<th>Description</th>
			<th>Libelle</th>
			<th>TVA</th>
			<th>Prix unitaire hors des taxes</th>
			<th>Prix TTC</th>
			<th>disponible</th>
			<th>Réduction</th>    
            </tr>
        </tfoot>
    </table>

</body>

<script>

 $(document).ready(function() {



	 $(document).ready(function() {				// On demande a ce que "articles" contienne le tableau.
	 		var table = $('#articles').DataTable();
	 });

	  	$( "#articles" ).dblclick(function() { // Quand on double clique sur Articles (le tableau), on obtient l'affichage de la 4ème colonne de la ligne selection, le libelle.
		var table = $('#articles').DataTable();
		var rowsel = table.row( '.selected' ).data();
		title = document.getElementById("selecteur");
		title.innerHTML = "Modification de l'article : "+rowsel[4];
		title.style.fontSize="32px";
	});
});
</script>
