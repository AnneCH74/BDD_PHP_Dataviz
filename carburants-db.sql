-- SQLite

DROP TABLE IF EXISTS point_de_vente;
DROP TABLE IF EXISTS fermeture;
DROP TABLE IF EXISTS horaires;
DROP TABLE IF EXISTS service;
DROP TABLE IF EXISTS point_de_vente_service;
DROP TABLE IF EXISTS carburant;
DROP TABLE IF EXISTS prix;
DROP TABLE IF EXISTS rupture;

CREATE TABLE point_de_vente (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        latitude REAL,
        longitude REAL,
        cp INTEGER,
        type TEXT,
        adresse TEXT,
        ville TEXT,
        automate_24 BOOLEAN
);

CREATE TABLE fermeture (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        point_de_vente_id INTEGER NOT NULL,
        type TEXT,
        debut DATETIME,
        fin DATETIME,
        FOREIGN KEY (point_de_vente_id)  REFERENCES point_de_vente (id) ON DELETE CASCADE
);

CREATE TABLE horaires (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        point_de_vente_id INTEGER NOT NULL,
        jour TEXT,
        ferme TEXT,
        horaire_ouverture TEXT,
        horaire_fermeture TEXT,
        FOREIGN KEY (point_de_vente_id)  REFERENCES point_de_vente (id) ON DELETE CASCADE
);

CREATE TABLE service (
    nom TEXT
);

CREATE TABLE point_de_vente_service(
    point_de_vente_id INTEGER NOT NULL,
    service_nom TEXT,
    FOREIGN KEY (service_nom) REFERENCES service (nom) ON DELETE CASCADE,
        FOREIGN KEY (point_de_vente_id)  REFERENCES point_de_vente (id) ON DELETE CASCADE
);

CREATE TABLE carburant (
    nom TEXT
);

CREATE TABLE prix(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    point_de_vente_id INTEGER NOT NULL,
    carburant_nom TEXT,
    valeur FLOAT,
    date DATETIME,
        FOREIGN KEY (point_de_vente_id)  REFERENCES point_de_vente (id) ON DELETE CASCADE,
        FOREIGN KEY (carburant_nom) REFERENCES carburant (nom) ON DELETE CASCADE
);

CREATE TABLE rupture(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    point_de_vente_id INTEGER NOT NULL,
    FOREIGN KEY (point_de_vente_id)  REFERENCES point_de_vente (id) ON DELETE CASCADE
);

INSERT INTO point_de_vente (latitude, longitude, cp, type, adresse, ville, automate_24)
VALUES
(4620100.00,519800.00,01000,'R','596 AVENUE DE TREVOUX','SAINT-DENIS-LèS-BOURG',FALSE),
(4621842.00,522767.00,01000,'A','16 Avenue de Marboz','BOURG-EN-BRESSE',FALSE),
(1000004.00,4618800.00,01000,'R','20 Avenue du Maréchal Juin','BOURG-EN-BRESSE',FALSE);

INSERT INTO fermeture (point_de_vente_id, type, debut, fin)
VALUES
(1,'Noel','21-12-2022 00:00:00','31-12-2022 23:59:59'),
(2,'Ete','20-07-2023 00:00:00','15-08-2023 23:59:59'),
(2,'Noel','24-12-2023 00:00:00','02-01-2024 23:59:59');

INSERT INTO horaires (point_de_vente_id, jour, ferme, horaire_ouverture, horaire_fermeture)
VALUES
(1,'lundi','ouvert','07h00','20h00'),
(1,'mardi','ouvert','07h00','20h00'),
(1,'mercredi','ouvert','07h00','20h00'),
(1,'jeudi','ouvert','07h00','20h00'),
(1,'vendredi','ouvert','07h00','20h00'),
(1,'samedi','ouvert','07h00','20h00'),
(1,'dimanche','ouvert','07h00','20h00'),
(2,'lundi','ferme','00h00','23h59'),
(2,'mardi','ferme','00h00','23h59'),
(2,'mercredi','ferme','00h00','23h59'),
(2,'jeudi','ouvert','07h00','20h00'),
(2,'vendredi','ouvert','00h00','23h59'),
(2,'samedi','ouvert','00h00','23h59'),
(2,'dimanche','ouvert','00h00','23h59'),
(3,'lundi','ouvert','00h00','23h59'),
(3,'mardi','ferme','00h00','23h59'),
(3,'mercredi','ouvert','00h00','23h59'),
(3,'jeudi','ferme','07h00','20h00'),
(3,'vendredi','ouvert','00h00','23h59'),
(3,'samedi','ferme','00h00','23h59'),
(3,'dimanche','ouvert','00h00','23h59');

INSERT INTO service (nom)
VALUES
('lavage voiture'),
('pression des pneus'),
('aspirateur');

INSERT INTO carburant (nom)
VALUES
('SP95'),
('SP98'),
('Diesel');

INSERT INTO point_de_vente_service (point_de_vente_id, service_nom)
VALUES
(1,'lavage voiture'),
(1,'pression des pneus'),
(1,'aspirateur'),
(2,'lavage voiture'),
(2,'pression des pneus');

INSERT INTO prix (point_de_vente_id, carburant_nom, valeur, date)
VALUES
(1,'SP95', '1.695 €', '06:06:2023 08:00'),
(1,'SP98', '1.999 €', '06:06:2023 08:00'),
(1,'Diesel', '1.500 €', '06:06:2023 08:00'),
(2,'SP95', '1.690 €', '06:06:2023 09:00'),
(2,'SP98', '2.019 €', '06:06:2023 09:00'),
(2,'Diesel', '1.600 €', '06:06:2023 09:00'),
(3,'SP95', '2.095 €', '04:06:2023 10:00'),
(3,'SP98', '1.999 €', '04:06:2023 10:00'),
(3,'Diesel', '1.500 €', '04:06:2023 10:00');

INSERT INTO rupture(point_de_vente_id)
VALUES
(3);


--SELECT * FROM rupture;