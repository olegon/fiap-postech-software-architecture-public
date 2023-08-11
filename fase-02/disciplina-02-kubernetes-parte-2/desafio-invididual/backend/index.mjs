import express from 'express';
import cors from 'cors'
import redis from 'redis';

const { REDIS_URL = 'redis://localhost:6379', APP_PORT = '3000' } = process.env;
const appPortAsInt = parseInt(APP_PORT, 10);

const redisClient = redis.createClient({
    url: REDIS_URL
});
await redisClient.connect();

const app = express();
app.use(cors());

app.get('/v1/ready', (req, res) => {
    res.status(200).end();
});

app.get('/v1/health', (req, res) => {
    res.status(200).end();
});

app.get('/v1/count', async (req, res) => {
    const value = await redisClient.incr('my-counter');
    
    res.json({
        value
    });
});

app.listen(appPortAsInt, () => {
    console.info('App listening on port %d.', appPortAsInt);
});
