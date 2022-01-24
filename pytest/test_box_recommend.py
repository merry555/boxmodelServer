import requests
import json
import pandas as pd
from pydantic import BaseSettings
import pytest


class Settings(BaseSettings):
    SERVER_URL: str
    WAREHOUSE_CODE: str
    EXCEL_FILE: str
    EXCEL_SHEET: str

    class Config:
        env_file = 'config.env'


settings = Settings()

# 엑셀 데이터 읽기.
df = pd.read_excel(settings.EXCEL_FILE, sheet_name=settings.EXCEL_SHEET)


def send_requests(w, h, d, count, godCd, orderNo, expect):
    params = {'whCd': settings.WAREHOUSE_CODE,
              'packQty': [count],
              'outOrdSlipNo': orderNo,
              'godCd': [godCd],
              'godWidth': [w],
              'godLength': [h],
              'godHeight': [d],
              'bufGodYn': ['N']}
    response = requests.get(settings.SERVER_URL, params)
    result = json.loads(response.content)
    try:
        result_code = result["data"][0]['boxNm']
        return result_code
    except:
        return '추천박스 없음'


@pytest.mark.parametrize("idx, row", df.iterrows() )
def test_requests(idx, row):
    w = float(row['가로'])
    h = float(row['세로'])
    d = float(row['높이'])
    count = int(row['수량'])
    godCd = row['상품코드']
    expected = row['예상 박스']
    result_code = send_requests(w, h, d, count, godCd, idx, expected)
    row['추천된 박스'] = result_code
    df.loc[idx, '추천된 박스'] = result_code
    assert result_code == expected, "추천박스 다름 {} : {} != {}".format(godCd, expected, result_code)


# 위의 다음순서.. ;;
def test_save():
    df.to_excel('output.xlsx', sheet_name='테스트 박스체적')
    print("saved to ouput.xlsx")
