<style>
#reminder_form {
  display: flex;
  flex-direction: column;
  align-items: center;
}

#reminder_form input[type="text"],
#reminder_form input[type="date"],
#reminder_form input[type="time"] ,
#medication_id
{
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 5px;
  width: 100%;
  max-width: 400px;
  margin-bottom: 10px;
}

#reminder_form label {
  font-size: 1.2rem;
  margin-bottom: 5px;
}

#reminder_form input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

#reminder_form input[type="submit"]:hover {
  background-color: #2E8B57;
}


    </style>

<?php
// connect to the database
$db = new mysqli('localhost', 'root', '', 'mts_db');

// query the medications table to get a list of medications
$medications_query = "SELECT * FROM medications";
$medications_result = $db->query($medications_query);

?>

<?php
  // Display the warning message (if any)
  if (isset($_SESSION['reminder_msg'])) {
    $message=$_SESSION['reminder_msg'];
    echo "<p id='w_msg' style='color:white;background-color: green; padding: 10px; border: 1px solid #ccc;'>$message</p>";


    unset($_SESSION['reminder_msg']);
  }
  ?>

<form action="./?page=medicines/add_reminder" method="post" id="reminder_form">


<?php
echo "<label for='medication_id'>Medication:</label>";
echo "<select name='medication_id' class='form-control' id='medication_id'>";
while ($medication = $medications_result->fetch_assoc()) {
    echo "<option value='" . $medication['id'] . "'>" . $medication['name'] . "</option>";
}
echo "</select><br>";

?>
    

    <label for="dosage">Dosage:</label>
    <input type="text"  name="dosage" id="dosage"><br>


    <label for="frequency">Frequency:</label>
    <input type="text" name="frequency" id="frequency"><br>
    

    <label for="reminder_date">Reminder Date:</label>
    <input type="date" name="reminder_date" id="reminder_date"><br>
   

    <label for="reminder_time">Reminder Time:</label>
    <input type="time" name="reminder_time" id="reminder_time"><br>
   

    <input type="submit" class="btn btn-success" value="Add Reminder">



</form>
