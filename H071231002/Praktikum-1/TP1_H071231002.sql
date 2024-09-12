#nomor 1
CREATE DATABASE library;

USE library;

CREATE TABLE authors(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama VARCHAR(100) NOT NULL
)

CREATE TABLE books(
	id INT PRIMARY KEY AUTO_INCREMENT,
	isbn VARCHAR(13),
	title VARCHAR(100) NOT NULL,
	author_id INT,
	FOREIGN KEY(author_id) REFERENCES authors(id)
)

#nomor 2
ALTER TABLE authors
ADD COLUMN nationality VARCHAR(50);

#nomor 3
ALTER TABLE books
MODIFY COLUMN isbn VARCHAR(13) UNIQUE;

#nomor 4
DESCRIBE authors;
DESCRIBE books;

#nomor 5

#memodifikasi table authors agar sesuai dengna skema
ALTER TABLE authors
MODIFY COLUMN nationality VARCHAR(50) NOT NULL;

#memodifikasi table book
ALTER TABLE books
MODIFY COLUMN isbn CHAR(13) UNIQUE NOT NULL;
ALTER TABLE books
MODIFY COLUMN author_id INT NOT NULL;
ALTER TABLE books
ADD COLUMN published_year YEAR NOT NULL;
ALTER TABLE books
ADD COLUMN genre VARCHAR(50) NOT NULL;
ALTER TABLE books
ADD COLUMN copies_available INT NOT NULL;

#membuat table members
CREATE TABLE members(
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone_number CHAR(10),
	join_date DATE,
	membership_type VARCHAR(50) NOT NULL	
)
#mengedit untuk join_date menjadi not null
ALTER TABLE members
MODIFY COLUMN join_date DATE NOT NULL;
DESCRIBE members;

#membuat table borrowings
CREATE TABLE borrowings(
	id INT PRIMARY KEY AUTO_INCREMENT,
	member_id INT NOT NULL,
	book_id INT NOT NULL,
	borrow_date DATE NOT NULL,
	return_date DATE,
	FOREIGN KEY(member_id) REFERENCES members(id),
	FOREIGN KEY(book_id) REFERENCES books(id)
)
DESCRIBE borrowings;