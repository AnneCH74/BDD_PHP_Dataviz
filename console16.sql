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


