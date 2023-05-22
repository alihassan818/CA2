<?php

// Connect to the MySQL database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mts_db";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // Retrieve the names of the drugs entered by the user
  $drug1 = $_POST["drug1"];
  $drug2 = $_POST["drug2"];

  // Check if both drugs were entered
  if (!empty($drug1) && !empty($drug2)) {
    // Retrieve the properties of the drugs from the database
    $sql = "SELECT * FROM medications WHERE name IN ('$drug1', '$drug2')";
    $result = $conn->query($sql);

    // Check if both drugs are in the database
    if ($result->num_rows == 2) {
      $drug1_row = $result->fetch_assoc();
      $drug2_row = $result->fetch_assoc();

      // Retrieve the drug interaction data from the dataset
      $sql = "SELECT * FROM drug_interactions WHERE drug1_id={$drug1_row['id']} AND drug2_id={$drug2_row['id']}";
      $result = $conn->query($sql);

      // Check if the two drugs could interact negatively
      if ($result->num_rows > 0) {
        $interaction_row = $result->fetch_assoc();
        $severity = $interaction_row["severity"];
        $warning_message = "Warning: These drugs could interact negatively (Severity: $severity)";
        $_SESSION['warning_message']=$warning_message;
            //echo $warning_message;
            header("location:drug_checkings.php");
      } else {
        $warning_message = "No negative interactions found.";
        $_SESSION['warning_message']=$warning_message;
            //echo $warning_message;
            header("location:drug_checkings.php");
      }
    } else {
      $warning_message = "One or both drugs are not in the database.";
      $_SESSION['warning_message']=$warning_message;
            //echo $warning_message;
            header("location:drug_checkings.php");
    }
  } else {
    $warning_message = "Please enter both drugs.";
    $_SESSION['warning_message']=$warning_message;
            //echo $warning_message;
            header("location:drug_checkings.php");
  }
}



?>