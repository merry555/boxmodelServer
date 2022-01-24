from typing import List, Set, Dict
from fastapi import FastAPI, status
from fastapi.responses import JSONResponse
from pydantic import BaseModel, BaseSettings
import json
from httpx import AsyncClient  # for async requests

# 입력 데이터 scheme
class InputGoodsData(BaseModel):
    whCd: str
    #packQty: List[int]
    outOrdSlipNo: int
    '''
    godCd: List[int]
    godWidth: List[int]
    godLength: List[int]
    godHeight: List[int]
    bufGodYn: List[str]
    '''


class Settings(BaseSettings):
    CENTER_LIST: List[str]
    BUF_GOD_YN: List[str]
    BOX_MODEL_SERVER_ADDRESS: str
    BOX_MODEL_RECOMMEND_URL: str
    BOX_MODEL_RECOMMEND_VERSION: int

    # box info . read from box_config.json
    BOX_SIZE: Dict = {}
    BOX_NAME: Dict = {}
    BOX_TYPE: Dict = {}

    class Config:
        env_file = 'config.env'

    def read_json(self):
        with open('box_config.json') as json_file:
            json_data = json.load(json_file)
            self.BOX_SIZE = json_data['box_list']
            self.BOX_NAME = json_data['box_name']
            self.BOX_TYPE = json_data['box_symbol']


# read Settings & start app
settings = Settings()
settings.read_json()
app = FastAPI()


@app.get("/boxRecommend/v1/recommendBox/boxReco/")
async def box_recommend_get(inputGoodsData: InputGoodsData):
    return await box_recommend(inputGoodsData)



@app.post("/boxRecommend/v1/recommendBox/boxReco/")
async def box_recommend_post(inputGoodsData: InputGoodsData):
    return await box_recommend(inputGoodsData)


async def box_recommend(inputGoodsData: InputGoodsData):
    status_code, response = check_input_data(inputGoodsData)

    # Box input data 체크 결과, 데이터가 이상하다.
    if status_code != status.HTTP_200_OK:
        return JSONResponse(status_code=status_code, content=response)

    # TODO : count 비교해서, 5 <  < 10

    if inputGoodsData.whCd == 'YI00':
        result = await request_model()
        if result != None:
            print(result)
    else:
        pass

    # predict.
    boxName = '5A'
    boxNo = settings.BOX_NAME[boxName] if boxName in settings.BOX_NAME.keys() else 'size over'
    boxTp = settings.BOX_TYPE[boxName] if boxName in settings.BOX_TYPE.keys() else 'N/A'

    # server_url = settings.BOX_MODEL_SERVER_URL % settings.BOX_MODEL_SERVER_VERSION

    return {"outOrdSlipNo": inputGoodsData.outOrdSlipNo,
            'boxNm': boxName,
            'boxNo': boxNo,
            'boxTp': boxTp}


def check_input_data(inputGoodsData: InputGoodsData):
    # 센터 리스트 체크
    if inputGoodsData.whCd not in settings.CENTER_LIST:
        return status.HTTP_400_BAD_REQUEST, {"HTTP_status": "400(BAD_REQUEST)",
                         "Error_code": "008",
                         "message": "center name must be included in {}".format(', '.join(settings.CENTER_LIST)),
                         "data": inputGoodsData.whCd}
    # 데이터 길이 체크 등등..
    return status.HTTP_200_OK, {}


async def request_model():
    # 데이터는 바뀔예정.
    data = {"signature_name": "serving_default",
            "instances": [
                {
                    "b64": "CqYDCg4KAjE1EggSBgoEAACAQAoNCgEwEggSBgoEAAAwQQoOCgIxNBIIEgYKBAAAgEEKDQoBMhIIEgYKBGZmokEKDgoCMTgSCBIGCgQAAFBBCg0KATkSCBIGCgQAABhBCg4KAjIxEggSBgoEAAAgQQoOCgIxMRIIEgYKBM3MzD0KDgoCMTMSCBIGCgQAAEBACg4KAjI0EggSBgoEAABwQQoOCgIxNhIIEgYKBAAAQEAKDQoBNxIIEgYKBAAAGEEKDQoBMxIIEgYKBAAAMEEKDgoCMjYSCBIGCgTNzMw9Cg4KAjIyEggSBgoEAABQQQoOCgIxMBIIEgYKBAAAqEEKDgoCMjMSCBIGCgQAAJBBCg4KAjI1EggSBgoEAAAgQQoNCgE4EggSBgoEAACEQQoNCgE2EggSBgoEAAAYQQoOCgIyMBIIEgYKBAAAEEEKDgoCMTkSCBIGCgQAAJhBCg0KATUSCBIGCgRmZqJBCg4KAjE3EggSBgoEAACAQQoNCgExEggSBgoEAAAwQQoNCgE0EggSBgoEAAAwQQoOCgIxMhIIEgYKBAAAgEA="}
            ]
            }
    json_data = json.dumps(data)

    async with AsyncClient(base_url=settings.BOX_MODEL_SERVER_ADDRESS) as ac:
        server_url = settings.BOX_MODEL_RECOMMEND_URL % settings.BOX_MODEL_RECOMMEND_VERSION
        response = await ac.post(url=server_url, data=json_data)
        if response.status_code == 200:
            result = json.loads(response.content)
            # TODO: 결과 parsing.
            return result['predictions'][0]['classes'][0]
        else:
            return None