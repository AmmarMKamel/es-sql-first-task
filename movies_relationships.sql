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
    act_id INT,
    mov_id INT,
    role VARCHAR(30),

    FOREIGN KEY (act_id) REFERENCES actor(act_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
GO;

CREATE TABLE movie_direction (
    id INT PRIMARY KEY,
    dir_id INT,
    mov_id INT,

    FOREIGN KEY (dir_id) REFERENCES director(dir_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
GO;

CREATE TABLE rating (
    id INT PRIMARY KEY,
    mov_id INT,
    rev_id INT,
    rev_stars INT,
    num_o_ratings INT,

    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
GO;

CREATE TABLE movie_genres (
    id INT PRIMARY KEY,
    mov_id INT,
    gen_id INT,

    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
GO;