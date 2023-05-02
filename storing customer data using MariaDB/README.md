#!/bin/bash
### Script that handles customer info in file customers.db
#BASH script manages user data
#	Data files:
#		customers.db:
#			id:name:email
#		accs.db:
#			id,username,pass
#	Operations:
#		Add a customer
#		Delete a customer
#		Update a customer email
#		Query a customer
#	Notes:
#		Add,Delete, update need authentication
#		Query can be anonymous
#	Must be root to access the script
###################### TODO
#################################
### Exit codes:
##	0: Success
##	1: No customers.db file exists
##	2: No accs.db file exists
##	3: no read perm on customers.db
##	4: no read perm on accs.db
##	5: must be root to run the script
##	6: Can not write to customers.db
##	7: Customer name is not found

============================================================================================================================================================================
1-Install MariaDB
	sudo yum install mariadb-server
        sudo systemctl start mariadb
	sudo systemctl enable mariadb
2-Secure MariaDB
	sudo mysql_secure_installation
3-Login to mysql db
	mysql -u root -p
4-Create database
	create database monica;
5-To list databases
	show databases;
6-Start using the new database
	use monica;
7-To list all tables
	show tables;
8-Create user table
	create table customers (id int,name varchar(80),email varchar(100));
9-Insert data into user table
	insert into user (id,username,userpass) values (1,'monica',md5('1234'));
10- create user
        create user 'test_user'@'%' identified by 'password1234';
11-Grant all privilege on iti database to user iti
	grant all privileges on monica.* to 'test_user'@'%';
12-Flush tables
	flush privileges;	
