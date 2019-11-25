<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
  <?php $q = intval($_GET['q']); ?>
<div class="main">

<div id="myBtnContainer">
  <button class="btn active" onclick="filterSelection('all')"> Tout</button>
  <?php if ($q == 1): ?>
    <button class="btn" onclick="filterSelection('Lait demaquillant')"> Lait demaquillant</button>
    <button class="btn" onclick="filterSelection('Creme jour')"> Crème de Jour</button>
    <button class="btn" onclick="filterSelection('Creme nuit')"> Crème de nuit</button>
  <?php endif ?>
  <?php if ($q == 2): ?>
    <button class="btn" onclick="filterSelection('Demaquillant visage')"> Démaquillant Visage</button>
    <button class="btn" onclick="filterSelection('Poudre')"> Poudre</button>
    <button class="btn" onclick="filterSelection('Fond de teint')"> Fond de teint</button>
  <?php endif ?>
  <?php if ($q == 3): ?>
    <button class="btn" onclick="filterSelection('Cheveux secs')"> Cheveux secs</button>
    <button class="btn" onclick="filterSelection('Cheveux gras')"> Cheveux gras</button>
    <button class="btn" onclick="filterSelection('Shampoing')"> Shampoing</button>
  <?php endif ?>
</div>
<?php
$con = mysqli_connect('localhost','root','','cosmetishop');
if (!$con) {
    die('Could not connect: ' . mysqli_error($con));
}

mysqli_select_db($con,"ajax_demo");
$sql="SELECT * FROM t_article WHERE categorie_id = '".$q."'";
$result = mysqli_query($con,$sql);

$i = 0;
$tab = array();
while($row = mysqli_fetch_array($result)) {
    $tab[$i] = $row;
    $i++;
}
mysqli_close($con);
?>
<?php
        
    echo <<<_END
    <div class="row">
      <div id="defautimage" class="column2">
          <iframe width="795.5" height="450" src="https://www.youtube.com/embed/LlCnKDyjRCM?autoplay=1">
</iframe>
      </div>
_END;
    foreach ($tab as $value) {
                $nom = $value["art_nom"];
                $prix = $value["art_prix"];
                $des = $value["art_description"];
                $img = $value["art_image"];
                $nbr = $value["art_stock"];
                $type = $value["type_id"];
                echo <<<_END
                <div class="column $type">
                    <div class="content">
                        <img src="./images/$img" alt="Mountains" style="width:100%">
                        <h4>$nom</h4>
                        <p>$des</p>
                        <h2>Prix : $prix $</h2>
                        <button class="btn1 active notification"> <span class="badge">$nbr</span>Acheter</button>
                    </div>
                </div>
_END;
            }
            echo <<<_END
            
  </div>
  <div class="pagination p6">
      <ul>
        <a href="#"><li></li></a>
        <a href="#"><li></li></a>
        <a href="#"><li></li></a>
        <a href="#"><li></li></a>
        <a class="is-active" href="#"><li></li></a>
        <a href="#"><li></li></a>
      </ul>
    </div>
_END;
 ?>

</body>
</html>
