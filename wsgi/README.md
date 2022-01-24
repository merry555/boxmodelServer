# 박스추천 로직서버    
wms 에서의 박스추천 요청을 받으면, 알고리즘으로 처리할 것은 여기서 처리하고,  
머신러닝 모델로 처리할 것은 모델서버에 요청한 후에 결과를 받아서 리턴한다.  
Python FastAPI 로 구현되어 있다.  
Docker Container 로 구성될 예정.

### - install  
pip install -r requirements.txt

### - run 
run_server.sh

### - run as debug
runs_server_debug.sh
