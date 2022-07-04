from fastapi import APIRouter

from logger import create_logger

router = APIRouter()
logging = create_logger(__name__)


@router.get("/")
async def endpoint_index():
    return {"success": True}
