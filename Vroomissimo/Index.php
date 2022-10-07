<?php
$bdd = new PDO('mysql:host=localhost;dbname=Autoscoot','root','root');
$allMarques = $bdd->query('SELECT * FROM Nom_marque ORDER BY ID_Marque DESC');
if(isset($_GET['S']) AND !empty($_GET['S'])) {
  $Autoscoot = htmlspecialchars($_GET['S']);
  $allMarques = $bdd->query('SELECT Nom_Marque FROM Marques WHERE Nom_Marque LIKE "%'.$Autoscoot.'%" ORDER BY ID_Marque ASC');
}
?>

<!doctype html>
<html>
<head>
<title>
Vroomissimo
</title>
<meta charset="utf-8">
</head>
<body>

<h1>
Vroomissimo
</h1>

<form method="GET">
  <input type="search" name="S" placeholder="Rechercher la marque du véhicule" autocomplete="off">
  <input type="submit" name="Envoyer">
</form>

<section class="afficher_utilisateur">
<?php 
if($allMarques->rowCount() > 0){
       while($Marque = $allMarques->fetch()){
          ?>
          <p><?= $Marque['Nom_Marque']; ?>
          <?php
       }
     }else{
         ?>
         <p>Aucune marque n'a été trouvé</p>
         <?php 
     }

?>
</section>



</body>
</html>
