CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    statistics VARCHAR(255)
);

CREATE TABLE collection (
    collection_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    privacy BOOLEAN NOT NULL,
    tag TEXT,
    star_count INT,
    author_id INT REFERENCES users(user_id)
);

CREATE TABLE flashcards (
    flashcard_id SERIAL PRIMARY KEY,
    front TEXT NOT NULL,
    back TEXT NOT NULL,
    audio_file VARCHAR(255),
    vocabulary_meaning TEXT,
    image VARCHAR(255),
    status VARCHAR(50),
    collection_id INT REFERENCES collection(collection_id)
);


CREATE TABLE System_Admin (
    admin_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id)
);

CREATE TABLE chatbot (
    message_id SERIAL PRIMARY KEY,
    message_content TEXT NOT NULL,
    message_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    user_id INT REFERENCES users(user_id)
);
