-- SQLite
PRAGMA foreign_keys = ON;

CREATE TABLE jurisdiction_hierarchy (
id INTEGER PRIMARY KEY AUTOINCREMENT,

name VARCHAR(30) NOT NULL UNIQUE,

level VARCHAR(20) NOT NULL
    CHECK(level IN('County', 'Sub-County', 'Village')),

parent VARCHAR(30) NULL,

FOREIGN KEY(parent) REFERENCES jurisdiction_hierarchy(name) ON DELETE CASCADE
);    

CREATE TABLE village_locations (
village_id INTEGER PRIMARY KEY AUTOINCREMENT,

village VARCHAR(30) NOT NULL UNIQUE,

total_population INTEGER NOT NULL
    CHECK(total_population >=0),

FOREIGN KEY(village) REFERENCES jurisdiction_hierarchy(name) ON DELETE CASCADE
);

CREATE TABLE beneficiary_partner_data (
partner_id INTEGER PRIMARY KEY AUTOINCREMENT,

partner VARCHAR(30) NOT NULL,

village VARCHAR(30) NOT NULL,

beneficiaries INTEGER NOT NULL
    CHECK(beneficiaries >=0),

beneficiary_type VARCHAR(30) NOT NULL
    CHECK(beneficiary_type IN('Individuals', 'Households')),

FOREIGN KEY(village) REFERENCES village_locations(village) ON DELETE CASCADE
);

-- COUNTIES
INSERT INTO jurisdiction_hierarchy (name, level, parent)
VALUES
('Nairobi', 'County', NULL),
('Kiambu', 'County', NULL),
('Mombasa', 'County', NULL);

-- SUB-COUNTIES
INSERT INTO jurisdiction_hierarchy (name, level, parent)
VALUES
('Westlands', 'Sub-County', 'Nairobi'),
('Kasarani', 'Sub-County', 'Nairobi'),
('Lari', 'Sub-County', 'Kiambu'),
('Gatundu South', 'Sub-County', 'Kiambu'),
('Kisauni', 'Sub-County', 'Mombasa'),
('Likoni', 'Sub-County', 'Mombasa');

-- VILLAGES
INSERT INTO jurisdiction_hierarchy (name, level, parent)
VALUES
('Parklands', 'Village', 'Westlands'),
('Kangemi', 'Village', 'Westlands'),
('Roysambu', 'Village', 'Kasarani'),
('Githurai', 'Village', 'Kasarani'),
('Kiamwangi', 'Village', 'Lari'),
('Lari Town', 'Village', 'Lari'),
('Kamwangi', 'Village', 'Gatundu South'),
('Kisauni Town', 'Village', 'Kisauni'),
('Mtopanga', 'Village', 'Kisauni'),
('Likoni Town', 'Village', 'Likoni'),
('Shika Adabu', 'Village', 'Likoni');

INSERT OR IGNORE INTO village_locations(village, total_population)
VALUES
('Parklands', 15000),
('Kangemi', 18000),
('Roysambu', 13000),
('Githurai', 12500),
('Kiamwangi', 12800),
('Lari Town', 9485),
('Kamwangi', 5212),
('Kisauni Town', 20500),
('Mtopanga', 15500),
('Likoni Town', 12000),
('Shika Adabu', 9000)

INSERT INTO beneficiary_partner_data(partner, village, beneficiaries, beneficiary_type)
VALUES
('IRC', 'Parklands', 1450, 'Individual'),
('NRC', 'Parklands', 50, 'Households'),
('SCI', 'Kangemi', 1123, 'Individual'),
('IMC', 'Kangemi', 1245, 'Individual'),
('CESVI', 'Roysambu', 5200, 'Individual'),
('IMC', 'Githurai', 70, 'Households'),
('IRC', 'Githurai', 2100, 'Individual'),
('SCI', 'Kiamwangi', 1800, 'Individual'),
('IMC', 'Lari Town', 1340, 'Individual'),
('CESVI', 'Kamwangi', 55, 'Households'),
('IRC', 'Kisauni Town', 4500, 'Individual'),
('SCI', 'Kisauni Town', 1670, 'Individual'),
('IMC', 'Mtopanga', 1340, 'Individual'),
('CESVI', 'Likoni Town', 4090, 'Individual'),
('IRC', 'Shika Adabu', 2930, 'Individual'),
('SCI', 'Shika Adabu', 5200, 'Individual')

SELECT * FROM jurisdiction_hierarchy

SELECT * FROM village_locations

SELECT * FROM beneficiary_partner_data

-- Aggregate Functions, GROUP BY and CASE WHEN
-- Total beneficiaries per partner
SELECT
partner,
SUM(beneficiaries) AS total_beneficiaries
FROM beneficiary_partner_data
GROUP BY partner;

-- Count number of villages served per partner
SELECT
partner,
COUNT(DISTINCT village) AS village_served
FROM beneficiary_partner_data
GROUP BY partner;

-- Average beneficiaries per village
SELECT
village,
AVG(beneficiaries) AS avg_beneficiaries
FROM beneficiary_partner_data
GROUP BY village;

-- Partners serving more than 5000 beneficiaries
SELECT
partner,
SUM(beneficiaries) AS total_beneficiaries
FROM beneficiary_partner_data
GROUP BY partner
HAVING SUM(beneficiaries) > 5000;

-- Villages with multiple partners
SELECT
village,
COUNT(DISTINCT partner) AS number_of_partners
FROM beneficiary_partner_data
GROUP BY village
HAVING COUNT(DISTINCT partner) > 1;


