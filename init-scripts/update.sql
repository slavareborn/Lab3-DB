-- === 1. Зміна ціни книги ===
-- Книга '1984' подорожчала
UPDATE Book 
SET Cost = 420.00 
WHERE Title = '1984';

-- Перевірка результату
SELECT Title, Cost FROM Book WHERE Title = '1984';

-- === 2. Зміна даних читача ===
-- Андрій Читач змінив email
UPDATE Member 
SET Email = 'new_email_andriy@test.com',
    UpdatedAt = CURRENT_TIMESTAMP
WHERE FullName = 'Андрій Читач';

-- === 3. "Повернення" книги (оновлення дати в Loan) ===
-- Закриваємо позику для книги з ID 1, яку взяв Member 1
UPDATE Loan 
SET ReturnDate = CURRENT_DATE 
WHERE Book_ID = 1 AND Member_ID = 1 AND ReturnDate IS NULL;

-- === 4. Виправлення помилки в імені автора ===
UPDATE Author 
SET FirstName = 'Юваль Ной' 
WHERE SecondName = 'Харарі';