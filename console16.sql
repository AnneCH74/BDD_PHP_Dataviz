-- SQLite

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS users_users;
DROP TABLE IF EXISTS tweets;
DROP TABLE IF EXISTS tweets_users;
DROP TABLE IF EXISTS hashtags;
DROP TABLE IF EXISTS hashtags_tweets;



CREATE TABLE users (
                       id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                       username VARCHAR (150),
                       email VARCHAR(150),
                       address VARCHAR (250),
                       postal_code INTEGER,
                       city TEXT,
                       country TEXT
);

CREATE TABLE users_users (
                             user1_id INTEGER NOT NULL,
                             user2_id INTEGER NOT NULL,
                             PRIMARY KEY (user1_id,user2_id),
                             FOREIGN KEY (user1_id) REFERENCES users (id) ON DELETE CASCADE,
                             FOREIGN KEY (user2_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE tweets (
                        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                        content VARCHAR(250),
                        createdAt DATETIME,
                        user_id INTEGER NOT NULL,
                        FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE tweets_users(
                             user_id INTEGER,
                             tweet_id INTEGER,
                             created_at DATETIME,
                             PRIMARY KEY (user_id,tweet_id),
                             FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
                             FOREIGN KEY (tweet_id) REFERENCES tweets (id) ON DELETE CASCADE
);


CREATE TABLE hashtags (
    name VARCHAR(150)
);

CREATE TABLE hashtags_tweets(
                                hashtag_name VARCHAR,
                                tweet_id INTEGER,
                                PRIMARY KEY (hashtag_name,tweet_id),
                                FOREIGN KEY (hashtag_name) REFERENCES hashtags (name) ON DELETE CASCADE,
                                FOREIGN KEY (tweet_id) REFERENCES tweets (id) ON DELETE CASCADE
);

INSERT INTO users(username, email, address, postal_code, city, country)
VALUES
    ('Babar','babar@sql.fr','1 rue de SQL',74000, 'ANNECY','FRANCE'),
    ('Dumbo','dumbo@sql.fr','2 rue de SQL',74000, 'ANNECY','FRANCE'),
    ('Peter Pan','peterpan@sql.fr','3 rue de SQL',74000, 'ANNECY','FRANCE');

--SELECT * FROM users;

INSERT INTO tweets (content, createdAt, user_id)
VALUES
    ('tweet numero 1 Babar', '06-12-2022 06:30:59', 1),
    ('tweet numero 2 Babar', '26-01-2023 15:15:30', 1),
    ('tweet numero 3 Babar', '06-06-2023 11:50:20', 1),
    ('tweet numero 1 Dumbo', '06-12-2022 06:30:59', 2),
    ('tweet numero 2 Dumbo', '26-01-2023 15:15:30', 2),
    ('tweet numero 3 Dumbo', '06-06-2023 11:50:20', 2),
    ('tweet numero 1 Peter Pan', '06-12-2022 06:30:59', 3),
    ('tweet numero 2 Peter Pan', '26-01-2023 15:15:30', 3),
    ('tweet numero 3 Peter Pan', '06-06-2023 11:50:20', 3);

--SELECT * FROM tweets;

INSERT INTO tweets_users (user_id, tweet_id, created_at)
VALUES
    (1,4,'31-12-2022 23:59:50'),
    (2,8,'31-05-2023 20:10:10'),
    (3,1,'07-06-2023 03:15:05');

SELECT * FROM tweets_users;


