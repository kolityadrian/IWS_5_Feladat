<?php

require_once __DIR__ . '/db.php';

header('Content-type: application/json; charset=utf-8');

function respond($code, $body)
{
    http_response_code($code);
    echo json_encode($body, JSON_UNESCAPED_UNICODE);
    exit;
}

function findJoke($pdo, $id) {
    $stmt = $pdo->prepare("SELECT * FROM jokes WHERE id = ?");
    $stmt->execute([$id]);
    $row = $stmt->fetch();
    if ($row) {
        $row['id'] = (int)$row['id'];
    }
    return $row;
}

function validate($data) {

    $allowed = ['type', 'joke', 'setup', 'delivery'];
    foreach ($data as $key => $value) {
        if (!in_array($key, $allowed, true)) {
            respond(400, ['error' => 'Nem megengedett mezo: ' . $key]);
        }
    }


    $type = $data['type'] ?? null;
    if ($type !== 'single' && $type !== 'twopart') {
        respond(400, ['error' => 'A type erteke single vagy twopart lehet']);
    }

    $required = $type === 'single' ? ['joke'] : ['setup', 'delivery'];
    $record = ['type' => $type, 'joke' => null, 'setup' => null, 'delivery' => null];
    foreach ($required as $field) {
        $value = $data[$field] ?? null;

        if(!is_string($value) || trim($value) === '') {
            respond(400, ['error' => 'A(z) ' . $field . ' mezo kotelezo, nem lehet ures szoveg.']);
        }

        $record[$field] = $value;
    }

    return $record;
}


function readJsonBody(){
    $contentType = $_SERVER["CONTENT_TYPE"] ?? '';
    if (strpos($contentType, 'application/json') !== 0) {
        respond(415, ['error' => 'Content-type legyen application/json']);
    }
    $data = json_decode(file_get_contents('php://input'), true);

    if (!is_array($data)) {
        respond(400, ['error' => 'Hibas Json']);
    }
    return $data;
}

try {
    $path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
    $base = rtrim(dirname($_SERVER['SCRIPT_NAME']), '/\\');

    if ($base !== '' && strpos($path, $base) === 0) {
        $path = substr($path, strlen($base));
    }

    $parts = explode('/', trim($path, '/'));

    if (count($parts) < 2 || count($parts) > 3 || $parts[0] !== 'api' || $parts[1] !== 'jokes') {
        respond(404, ['error' => 'A vegpont nem letezik']);
    }

    $method = $_SERVER['REQUEST_METHOD'];
    $hasId = count($parts) === 3;

    if (!$hasId) {
        if ($method === 'GET') {
            $rows = $pdo->query('SELECT * FROM jokes ORDER BY id DESC')->fetchAll();
            foreach ($rows as &$r) {
                $r['id'] = (int)$r['id'];
            }
            respond(200, $rows);
        }
        if ($method === 'POST') {

            $record = validate(readJsonBody());
            $stmt = $pdo->prepare("INSERT INTO jokes (type, joke, setup, delivery) VALUES (?, ?, ?, ?)");
            $stmt->execute([$record['type'], $record['joke'], $record['setup'], $record['delivery']]);
            $id = (int)$pdo->lastInsertId();
            header('Location: ' . $base . '/api/jokes/' . $id);
            respond(201, ['message' => 'A vicc sikeresen letrehozva', 'data' => findJoke($pdo, $id)]);
        }

        header('Allow: GET, POST');
        respond(405, ['error' => 'A metodus nem tamogatott']);
    }

    if (!in_array($method, ['GET', 'PUT', 'PATCH', 'DELETE'], true)) {

        header('Allow: GET, PUT, PATCH, DELETE');
        respond(405, ['error' => 'A metod nem tamogatott']);
    }

    if (!ctype_digit($parts[2]) || (int)$parts[2] < 1) {

        respond(400, ['error' => 'Az azonosito pozitiv egesz szam kell hogy legyen']);
    }

    $id = (int)$parts[2];

    $existing = findJoke($pdo, $id);
    if (!$existing) {
        respond(404, ['error' => 'A megadott azonositoju vicc nem talalhato']);
    }

    if ($method === 'GET') {
        respond(200, $existing);
    }

    if ($method === 'DELETE') {
        $stmt = $pdo->prepare("DELETE FROM jokes WHERE id = ?");
        $stmt->execute([$id]);
        respond(200, ['message' => 'A vicc sikeresen torolve']);
    }

    $data = readJsonBody();

    if ($method === 'PATCH') {
        if(count($data) === 0) {
            respond(400, ['error' => 'Legalabb egy mezot kell megadni']);
        }
        foreach ($data as $key => $value) {

            if (!in_array($key, ['type', 'joke', 'setup', 'delivery'], true)) {
                respond(400, ['error' => 'Nem megengedett mezo: ' . $key]);
            }
        }

        $data = array_merge([
            'type' => $existing['type'],
            'joke' => $existing['joke'],
            'setup' => $existing['setup'],
            'delivery' => $existing['delivery']
        ], $data);
    }

    $record = validate($data);
    $stmt = $pdo->prepare('UPDATE jokes SET type = ?, joke = ?, setup = ?, delivery = ? WHERE id = ?');
    $stmt->execute([$record['type'], $record['joke'], $record['setup'], $record['delivery'], $id]);
    respond(200, ['message' => 'A vicc sikeresen modositva', 'data' => findJoke($pdo, $id)]);

} catch(Throwable $e) {
    respond(500, ['error' => 'Varatlan szerverhiba tortent']);
}