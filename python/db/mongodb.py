#mongodb interface
import os
import motor.motor_asyncio
from dotenv import load_dotenv
from logger import create_logger

logging = create_logger(__name__)
load_dotenv(verbose=True)

class Mongo(object):
    _mongo = None

    @classmethod
    async def create_mongo_pool(cls):
        if not cls._mongo:
            mongo_url = os.getenv("DB_HOST")
            logging.info(f"Connecting to mongo at {mongo_url}")
            cls._mongo = await motor.motor_asyncio.AsyncIOMotorClient(mongo_url)
        return cls._redis


async def get_mongo_pool():
    mongo = await Mongo.create_mongo_pool()
    return mongo
