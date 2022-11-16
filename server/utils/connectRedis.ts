import { createClient } from 'redis';

// TODO get port and host from env
const redisUrl = `redis://localhost:6380`;
const redisClient = createClient({
    url: redisUrl,
});

const connectRedis = async () => {
    try {
        await redisClient.connect();
        console.log('? Redis client connected...');
        redisClient.set(
            'tRPC',
            '??Welcome to tRPC with React.js, Express and Typescript!'
        );
    } catch (err: any) {
        console.log(err.message);
        process.exit(1);
    }
};

connectRedis();

redisClient.on('error', (err) => console.log(err));

export default redisClient;
