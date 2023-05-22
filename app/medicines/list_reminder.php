<style>

table {
  border-collapse: collapse;
  width: 100%;
  margin: 20px 0;
  font-size: 1rem;
  font-family: Arial, sans-serif;
}

th, td {
  text-align: left;
  padding: 8px;
  border: 1px solid #ddd;
}

th {
  background-color: #f2f2f2;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}


    </style>


<?php
// connect to the MySQL database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "mts_db";
$conn = mysqli_connect($servername, $username, $password, $dbname);

// check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// select reminders table
mysqli_select_db($conn, "reminders");

// retrieve all reminders data

$user_id = $_SESSION['login_user_id'];


$sql = "SELECT r.medication_id,m.name, r.reminder_date, r.reminder_time, r.dosage, r.frequency 
FROM reminders r inner join medications m ON m.id=r.medication_id where user_id =$user_id ";
$result = mysqli_query($conn, $sql);

// check if any reminders found
if (mysqli_num_rows($result) > 0) {
    // display reminders in a table format
    echo "<br>";
    echo "<h2>The List of Reminders for my Medications</h2>";

     // Display the warning message (if any)
  if (isset($_SESSION['reminder_msg'])) {
    $message=$_SESSION['reminder_msg'];
    echo "<p id='w_msg' style='color:white;background-color: green; padding: 10px; border: 1px solid #ccc;'>$message</p>";


    unset($_SESSION['reminder_msg']);
  }


    echo "<br>";
    echo "<br>";
    echo "<table class='table table-bordered'>";
    echo "<tr><th>Medication</th><th>Reminder Date</th><th>Reminder Time</th><th>Dosage</th><th>Frequency</th></tr>";
    while($row = mysqli_fetch_assoc($result)) {
        echo "<tr><td>".$row["name"]."</td><td>".$row["reminder_date"]."</td><td>".$row["reminder_time"]."</td><td>".$row["dosage"]."</td><td>".$row["frequency"]."</td></tr>";
    }
    echo "</table>";
} else {
    echo "No reminders found.";
}

// close database connection
mysqli_close($conn);
?>
