# PYTEST  
모든 .py 파일은 테스트를 거치도록한다.

### - install  
pip install -r requirements.txt

### - run test 
pytest test_box_recommend.py -v  
pytest test_model.py  
pytest test_box_size_logic.py -v  


### - 환경설정 ( config.env )  
SERVER_URL = 박스추천서버 URL  
MODEL_SERVER_URL = 모델서버 URL  
WAREHOUSE_CODE = 'DT01'(동탄)  or 'YI00'(용인)    
EXCEL_FILE = 테스트 엑셀파일     
EXCEL_SHEET = 엑셀시트  


### - QA 와의 협업. 
box_recommend test 의 경우, EXCEL_FILE 의 컬럼이름을 기준으로 데이터를 읽는다.
QA와 대화를 통해서 데이터 변경을 반영한다. 
