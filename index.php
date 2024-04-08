<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ewemor Martin</title>
    <link rel="stylesheet" href="stilus.css">

</head>
<body>

<?php
    $soforok = array(
    "Nagy Tibor", 
    "Szabó Ákos", 
    "Kovács Géza",
    "Hofi Géza"
    );

    $varosok = array("
    Nagykanizsa",
    "Kőszeg",
    "Tata",
    "Gárdony"
    );

    $buszok = array();
    for ($i = 0; $i < count($soforok); $i++) {
        $buszok[] = rand(1, 200);
    }

    echo "<table>";
    echo "<tr><th>Név</th><th>Város neve</th><th>Busz sorszáma</th></tr>";
    for ($i = 0; $i < count($soforok); $i++) {
        echo "<tr>";
        echo "<td>". $soforok[$i] ."</td>";
        echo "<td>". $varosok[$i] ."</td>";
        echo "<td>". $buszok[$i] ."</td>";
        echo "</tr>";
    }
    echo "</table>";
?>

</body>
</html>
