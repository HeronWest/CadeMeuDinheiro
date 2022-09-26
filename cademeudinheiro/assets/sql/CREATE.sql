CREATE TABLE IF NOT EXISTS users(
    id              INTEGER PRIMARY KEY autoincrement,
    nick            TEXT,
    name            TEXT,
    passwd          TEXT,
    email           TEXT,
    sald            REAL,
    minim           REAL
);
CREATE TABLE IF NOT EXISTS moviments(
    id              INTEGER PRIMARY KEY autoincrement,
    data            TEXT,
    sald            REAL,
    descri          TEXT,
    type            TEXT
);