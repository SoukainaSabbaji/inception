

CREATE DATABASE IF NOT EXISTS mydb ;
CREATE USER IF NOT EXISTS 'hamid'@'%' IDENTIFIED BY 'hamid69';
GRANT ALL PRIVILEGES ON mydb.* TO 'hamid'@'%' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root69';
FLUSH PRIVILEGES;