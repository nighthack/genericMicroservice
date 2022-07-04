set -a
echo "Sourcing env variables"
. ./.env
set +a

# Use register_service and deregister_service if you have a compatible gateway
# python3 register_service.py
python -m uvicorn main:app --host 0.0.0.0 --port 8001 --reload
# python3 deregister_service.py
