import express from 'express';
import pg from 'pg';

const {
    POSTGRES_HOST = 'localhost',
    POSTGRES_PORT = 5432,
    POSTGRES_DB = 'postgres',
    POSTGRES_USER = 'postgres',
    POSTGRES_PASSWORD = 'postgres'
} = process.env;

const app = express();

const poll = new pg.Pool({
    host: POSTGRES_HOST,
    port: POSTGRES_PORT,
    database: POSTGRES_DB,
    user: POSTGRES_USER,
    password: POSTGRES_PASSWORD,
});

app.get('/v1/programming-languages', async (_, res) => {
    try {
        const { rows } = await poll.query('SELECT name FROM programming_languages');
        const result = rows.map(row => row.name);
        res.send(result);
    } catch (error) {
        console.error(error);
        res.status(500).send('Something went wrong... :(');
        throw error;
    }
});

app.listen(8080);
