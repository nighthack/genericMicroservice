import os

import requests
from dotenv import load_dotenv
from loguru import logger as logging
from tenacity import after_log, before_log, retry, stop_after_attempt, wait_fixed

from main import app

max_tries = 60 * 5  # 5 minutes
wait_seconds = 1
load_dotenv(verbose=True)


@retry(
    stop=stop_after_attempt(max_tries),
    wait=wait_fixed(wait_seconds),
    before=before_log(logging, 20),
    after=after_log(logging, 30),
)
def deregister() -> None:
    try:
        logging.info("trying to register")
        open_api = app.openapi()
        open_api["info"]["service_name"] = os.getenv("SERVICE_NAME")
        url = f"{os.getenv('BASE_AMLGATEWAY_URL')}/deregister"
        r = requests.post(
            url,
            json={"base_url": os.getenv("BASE_SERVICE_URL"), "openapi_specs": open_api},
        )
        result = r.json()
        if not result.get("success"):
            raise Exception
        logging.info(f"Result: {result}")
    except Exception as e:
        logging.error(e)
        raise e


if __name__ == "__main__":
    logging.info("Initializing de-registering")
    deregister()
    logging.info("Service deregistering finished")
