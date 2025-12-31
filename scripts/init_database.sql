-- Connect to an admin database (usually postgres)
-- \c postgres   -- (run this in psql, not inside a SQL script)

-- Terminate existing connections to DataWarehouse
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'datawarehouse'
  AND pid <> pg_backend_pid();

-- Drop database if it exists
DROP DATABASE IF EXISTS datawarehouse;

-- Create the database
CREATE DATABASE datawarehouse;

-- Connect to the new database
-- \c datawarehouse   -- (psql only)

-- Create schemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;

