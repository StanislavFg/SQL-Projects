-- Add a new user to the system
INSERT INTO users username, pasword
VALUES 'booklover99', 'ILoveBooks123!';

-- Find all books with "Harry Potter" in the title
SELECT books.id, books.title, authors.full_name, genres.name
FROM books
JOIN authors ON books.author_id = authors.id
JOIN genres ON books.genre_id = genres.id
WHERE books.title LIKE '%Harry Potter%';

-- Show all reviews for book with a name "Harry Potter"
SELECT users.username, reviews.rating, reviews.review_text, reviews.timestamp
FROM reviews
JOIN users ON reviews.user_id = users.id
JOIN books ON reviews.book_id = books.id
WHERE books.title LIKE '%Harry Potter%'
ORDER BY reviews.timestamp DESC;

-- User with ID 5 reviews book ID 3 with a 4-star rating
INSERT INTO reviews user_id, book_id, rating, review_text
VALUES 5, 3, 4, 'Exciting plot with a few slow moments.';

-- Show books with high average ratings
SELECT books.title, authors.full_name, AVGreviews.rating AS avg_rating
FROM reviews
JOIN books ON reviews.book_id = books.id
JOIN authors ON books.author_id = authors.id
GROUP BY reviews.book_id
HAVING avg_rating >= 4.5
ORDER BY avg_rating DESC;

-- Get all books in the "Science Fiction" genre
SELECT books.title, authors.full_name
FROM books
JOIN authors ON books.author_id = authors.id
JOIN genres ON books.genre_id = genres.id
WHERE genres.name = 'Science Fiction';

-- See all reviews submitted by user with username 'reader23'
SELECT books.title, reviews.rating, reviews.review_text, reviews.timestamp
FROM reviews
JOIN users ON reviews.user_id = users.id
JOIN books ON reviews.book_id = books.id
WHERE users.username = 'reader23'
ORDER BY reviews.timestamp DESC;

-- Update a user's review text and rating
UPDATE reviews
SET rating = 5, review_text = 'I re-read this and it’s even better the second time!'
WHERE user_id = 5 AND book_id = 3;

-- Remove a specific review
DELETE FROM reviews
WHERE user_id = 5 AND book_id = 3;
