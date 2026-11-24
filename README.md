# Task 5 - Jokes API

## 1. Adatbazis beallitasa

1. Inditsuk el az Apache-ot es a MySQL-t
2. phpMyAdminban futtassuk le a jokes_db.sql fajlt.


## 2. Kornyezeti beallitasok

Masold le a `.env.example` fajlt `.env` neven, es irjuk
at a sajat adatainkra.

## 3. Csomagok telepitese

composer install

## 4. Az alkalmazas inditsa

Masoljuk a projektet az Apache `htdocs` mappajapa 

pl. `C:\xampp\htdocs\`

## 5. Postman

1. Importaljuk a `Task5_Jokes_API.postman_collection.json` fajlt.
2. A kollekcio `baseUrl` valtozojat allitsuk az alkalmazas alapcimere,
zaro perjel nelkul

pl. `http://localhost/5_Szemeszter/Integralt_web/5_feladat`

3. Futtassuk le a teljes kollekciot (Run). Postman asztali alkalmazas kell,
hogy elerje a localhost-ot.

## REST API vegpontok

Keres               |   Muvelet
                    |
`GET /api/jokes`    |    Osszes vicc
`GET /api/jokes{id}`|    Egy vicc    
