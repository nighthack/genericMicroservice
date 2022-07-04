import sys
from typing import Any

# # Installed # #
from loguru import logger

__all__ = ("logger",)

LoggerFormat = (
    "<green>{time:YY-MM-DD HH:mm:ss}</green> | "
    "<level>{level}</level> | "
    "{function}: <level>{message}</level> | "
    "{extra} {exception}"
)

# Set custom logger
logger.remove()
logger.add(sys.stderr, level="DEBUG", format=LoggerFormat, enqueue=True)
logger.add(
    "logs/file.log",
    enqueue=True,
    rotation="12:00",
    retention="10 days",
    compression="zip",
)


def create_logger(name: str) -> Any:
    return logger
