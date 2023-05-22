
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
        
        $warning_message = "<h2 style='color:white;background-color: green; padding: 10px; border: 1px solid #ccc;'> 
        DRUG1: $drug1 <br> DRUG2: $drug2 <br> Warning: These drugs could interact negatively (Severity: $severity)";
        
        $_SESSION['warning_message']=$warning_message;
           
      } else {
       
        $warning_message = "<h2 style='color:white;background-color: green; padding: 10px; border: 1px solid #ccc;'> 
        DRUG1: $drug1 <br> DRUG2: $drug2 <br>No negative interactions found";
       
        $_SESSION['warning_message']=$warning_message;
          
      }
    } else {
      
        $warning_message = "<h2 style='color:white;background-color: green; padding: 10px; border: 1px solid #ccc;'> 
        DRUG1: $drug1 <br> DRUG2: $drug2 <br>  One or both drugs are not in the database";
      
      $_SESSION['warning_message']=$warning_message;
            
    }
  } else {
    
    $warning_message = "Please enter both drugs.";
    
    $_SESSION['warning_message']=$warning_message;
            
  }
}



?>
<!DOCTYPE html>
<html>
<head>
  <title>Drug Interaction Checker</title>
</head>
<body>
  <h1>Drug Interaction Checker</h1>
  <form method="post">

  <div class="form-group">
    <label class="form-control" for="drug1">Drug 1:</label>
    <select name="drug1" class="form-control">
    <?php
      // Retrieve the drug names from the medications table
      $sql = "SELECT name FROM medications";
      $result = $conn->query($sql);

      // Loop through the results and create an option element for each drug name
      while ($row = $result->fetch_assoc()) {
        $selected = ($row["name"] == $drug1) ? "selected" : "";
        echo "<option value='" . $row["name"] . "' $selected>" . $row["name"] . "</option>";
      }
    ?>
    </select><br>

    <label class="form-control" for="drug2">Drug 2:</label>
    <select name="drug2" class="form-control">
    <?php
      // Retrieve the drug names from the medications table
      $sql = "SELECT name FROM medications";
      $result = $conn->query($sql);

      // Loop through the results and create an option element for each drug name
      while ($row = $result->fetch_assoc()) {
        $selected = ($row["name"] == $drug2) ? "selected" : "";
        echo "<option value='" . $row["name"] . "' $selected>" . $row["name"] . "</option>";

      }
    ?>
    </select><br>

    <input type="submit" class="btn btn-primary" value="Check">
    </div>
  </form>
<br><br>
  <?php
  // Display the warning message (if any)
  if (isset($_SESSION['warning_message'])) {
    $message=$_SESSION['warning_message'];
    echo "<p id='w_msg'>$message</p>";


    unset($_SESSION['warning_message']);
  }
  ?>

</body>



<p id="w_msg">...</p>

</html>


