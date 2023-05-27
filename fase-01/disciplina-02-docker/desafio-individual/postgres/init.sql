CREATE TABLE programming_languages(
    id BIGINT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name TEXT
);

INSERT INTO programming_languages ("name")
VALUES ('Java');

INSERT INTO programming_languages ("name")
VALUES ('Kotlin');

INSERT INTO programming_languages ("name")
VALUES ('C#');

INSERT INTO programming_languages ("name")
VALUES ('Rust');

INSERT INTO programming_languages ("name")
VALUES ('C++');

INSERT INTO programming_languages ("name")
VALUES ('JavaScript');

\d programming_languages;