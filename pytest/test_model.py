import requests
import json
from pydantic import BaseSettings
import pytest


class Settings(BaseSettings):
    MODEL_SERVER_URL: str
    WAREHOUSE_CODE: str
    EXCEL_FILE: str
    EXCEL_SHEET: str

    class Config:
        env_file = 'config.env'


settings = Settings()


def test_model_server_version_1():
    data = {"signature_name": "serving_default",
            "instances": [
                 {"b64": "CqYDCg4KAjE1EggSBgoEAACAQAoNCgEwEggSBgoEAAAwQQoOCgIxNBIIEgYKBAAAgEEKDQoBMhIIEgYKBGZmokEKDgoCMTgSCBIGCgQAAFBBCg0KATkSCBIGCgQAABhBCg4KAjIxEggSBgoEAAAgQQoOCgIxMRIIEgYKBM3MzD0KDgoCMTMSCBIGCgQAAEBACg4KAjI0EggSBgoEAABwQQoOCgIxNhIIEgYKBAAAQEAKDQoBNxIIEgYKBAAAGEEKDQoBMxIIEgYKBAAAMEEKDgoCMjYSCBIGCgTNzMw9Cg4KAjIyEggSBgoEAABQQQoOCgIxMBIIEgYKBAAAqEEKDgoCMjMSCBIGCgQAAJBBCg4KAjI1EggSBgoEAAAgQQoNCgE4EggSBgoEAACEQQoNCgE2EggSBgoEAAAYQQoOCgIyMBIIEgYKBAAAEEEKDgoCMTkSCBIGCgQAAJhBCg0KATUSCBIGCgRmZqJBCg4KAjE3EggSBgoEAACAQQoNCgExEggSBgoEAAAwQQoNCgE0EggSBgoEAAAwQQoOCgIxMhIIEgYKBAAAgEA="}
            ]
            }
    json_data = json.dumps(data)

    server_url = settings.MODEL_SERVER_URL % 1
    response = requests.post(server_url, data=json_data, timeout=5)
    result = json.loads(response.content)
    assert response.status_code == 200



def test_model_server_version_2():
    data = {"instances": [[ 11., 11. , 20.3, 11. , 11. , 20.3,  9.5,  9.5, 16.5,  9.5, 21.,\
                            0.1,  4. ,  3. , 16. ,  4. ,  3. , 16. , 13. , 19. ,  9. , 10.,\
                            13. , 18. , 15. , 10. ,  0.1]] }
    json_data = json.dumps(data)

    server_url = settings.MODEL_SERVER_URL % 2
    response = requests.post(server_url, data=json_data, timeout=5)
    result = json.loads(response.content)
    print(result)
    assert response.status_code == 200
    assert result['predictions'][0] == "6A"
