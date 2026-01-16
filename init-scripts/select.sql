-- === 1. Простий вибір всіх стовпців ===
SELECT * FROM Book;

-- === 2. Вибір конкретних стовпців з фільтрацією (WHERE) ===
-- Показати тільки імена та телефони читачів, які живуть у Києві
SELECT FullName, Phone 
FROM Member 
WHERE Address LIKE '%Київ%';

-- === 3. Фільтрація за числами ===
-- Знайти книги дорожчі за 400 грн
SELECT Title, Cost, PublisherYear 
FROM Book 
WHERE Cost > 400;

-- === 4. Фільтрація за NULL ===
-- Знайти авторів, які ще живі (DateOfDeath не заповнено)
SELECT FirstName, SecondName 
FROM Author 
WHERE DateOfDeath IS NULL;

-- === 5. Складніша умова (AND) ===
-- Знайти позики, які ще не повернули (Active) І які видав працівник з ID = 1
SELECT * FROM Loan 
WHERE ReturnDate IS NULL AND Staff_ID = 1;

