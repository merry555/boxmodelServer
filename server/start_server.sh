#!/bin/bash
nohup /home/ubuntu/tensorflow-serving/v2.3/archive/tensorflow-serving-2-3-0-ei-1-6/amazonei_tensorflow_model_server --rest_api_port=8501 \
--model_config_file=/home/ubuntu/ai_server/server/models/models.config \
--model_config_file_poll_wait_seconds=60 &