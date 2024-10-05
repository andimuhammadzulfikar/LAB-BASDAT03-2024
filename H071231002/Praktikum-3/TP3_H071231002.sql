SELECT * FROM authors;
SELECT * FROM books;
SELECT * FROM borrowings;
SELECT * FROM members;



INSERT INTO authors
VALUEScustomers
(1, 'Tere Liye', 'Inondonesian'),
(2, 'J.K. Rowling', 'Britis'),
(3, 'Andrea Hirata', '');


INSERT INTO books
VALUES
(1, '7040289780375', 'Ayah', 3, 2015, 'Fiction', 15),
(2, '9780375704025', 'Bumi', 1, 2014, 'Fantasy', 5),
(3, '8310371703024', 'Bulan', 1, 2015, 'Fantasy', 3),
(4, '9780747532699', 'Harry Potter and the Philosopher`s Stone', 2, 1997, '', 10),
(5, '7210301703022', 'The Running Gave', 2, 2016, 'Fiction', 11);


INSERT INTO members
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', NULL, '2023-04-29', ''),
(2, 'Alice', 'Johnson', 'alice.johnsone@example.com', 1231231231, '2023-05-01', 'Standar'),
(3, 'Bob', 'Williams', 'bob.williams@example.com', 3213214321, '2023-06-20', 'Premium');



INSERT INTO borrowings
VALUES
(1, 1, 4, '2023-07-10', '2023-07-25'),
(2, 3, 1, '2023-08-01', NULL),
(3, 2, 5, '2023-09-06', '2023-09-09'),
(4, 2, 3, '2023-09-08', NULL),
(5, 3, 2, '2023-09-10', NULL);




#nomor 2
UPDATE books
SET copies_available = copies_available - 1
WHERE id = 1 OR 2 OR 3;



#nomor 3
UPDATE members
SET membership_type = 'Standar'
WHERE membership_type = 'Premium';




SHOW CREATE TABLE borrowings;

ALTER TABLE borrowings
DROP FOREIGN KEY borrowings_ibfk_1;

ALTER TABLE borrowings
ADD FOREIGN KEY(member_id) REFERENCES members(id);
ON DELETE CASCADE;


DELETE FROM members 
WHERE membership_type = 'Standar';

SELECT * FROM members;
SELECT * FROM borrowings;







