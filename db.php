<?php

require_once __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$dsn = 'mysql:host=' . $_ENV['DB_HOST']
    . ';port=' . $_ENV['DB_PORT']
    . ';dbname=' . $_ENV['DB_NAME']
    . ';charset=utf8';


$pdo = new PDO($dsn, $_ENV['DB_USER'], $_ENV['DB_PASSWORD'],
[PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC]);

