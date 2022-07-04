from fastapi import FastAPI
from starlette.exceptions import HTTPException as StarletteHTTPException
from starlette.responses import JSONResponse

from api.v1.app import router as app_v1
from db.redis import get_redis_pool
from db.mongo import get_mongo_pool
from logger import create_logger

app = FastAPI(docs_url="/api/v1/docs", openapi_url="/api/v1/auth/openapi.json")
app.include_router(app_v1, prefix="/api/v1")

logging = create_logger(__name__)


@app.on_event("startup")
async def startup_event():
    logging.info("start up event")
    await get_mongo_pool()
#    await get_redis_pool()


@app.on_event("shutdown")
async def shutdown_event():
    logging.info("shutdown event")
    pool = await get_mongo_pool()
    pool.close
    await pool.wait_closed()
#    rpool = await get_redis_pool()
#    rpool.close()
#    await pool.wait_closed()


@app.exception_handler(StarletteHTTPException)
async def http_exception_handler(request, exc):
    return JSONResponse({"Error": str(exc.detail)}, status_code=exc.status_code)
