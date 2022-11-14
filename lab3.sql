CREATE DATABASE IF NOT EXISTS spotify;
USE spotify;

SET FOREIGN_KEY_CHECKS=0 ;
DROP TABLE IF EXISTS play_now;
DROP TABLE IF EXISTS playlist; 
DROP TABLE IF EXISTS albom;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS lable;
DROP TABLE IF EXISTS song;
DROP TABLE IF EXISTS singer;
DROP TABLE IF EXISTS song_singer;
DROP TABLE IF EXISTS playlist_song;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE albom (
    name varchar(50) NOT NULL,
    singer_name varchar(30) NOT NULL,
    date_release date NOT NULL,
    CONSTRAINT albom_pk PRIMARY KEY (name)
);

-- Table: country
CREATE TABLE country (
    name varchar(30) NOT NULL,
    CONSTRAINT country_pk PRIMARY KEY (name)
);

-- Table: genre
CREATE TABLE genre (
    name varchar(20) NOT NULL,
    CONSTRAINT genre_pk PRIMARY KEY (name)
);

-- Table: lable
CREATE TABLE lable (
    name varchar(30) NOT NULL,
    CONSTRAINT lable_pk PRIMARY KEY (name)
);

-- Table: play_now
CREATE TABLE play_now (
    song_id int NOT NULL,
    CONSTRAINT play_now_pk PRIMARY KEY (song_id)
);

-- Table: playlist
CREATE TABLE playlist (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    CONSTRAINT playlist_pk PRIMARY KEY (id)
);

-- Table: playlist_song
CREATE TABLE playlist_song (
    playlist_id int NOT NULL,
    song_id int NOT NULL,
    CONSTRAINT playlist_song_pk PRIMARY KEY (playlist_id,song_id)
);

-- Table: singer
CREATE TABLE singer (
    name varchar(30) NOT NULL,
    lable_name varchar(30) NULL,
    country_name varchar(30) NULL,
    subscribers int NOT NULL,
    CONSTRAINT singer_pk PRIMARY KEY (name)
);

-- Table: song
CREATE TABLE song (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(80) NOT NULL,
    albom_name varchar(50) NULL,
    text varchar(2000) NULL,
    genre_name varchar(20) NOT NULL,
    CONSTRAINT song_pk PRIMARY KEY (id)
);

-- Table: song_singer
CREATE TABLE song_singer (
    song_id int NOT NULL,
    singer_name varchar(30) NOT NULL,
    CONSTRAINT song_singer_pk PRIMARY KEY (song_id,singer_name)
);

-- foreign keys
-- Reference: albom_singer (table: albom)
ALTER TABLE albom ADD CONSTRAINT albom_singer FOREIGN KEY albom_singer (singer_name)
    REFERENCES singer (name);

-- Reference: play_now_song (table: play_now)
ALTER TABLE play_now ADD CONSTRAINT play_now_song FOREIGN KEY play_now_song (song_id)
    REFERENCES song (id);

-- Reference: playlist_song_playlist (table: playlist_song)
ALTER TABLE playlist_song ADD CONSTRAINT playlist_song_playlist FOREIGN KEY playlist_song_playlist (playlist_id)
    REFERENCES playlist (id);

-- Reference: playlist_song_song (table: playlist_song)
ALTER TABLE playlist_song ADD CONSTRAINT playlist_song_song FOREIGN KEY playlist_song_song (song_id)
    REFERENCES song (id);

-- Reference: singer_country (table: singer)
ALTER TABLE singer ADD CONSTRAINT singer_country FOREIGN KEY singer_country (country_name)
    REFERENCES country (name);

-- Reference: singer_lable (table: singer)
ALTER TABLE singer ADD CONSTRAINT singer_lable FOREIGN KEY singer_lable (lable_name)
    REFERENCES lable (name);

-- Reference: song_albom (table: song)
ALTER TABLE song ADD CONSTRAINT song_albom FOREIGN KEY song_albom (albom_name)
    REFERENCES albom (name);

-- Reference: song_genre (table: song)
ALTER TABLE song ADD CONSTRAINT song_genre FOREIGN KEY song_genre (genre_name)
    REFERENCES genre (name);

-- Reference: song_singer_singer (table: song_singer)
ALTER TABLE song_singer ADD CONSTRAINT song_singer_singer FOREIGN KEY song_singer_singer (singer_name)
    REFERENCES singer (name);

-- Reference: song_singer_song (table: song_singer)
ALTER TABLE song_singer ADD CONSTRAINT song_singer_song FOREIGN KEY song_singer_song (song_id)
    REFERENCES song (id);

INSERT INTO lable VALUES
('Lable1'),
('Lable2'),
('Lable3'),
('Lable4'),
('Lable5'),
('Lable6'),
('Lable7'),
('Lable8'),
('Lable9'),
('Lable10');

INSERT INTO country VALUES 
('Ukraine'),
('Poland'),
('UK'),
('USA'),
('Denmark'),
('Canada'),
('Spain'),
('France'),
('Italy'),
('Monaco');

INSERT INTO genre VALUES 
('rap'),
('classic'),
('rock'),
('pop'),
('hip hop'),
('jazz'),
('punk'),
('metal'),
('country'),
('electronic');

INSERT INTO singer (name,lable_name,country_name,subscribers)VALUES 
('Drake','Lable2','USA',7593040),
('Lil pump' , 'Lable6', 'USA', 645653),
('Kalush', 'Lable5', 'Ukraine',308500),
('MBY','Lable1','Poland',94540),
('unik',null,'UK',364892),
('ENLEO',null,null,693430),
('Burla','Lable10','Canada',94304),
('Arcane','Lable8','Denmark',504541),
('$not', 'Lable1', null, 567890),
('BILLY','Lable9','Monaco',298723);

INSERT INTO albom (name,singer_name,date_release)VALUES
('Albom1','ENLEO','2020-04-07'),
('Albom2','Arcane','2018-12-09'),
('Albom3','unik','2021-05-08'),
('Albom4','ENLEO','2022-06-09'),
('Albom5','MBY','2010-10-10'),
('Albom6','Drake','2020-02-02'),
('Albom7','MBY','2015-08-03'),
('Albom8','Kalush','2016-05-30'),
('Albom9','Burla','2021-04-02'),
('Albom10','Kalush','2022-01-01');

INSERT INTO song(name,albom_name,text,genre_name)VALUES
('song1','Albom4',null,'rap'),
('song2',null,'sfdgdfgjgidhriodj','classic'), 
('song3','Albom8','fdjfjsjghvfhvjhgydsjkv','pop'), 
('song4','Albom6',null,'punk'), 
('song5',null,null,'jazz'), 
('song6','Albom7',null,'rock'), 
('song7',null,'xcdfghjuytrdsxcvbnm','pop'), 
('song8','Albom7',null,'hip hop'), 
('song9','Albom10',null,'electronic'), 
('song10',null,null,'country');

INSERT INTO song_singer VALUES
(1,'ENLEO'),
(2,'Burla'),
(3,'Kalush'),
(4,'Drake'),
(4,'Lil pump'),
(5,'Lil pump'),
(6,'MBY'),
(7,'BILLY'),
(8,'MBY'),
(9,'Kalush'),
(9,'ENLEO'),
(10,'unik');

INSERT INTO playlist(name) VALUES
('playlist1'),
('playlist2'),
('playlist3'),
('playlist4'),
('playlist5'),
('playlist6'),
('playlist7'),
('playlist8'),
('playlist9'),
('playlist10');

INSERT INTO playlist_song VALUES
(1,1),(2,4),(1,3),(4,5),
(3,6),(8,7),(3,1),(4,7),
(3,7),(9,3),(5,6),(2,6);

INSERT INTO play_now VALUES
(1);

CREATE INDEX lable_name_index ON singer(lable_name);
CREATE INDEX country_name_index ON singer(country_name);
CREATE INDEX name_index ON singer(name);
CREATE INDEX name_index ON albom(name);
CREATE INDEX name_index ON song(name);
CREATE INDEX genre_name_index ON song(genre_name);