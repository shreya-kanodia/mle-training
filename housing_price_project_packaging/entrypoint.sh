#!/usr/bin/env bash

conda run -n test-mle-dev python -m housing_price_shreya_kanodia.ingest_data -ad data/actual_dataset/ -pd data/processed_dataset/ --log-path logs/log.txt
conda run -n test-mle-dev python -m housing_price_shreya_kanodia.train -td data/processed_dataset/housing_train.csv -sm models/ --log-path logs/log.txt
conda run -n test-mle-dev python -m housing_price_shreya_kanodia.score -td data/processed_dataset/housing_test.csv -m models/ --log-path logs/log.txt --rmse --mae
conda run -n test-mle-dev python -m pytest /home/housing_price_shreya_kanodia-0.3/test/unit_tests