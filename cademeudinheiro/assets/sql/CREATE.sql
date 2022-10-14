CREATE TABLE IF NOT EXISTS users(
    id              INTEGER PRIMARY KEY autoincrement,
    nick            TEXT,
    name            TEXT,
    passwd          TEXT,
    email           TEXT,
    sald            REAL,
    minim           REAL,
    type            TEXT
);
CREATE TABLE IF NOT EXISTS moviments(
    id              INTEGER PRIMARY KEY autoincrement,
    user_id         INTEGER,
    responsible     INTEGER,
    data            TEXT,
    local           TEXT,
    value           REAL,
    descri          TEXT,
    type            TEXT
);