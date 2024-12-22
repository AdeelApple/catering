<?php

session_start();
if (!isset($_SESSION['userid']))
    header("Location: login.php");


include "inc/build.php";

// download am_catering database export from phpmyadmin as am_catering.sql
$backup_file = dirname(__DIR__) . '/am_catering.sql';
$command = "mysqldump --user={$db_user} --password={$db_pass} --host={$db_host} {$db_name} > {$backup_file}";
system($command);

// Set headers to initiate file download
header('Content-Description: File Transfer');
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename=' . basename($backup_file));
header('Content-Transfer-Encoding: binary');
header('Expires: 0');
header('Cache-Control: must-revalidate');
header('Pragma: public');
header('Content-Length: ' . filesize($backup_file));

// Read the file and output its contents
readfile($backup_file);
exit;
?>