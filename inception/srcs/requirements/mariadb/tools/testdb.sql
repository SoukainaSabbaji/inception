CREATE DATABASE my_database;
CREATE USER IF NOT EXISTS 'myuser'@'localhost' IDENTIFIED BY '1111';
GRANT ALL PRIVILEGES ON my_database.* TO 'my_user'@'%' IDENTIFIED BY 'my_password';
FLUSH PRIVILEGES;
