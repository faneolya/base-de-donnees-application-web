Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 37
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE Client;
Query OK, 1 row affected (9.31 sec)

mysql> CREATE USER 'faneolia'@'localhost' IDENTIFIED BY '1987';
Query OK, 0 rows affected (0.95 sec)

mysql> GRANT SELECT, INSERT ON * . * TO 'faneolia'@'localhost';
Query OK, 0 rows affected (0.24 sec)

mysql> CREATE TABLE chaussures (
    ->
    -> id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ->
    -> couleur VARCHAR (100),
    ->
    -> taille VARCHAR (100),
    ->
    -> prix VARCHAR (100),
    ->
    -> id_de_la_marque VARCHAR (100)
    ->
    -> );
ERROR 1046 (3D000): No database selected
mysql> USE Client;
Database changed
mysql> CREATE TABLE chaussures (
    ->
    -> Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ->
    -> Couleur VARCHAR (100),
    ->
    -> Taille VARCHAR (100),
    ->
    -> Prix VARCHAR (100),
    ->
    -> Id_de_la_marque VARCHAR (100)
    ->
    -> );
Query OK, 0 rows affected (1.50 sec)

mysql> CREATE TABLE marques (
    ->
    -> id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ->
    -> Nom de la marque VARCHAR (100),
    ->
    -> Logo VARCHAR (100)
    ->
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'de la marque VARCHAR (100),

Logo VARCHAR (100)

)' at line 5
mysql> CREATE TABLE marques (
    ->
    -> id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ->
    -> Nom de la marque VARCHAR (100),
    ->
    -> Logo VARCHAR (255)
    ->
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'de la marque VARCHAR (100),

Logo VARCHAR (255)

)' at line 5
mysql> CREATE TABLE marques (
    ->
    -> id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ->
    -> Nom_de_la_marque VARCHAR (100),
    ->
    -> Logo VARCHAR (100)
    ->
    -> );
Query OK, 0 rows affected (0.53 sec)

mysql> SHOW COLUMNS FROM chaussures;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| Id              | int          | NO   | PRI | NULL    | auto_increment |
| Couleur         | varchar(100) | YES  |     | NULL    |                |
| Taille          | varchar(100) | YES  |     | NULL    |                |
| Prix            | varchar(100) | YES  |     | NULL    |                |
| Id_de_la_marque | varchar(100) | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
5 rows in set (0.72 sec)

mysql> SHOW COLUMNS FROM marques;
+------------------+--------------+------+-----+---------+----------------+
| Field            | Type         | Null | Key | Default | Extra          |
+------------------+--------------+------+-----+---------+----------------+
| id               | int          | NO   | PRI | NULL    | auto_increment |
| Nom_de_la_marque | varchar(100) | YES  |     | NULL    |                |
| Logo             | varchar(100) | YES  |     | NULL    |                |
+------------------+--------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)

mysql> INSERT INTO `chaussures` (`couleur`, `taille`, `prix`, `id_de_la_marque`)
    ->
    -> VALUES
    ->
    -> ('rose', '38', '15000f', '2556');
Query OK, 1 row affected (0.53 sec)

mysql> INSERT INTO `chaussures` (`couleur`, `taille`, `prix`, `id_de_la_marque`)
    ->
    -> VALUES
    ->
    -> ('blanche', '42', '25000f', '10005'),
    -> ('noire', '37', '55000f', '006658');
Query OK, 2 rows affected (0.15 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO `marques` (`nom_de_la_marque`, `logo`)
    ->
    -> VALUES
    ->
    -> ('NIKE', 'PUMA', 'ASICS');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> INSERT INTO `marques` (`nom_de_la_marque`, `logo`)
    ->
    -> VALUES
    ->
    -> ('NIKE', 'Nike-Logo'),
    -> ('PUMA', 'Puma-Logo.png'),
    -> ('ASICS', 'Asics-Logo.png');
Query OK, 3 rows affected (0.12 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM chaussures;
+----+---------+--------+--------+-----------------+
| Id | Couleur | Taille | Prix   | Id_de_la_marque |
+----+---------+--------+--------+-----------------+
|  1 | rose    | 38     | 15000f | 2556            |
|  2 | blanche | 42     | 25000f | 10005           |
|  3 | noire   | 37     | 55000f | 006658          |
+----+---------+--------+--------+-----------------+
3 rows in set (0.04 sec)

mysql> SELECT * FROM marques;
+----+------------------+----------------+
| id | Nom_de_la_marque | Logo           |
+----+------------------+----------------+
|  1 | NIKE             | Nike-Logo      |
|  2 | PUMA             | Puma-Logo.png  |
|  3 | ASICS            | Asics-Logo.png |
+----+------------------+----------------+
3 rows in set (0.00 sec)

mysql> UPDATE `chaussures` SET `Couleur` = 'rouge' WHERE `id`='1';
Query OK, 1 row affected (0.19 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM chaussures;
+----+---------+--------+--------+-----------------+
| Id | Couleur | Taille | Prix   | Id_de_la_marque |
+----+---------+--------+--------+-----------------+
|  1 | rouge   | 38     | 15000f | 2556            |
|  2 | blanche | 42     | 25000f | 10005           |
|  3 | noire   | 37     | 55000f | 006658          |
+----+---------+--------+--------+-----------------+
3 rows in set (0.00 sec)

mysql> DELETE FROM `chaussures` WHERE `id`='2';
Query OK, 1 row affected (0.10 sec)

mysql> SELECT * FROM chaussures;
+----+---------+--------+--------+-----------------+
| Id | Couleur | Taille | Prix   | Id_de_la_marque |
+----+---------+--------+--------+-----------------+
|  1 | rouge   | 38     | 15000f | 2556            |
|  3 | noire   | 37     | 55000f | 006658          |
+----+---------+--------+--------+-----------------+
2 rows in set (0.00 sec)

mysql>