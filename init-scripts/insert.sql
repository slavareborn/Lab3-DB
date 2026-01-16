-- === 1. Додаємо Жанри (Genre) ===
INSERT INTO Genre (Title) VALUES 
('Психологія'),
('Історичний роман');

-- === 2. Додаємо Авторів (Author) ===
INSERT INTO Author (FirstName, SecondName, DateOfBirth, DateOfDeath) VALUES 
('Джордж', 'Орвелл', '1903-06-25', '1950-01-21'),
('Юваль', 'Харарі', '1976-02-24', NULL);

-- === 3. Додаємо Персонал (Staff) ===
INSERT INTO Staff (FullName, Address, Phone, Position, Education) VALUES 
('Петро Бібліотекар', 'м. Київ, вул. Лісна, 5', '+380501234567', 'Менеджер', 'Магістр'),
('Ольга Охоронець', 'м. Київ, вул. Полева, 8', '+380671234567', 'Охорона', 'Середня');

-- === 4. Додаємо Читачів (Member) ===
INSERT INTO Member (FullName, Phone, Email, Address) VALUES 
('Андрій Читач', '+380931234567', 'andriy@test.com', 'м. Львів, вул. Свободи, 1'),
('Олена Студентка', '+380991234567', 'olena@test.com', 'м. Київ, вул. Науки, 10');

-- === 5. Додаємо Книги (Book) ===
-- Припускаємо, що Author_ID та Genre_ID вже існують. 
-- Якщо ви запускали попередні скрипти, ID можуть відрізнятися, перевірте їх.
INSERT INTO Book (Title, Author_ID, AmountOfPages, Cost, PublisherYear, Publication, CopiesAvailable, Genre_ID) VALUES 
('1984', 1, 328, 350.00, 1949, 'Видавництво Старого Лева', 10, 1), 
('Sapiens: Людина розумна', 2, 544, 600.00, 2011, 'BookChef', 5, 2);

-- === 6. Додаємо Позики (Loan) ===
INSERT INTO Loan (Book_ID, Member_ID, Staff_ID, LoanDate, DueDate, ReturnDate) VALUES 
(1, 1, 1, CURRENT_DATE, CURRENT_DATE + 14, NULL), -- Книга ще на руках
(2, 2, 1, CURRENT_DATE - 5, CURRENT_DATE + 9, CURRENT_DATE); -- Книгу вже повернули

-- === 7. Додаємо Штрафи (Fine) ===
-- Прив'язуємо штраф до другої позики (Loan_ID = 2)
INSERT INTO Fine (Date, Amount, Member_ID, Loan_ID) VALUES 
(CURRENT_DATE, 50.00, 2, 2),
(CURRENT_DATE, 10.00, 1, 1);