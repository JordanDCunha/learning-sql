-- ========================================
-- Chapter 4: Cascading Delete
-- Database: SQLite
-- ========================================

PRAGMA foreign_keys = ON;

-- Clean start
DROP TABLE IF EXISTS T_Room;
DROP TABLE IF EXISTS T_Client;

-- ========================================
-- Create Parent Table
-- ========================================

CREATE TABLE T_Client (
    CLI_ID INTEGER PRIMARY KEY,
    ClientName TEXT NOT NULL
);

-- ========================================
-- Create Child Table (WITH CASCADE)
-- ========================================

CREATE TABLE T_Room (
    RM_ID INTEGER PRIMARY KEY,
    RM_CLI_ID INTEGER,
    RoomName TEXT,
    FOREIGN KEY (RM_CLI_ID)
        REFERENCES T_Client(CLI_ID)
        ON DELETE CASCADE
);

-- ========================================
-- Insert Sample Data
-- ========================================

INSERT INTO T_Client (ClientName)
VALUES ('Client A'), ('Client B');

INSERT INTO T_Room (RM_CLI_ID, RoomName)
VALUES
    (1, 'Room 101'),
    (1, 'Room 102'),
    (2, 'Room 201');

-- ========================================
-- Delete Parent
-- ========================================

DELETE FROM T_Client WHERE CLI_ID = 1;

-- Now all rooms with RM_CLI_ID = 1 are automatically deleted

SELECT * FROM T_Client;
SELECT * FROM T_Room;
