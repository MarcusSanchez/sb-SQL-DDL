-- Design a schema for Craigslist! Your schema should keep track of the following
-- - The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- - Users and preferred region
-- - Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- - Categories that each post belongs to

CREATE TABLE regions (
    id   INT PRIMARY KEY,
    city VARCHAR(255) NOT NULL
);

CREATE TABLE users (
    id        INT PRIMARY KEY,
    name      VARCHAR(255) UNIQUE NOT NULL,
    region_id INT REFERENCES regions (id)
);

CREATE TABLE posts (
    id        INT PRIMARY KEY,
    title     VARCHAR(255) NOT NULL,
    text      VARCHAR(255) NOT NULL,
    user_id   INT REFERENCES users (id),
    location  VARCHAR(255) NOT NULL,
    region_id INT REFERENCES regions (id)
);

CREATE TABLE categories (
    id   INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- junction tables --
CREATE TABLE posts_categories (
    id        INT PRIMARY KEY,
    post_id   INT REFERENCES posts (id),
    category_id INT REFERENCES categories (id)
);