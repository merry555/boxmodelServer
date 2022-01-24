# Server setting
* Server IP: 3.38.169.53

## Tensorflow install
* tensorflow 설치 (server내 /home/ubuntu/tensorflow 경로 내 위치 - 원하는 버전을 선택하여 설치)
```
cd /home/ubuntu/tensorflow/{tensorflow version}/{archive or latest}/{tensorflow-version}
```

* 압축 해제 및 설치
```
sudo tar xvf {tensorflow-version}
cd {tensorflow-version}
sudo pip3 install -U *.whl
```

## Tensorflow-serving install
* serving하기위한 tensorflow-serving 설치 (server내 /home/ubuntu/tensorflow-serving 경로 내 위치 - 원하는 버전을 선택하여 설치)
```
cd /home/ubuntu/tensorflow-serving/{tensorflow version}/{archive or latest}/{tensorflow-serving-version}
```

* 압축 해제 및 실행파일 활성화
```
sudo tar xvf {tensorflow-serving-version}
cd {tensorflow-serving-version}
sudo chmod +x amazonei_tensorflow_model_server
```

## 참고
* document  
https://docs.aws.amazon.com/elastic-inference/latest/developerguide/what-is-ei.html

* S3 경로 (tensorflow 및 tensorflow-serving 파일이 있는 위치)  
https://s3.console.aws.amazon.com/s3/buckets/amazonei-tensorflow/?region=us-east-1&tab=objects

# Server start
```
./check.sh
```