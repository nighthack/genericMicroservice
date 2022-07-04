import os

import aioredis
from dotenv import load_dotenv

from logger import create_logger

logging = create_logger(__name__)
load_dotenv(verbose=True)


class Redis(object):
    _redis = None

    @classmethod
    async def create_redis_pool(cls):
        if not cls._redis:
            redis_url = os.getenv("REDIS_URL")
            logging.info(f"Connecting to redis at {redis_url}")
            cls._redis = await aioredis.create_redis_pool(
                redis_url, minsize=5, maxsize=10
            )
        return cls._redis


async def get_redis_pool():
    redis = await Redis.create_redis_pool()
    return redis
