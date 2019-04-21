/* Formatted on 4/20/2019 7:57:50 PM (QP5 v5.269.14213.34769) */
CREATE TABLE BookList
(
   BookID       NUMBER (3) PRIMARY KEY,
   BookName     VARCHAR2 (100),
   Author       VARCHAR2 (100),
   Lang         VARCHAR2 (50),
   NoOfCopies   NUMBER (2)
);

CREATE TABLE UserList
(
   UserID    NUMBER (3) PRIMARY KEY,
   Name      VARCHAR2 (100),
   Address   VARCHAR2 (100)
);


CREATE TABLE BookAllotment
(
   BookID   NUMBER (3),
   UserId   NUMBER (3),
   CONSTRAINT fk_book FOREIGN KEY (BookId) REFERENCES BOOKLIST (BookId),
   CONSTRAINT fk_user FOREIGN KEY (UserId) REFERENCES userLIST (UserId)
);


ALTER TABLE BOOKLIST
   ADD CATEGORY VARCHAR2 (100);

SELECT *
  FROM BOOKLIST
 WHERE NOOFCOPIES = 5 OR BOOKNAME = 'Mc Queen';

INSERT INTO BOOKLIST
     VALUES (1,
             'Harry Potter',
             'JK',
             'English',
             10);

INSERT INTO BOOKLIST
     VALUES (4,
             'Mc King',
             'Disney',
             'Spanish',
             3,
             'Fiction');

UPDATE BOOKLIST
   SET AUTHOR = 'Disney Land'
 WHERE BOOKID = 3;

DELETE FROM BOOKLIST
      WHERE BOOKID = 3;


INSERT INTO userlist
     VALUES (1, 'mahi', '76 promenade 92612');

SELECT * FROM BookAllotment;

INSERT INTO BookAllotment
     VALUES (2, 1);

DELETE FROM bookallotment
      WHERE bookid = 2;

DELETE FROM booklist
      WHERE bookid = 2;