DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    region_name TEXT UNIQUE
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    address TEXT NOT NULL,
    preferred_region_id INTEGER REFERENCES region
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text_content TEXT NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES region
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category_name TEXT UNIQUE 
);

CREATE TABLE posts_categories (
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES categories,
    post_id INTEGER REFERENCES posts ON DELETE CASCADE
);