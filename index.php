<?php

require_once __DIR__ . '/db.php';

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;

$interval = 300;

$url = 'https://v2.jokeapi.dev/joke/Programming?amount=10';
$error = null;

$row = $pdo->query('SELECT TIMESTAMPDIFF(SECOND, MAX(date_time), NOW()) AS elapsed FROM logs')->fetch();

$elapsed = $row['elapsed'];

if ($elapsed === null || $elapsed > $interval) {

    $stmt = $pdo->prepare('INSERT INTO logs (url) VALUES (?)');
    $stmt->execute([$url]);

    try {
        $client = new Client(['timeout' => 10]);
        $response = $client->get($url);
        $data = json_decode($response->getBody()->getContents(), true);

        if (!is_array($data) || !empty($data['error']) || empty($data['jokes'])) {
            $error = 'A JokeAPI hibas valaszt adott.';
        } else {
            $insert = $pdo->prepare(
                'INSERT INTO jokes (type, joke, setup, delivery)
VALUES (?, ?, ?, ?)');

            foreach ($data['jokes'] as $j) {
                if ($j['type'] === 'single') {
                    $insert->execute(['single', $j['joke'], null, null]);
                } else {
                    $insert->execute(['twopart', null, $j['setup'], $j['delivery']]);
                }
            }

         }
} catch (Exception $e) {
    $error = 'A JokeApi keres sikertelen volt.';
    }
}

$jokes = $pdo->query('SELECT * FROM jokes ORDER BY id DESC LIMIT 10')->fetchAll();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<?php if ($error) : ?>
    <p style="color:red;"><?= htmlspecialchars($error) ?></p>
<?php endif; ?>

<?php foreach ($jokes as $j) : ?>
    <div style="margin-bottom:20px;">
        <?php if ($j['type'] === 'single') : ?>
            <p><?= htmlspecialchars($j['joke']) ?></p>
        <?php else : ?>
            <p><?= htmlspecialchars($j['setup']) ?></p>
            <p><strong><?= htmlspecialchars($j['delivery']) ?></strong></p>
        <?php endif; ?>
    </div>
<?php endforeach; ?>
</body>
</html>

