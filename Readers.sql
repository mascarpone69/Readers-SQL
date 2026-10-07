CREATE DATABASE readers;
USE readers;
CREATE TABLE readers (
    READER_NUM INT AUTO_INCREMENT,
    READER_NAME VARCHAR(100),
    READER_ADRESS VARCHAR(1000),
    READER_PHONE CHAR(10) NOT NULL,
    PRIMARY KEY (READER_NUM)
);

Create table books (
BOOK_NUM int AUTO_INCREMENT,
    BOOK_AUTHOR varchar(200),
    BOOK_NAME varchar(100),
    BOOK_COUNT char(10) NOT NULL default 0,
    PRIMARY KEY (BOOK_NUM)
);

Create table books_in_use (
READER_NUM int,
BOOK_NUM int,
ISSUE_DATE date,
RETURN_DATE date,
RETURN_PERIOD tinyint NOT NULL default 14,
FINE_AMOUNT decimal(10,2) NOT NULL default 0,
    
Primary key (READER_NUM, BOOK_NUM, ISSUE_DATE),
    
FOREIGN KEY (BOOK_NUM) REFERENCES books(BOOK_NUM),
FOREIGN KEY (READER_NUM) REFERENCES readers(READER_NUM)
);

INSERT INTO readers (READER_NAME, READER_ADRESS, READER_PHONE)
VALUES
('Сидоров', 'ул. Ленина, 5а', '4424556'),
('Ванюшкин', 'ул. Космонавтов, д. 31, кв. 143', '4545222'),
('Дроздов', 'ул. Ленина, д. 3, кв. 13', '8955454'),
('Голубева', 'ул. Тимирязева, д. 35, кв. 18', '5454555'),
('Шишкин', 'ул. Революции, д. 16/7, кв. 45', '454564564'),
('Книголюбова', 'ул. Пушкина, д. 38', '54664545'),
('Петров', 'ул. Пушкина, д. 31, кв. 16', '6115646'),
('Паринова', NULL, '46488484'),
('Птичкина', 'ул. Зеленая, д. 3/7', '65545445'),
('Дроздов', 'ул. Конструкторов, д. 89, кв. 14', '546544');

INSERT INTO books (BOOK_AUTHOR, BOOK_NAME, BOOK_COUNT)
VALUES
('Толстой', 'Война и мир', 15),
('Достоевский', 'Идиот', 13),
('Пушкин', 'Евгений Онегин', 18),
('Пушкин', 'Руслан и Людмила', 5),
('Пушкин', 'Медный всадник', 11),
('Барто', 'Стихи детям', 1),
('Чехов', 'Вишневый сад', 8),
('Чехов', 'Дядя Ваня', 7),
('Тургенев', 'Отцы и дети', 13),
('Тургенев', 'Муму', 4);

INSERT INTO books_in_use (READER_NUM, BOOK_NUM, ISSUE_DATE, RETURN_DATE)
VALUES
(1, 1, '2023-09-15', '2023-10-17'),
(1, 8, '2023-10-17', NULL),
(2, 1, '2023-10-04', '2023-10-16'),
(3, 2, '2023-09-11', '2023-09-30'),
(3, 4, '2023-09-11', '2023-09-30'),
(3, 5, '2023-09-11', '2023-09-30'),
(4, 1, '2023-09-28', '2023-10-05'),
(4, 3, '2023-09-28', '2023-10-05'),
(4, 8, '2023-10-05', '2023-10-31'),
(5, 6, '2023-09-14', '2023-10-14'),
(6, 1, '2023-09-09', '2023-09-20'),
(6, 1, '2023-09-20', '2023-10-01'),
(7, 1, '2023-09-13', '2023-09-21'),
(7, 7, '2023-09-21', '2023-10-20'),
(8, 7, '2023-09-11', NULL);

Update books_in_use
Set fine_amount = 
If (return_date is null,
0,
GREATEST(DATEDIFF(return_date, issue_date) - return_period, 0) * 8.45
    );

select * from readers; 
