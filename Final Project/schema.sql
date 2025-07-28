-- USERS: Stores information about users
CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    username TEXT NOT NULL UNIQUE, -- usernames must be unique
    "password" TEXT NOT NULL
);

-- AUTHORS: Represents book authors
CREATE TABLE authors(
    id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL UNIQUE
);

-- GENRES: Represents book genres e.g., Fiction, History, etc.
CREATE TABLE genres(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

-- BOOKS: Table that represents books
CREATE TABLE books(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    publication_year INTEGER,
    author_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    FOREIGN KEY author_id REFERENCES authors.id,
    FOREIGN KEY genre_id REFERENCES genres.id
);

-- REVIEWS: Users submit reviews for books
CREATE TABLE reviews(
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    rating INTEGER NOT NULL CHECK rating >= 1 AND rating <= 10, -- 1 to 10 stars
    review_text TEXT,
    "timestamp" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY user_id REFERENCES users.id,
    FOREIGN KEY book_id REFERENCES books.id,
);

-- INDEXES: Optimization for common queries

-- For faster user lookup by username
CREATE INDEX idx_users_username ON users.username;

-- For searching books quickly by title
CREATE INDEX idx_books_title ON books.title;

-- For quick retrieval of all books by an author
CREATE INDEX idx_books_author_id ON books.author_id;

-- For finding all books in a genre
CREATE INDEX idx_books_genre_id ON books.genre_id;

-- For looking up reviews by book
CREATE INDEX idx_reviews_book_id ON reviews.book_id;

-- VIEWS: Useful tool for queries

-- View to show average ratings for each book
CREATE VIEW book_average_ratings AS
SELECT books.id AS book_id, books.title, authors.full_name AS author, genres.name AS genre, AVG(reviews.rating) AS avg_rating, COUNT(reviews.id) AS total_reviews
FROM books
JOIN authors ON books.author_id = authors.id
JOIN genres ON books.genre_id = genres.id
LEFT JOIN reviews ON books.id = reviews.book_id
GROUP BY books.id;
