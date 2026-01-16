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

-- === 6. Використання ORDER BY ===
-- Показати всі книги, відсортовані за роком видання (найновіші першими), не більше двох
SELECT 
    m.FullName AS "Ім'я читача", 
    m.Email, 
    COUNT(l.Loan_ID) AS "Кількість взятих книг"
FROM Member m
JOIN Loan l ON m.Member_ID = l.Member_ID
GROUP BY m.Member_ID, m.FullName, m.Email
ORDER BY "Кількість взятих книг" DESC
LIMIT 2;

-- === 7. Використання агрегатних функцій та GROUP BY ===
-- Знайти читачів, які мають штрафи більше 50 грн загалом
SELECT 
    m.FullName AS "Читач",
    m.Phone,
    SUM(f.Amount) AS "Загальна сума штрафів"
FROM Member m
JOIN Fine f ON m.Member_ID = f.Member_ID
GROUP BY m.Member_ID, m.FullName, m.Phone
HAVING SUM(f.Amount) > 50
ORDER BY "Загальна сума штрафів" DESC;

-- === 8. Складний запит з JOIN та обчисленням прострочення ===
-- Показати всі прострочені позики з інформацією про книгу, читача та працівника
SELECT 
    b.Title AS "Книга",
    m.FullName AS "Хто тримає",
    l.DueDate AS "Мав повернути",
    (CURRENT_DATE - l.DueDate) AS "Днів прострочення",
    s.FullName AS "Хто видав книгу"
FROM Loan l
JOIN Book b ON l.Book_ID = b.Book_ID
JOIN Member m ON l.Member_ID = m.Member_ID
JOIN Staff s ON l.Staff_ID = s.Staff_ID
WHERE l.ReturnDate IS NULL 
  AND l.DueDate < CURRENT_DATE
ORDER BY "Днів прострочення" DESC;


-- === 9. Використання LEFT JOIN для пошуку книг, які ніколи не брали ===
SELECT 
    b.Title AS "Назва книги",
    a.SecondName AS "Автор",
    g.Title AS "Жанр"
FROM Book b
LEFT JOIN Loan l ON b.Book_ID = l.Book_ID
JOIN Author a ON b.Author_ID = a.Author_ID
JOIN Genre g ON b.Genre_ID = g.Genre_ID
WHERE l.Loan_ID IS NULL;

