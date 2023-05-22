<?php


// Create a new mysqli object and connect to the database
$mysqli = new mysqli('localhost', 'root', '', 'mts_db');

// Check if the connection was successful
if ($mysqli->connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli->connect_error;
  exit();
}

// Get the form data
$medication_id = $_POST['medication_id'];
$dosage = $_POST['dosage'];
$frequency = $_POST['frequency'];
$reminder_date = $_POST['reminder_date'];
$reminder_time = $_POST['reminder_time'];

$user_id = $_SESSION['login_user_id'];

//print_r($_SESSION);
//exit();

// Prepare the SQL statement
$sql = "INSERT INTO reminders (user_id, medication_id, reminder_date, reminder_time, dosage, frequency) 
VALUES ('$user_id', '$medication_id', '$reminder_date', '$reminder_time', '$dosage', '$frequency')";

// Execute the SQL statement
if ($mysqli->query($sql) === TRUE) {
  echo "New reminder added successfully";
  $_SESSION['reminder_msg']='New reminder added successfully';
  echo "<script>window.location.href='./?page=medicines/list_reminder';</script>";
  
} else {
  echo "Error: " . $sql . "<br>" . $mysqli->error;

  $_SESSION['reminder_msg']="Error: " . $sql . "<br>" . $mysqli->error;
  echo "<script>window.location.href='./?page=medicines/list_reminder';</script>";
 
}


?>
