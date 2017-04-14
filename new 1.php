<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Page de modification de notes</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    </head>
    <body>
	
	<fieldset>
		<legend>Selectionnez votre promotion:</legend>
		<form method='POST'>
		<SELECT name='sanial'>
		<option>Promotion B1
		<option>Promotion B2
		<option>Promotion B3
		<option>Promotion I4
		<option>Promotion I5
		<input type="submit" value="OK">
		
		<legend>Selectionnez la classe:</legend>
		<form method='POST'>
		<SELECT name='blabla'>
		<option>classe 1
		<option>classe 2
		</select>
		<input type="submit" value="OK">
		</form>
	<fieldset>

		<?php
include_once('PDO.php');

	if(isset($_POST['blabla']) && isset($_POST['sanial']) && ($_POST['sanial'] == 'Promotion B1') && ($_POST['blabla'] == 'classe 1')){
	$sql="requete pour récupérer le nom, prénom, notes, matière et appréciations des étudiants de b1 classe 1";
	$sth=$dbh->query($sql);
	$result=$sth->fetchAll(PDO::FETCH_ASSOC);
		?>

		<fieldset>
<legend>Selectionnez la matière:</legend>
		<SELECT name="choukroun">
		<option>Anglais
		<option>Maths
		<option>PHP
		<option>HTML/CSS
		<option>Eco/Droit
		<input type="submit" value="OK">
		</select>
		</form>
</fieldset>

		
	<table> 
	<tr> 
		<th colspan='2'> Elève </th>
		<th colspan='4'> Note </th>
		<th> appreciation </th>
	</tr>
	<tr>
		<td> nom </td>
		<td> prénom </td>
		<td> note CC1</td>
		<td> note CC2</td>
		<td> note CC3</td>
		<td> note Partiels</td>
		<td> appreciation</td>
	</tr>
	<?php
	
	if (isset($_POST['choukroun']) && ($_POST['choukroun']) =='Anglais')
	{
	?>
	<p> Vous avez selectionnés la matière Anglais</p>
	<?php
	foreach ($result as $row)
	{
		if($row['matière']=="Anglais")
		{
		'<tr>';
		'<td>' $row['nom'] '</td>';
		'<td>' $row['prenom'] '</td>';
		'<td>' $row['note CC1'] '</td>';
		'<td>' $row['note CC2'] '</td>';
		'<td>' $row['note CC3'] '</td>';
		'<td>' $row['note Partiels'] '</td>';
		'<td>' $row['appreciation'] '</td>';
		'</tr>';
		}
	}
	
	}
	?>
	</table>

	<?php
	
	
	
	
	}
		
	?>
	    </body>
</html>