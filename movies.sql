CREATE DATABASE Movies;
GO;

USE Movies;
GO;

CREATE TABLE movie (
    mov_id INT PRIMARY KEY,
    mov_title VARCHAR(50),
    mov_year INT,
    mov_time INT,
    mov_lang VARCHAR(50),
    mov_dt_rel DATE,
    mov_rel_country VARCHAR(5)
);
GO;

CREATE TABLE actor (
    act_id INT PRIMARY KEY,
    act_fname VARCHAR(20),
    act_lname VARCHAR(20),
    act_gender CHAR(1)
);
GO;

CREATE TABLE director (
    dir_id INT PRIMARY KEY,
    dir_fname VARCHAR(20),
    dir_lname VARCHAR(20)
);
GO;

CREATE TABLE reviewer (
    rev_id INT PRIMARY KEY,
    rev_name VARCHAR(30)
);
GO;

CREATE TABLE genres (
    gen_id INT PRIMARY KEY,
    gen_title VARCHAR(20)
);
GO;

CREATE TABLE movie_cast (
    id INT PRIMARY KEY,
    act_id INT REFERENCES actor(act_id),
    mov_id INT REFERENCES movie(mov_id),
    role VARCHAR(30)
);
GO;

CREATE TABLE movie_direction (
    id INT PRIMARY KEY,
    dir_id INT REFERENCES director(dir_id),
    mov_id INT REFERENCES movie(mov_id)
);
GO;

CREATE TABLE rating (
    id INT PRIMARY KEY,
    mov_id INT REFERENCES movie(mov_id),
    rev_id INT REFERENCES reviewer(rev_id),
    rev_stars INT,
    num_o_ratings INT
);
GO;

CREATE TABLE movie_genres (
    id INT PRIMARY KEY,
    mov_id INT REFERENCES movie(mov_id),
    gen_id INT REFERENCES genres(gen_id)
);
GO;