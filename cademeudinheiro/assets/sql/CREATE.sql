CREATE TABLE IF NOT EXISTS users(
    id              INTEGER,
    name            TEXT,
    email           TEXT,
    sald            REAL,
    minim           REAL
);
CREATE TABLE IF NOT EXISTS moviments(
    id              INTEGER,
    userID          INTEGER,
    data            TEXT,
    sald            REAL,
    descri          TEXT,
    type            TEXT
);