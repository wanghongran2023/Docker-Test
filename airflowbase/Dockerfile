FROM ubuntu:latest

RUN apt update && \
    apt upgrade -y && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt update && \
    apt install python3.9 python3.9-venv python3.9-dev -y
    
RUN apt install python3-pip -y && \
    python -m pip install --upgrade pip 

RUN mkdir ~/airflow && \
    cd ~/airflow && \
    python -m venv venv && \
    source venv/bin/activate && \
    export AIRFLOW_VERSION=2.7.3 && \
    export PYTHON_VERSION="$(python --version | cut -d ' ' -f2 | cut -d '.' -f1-2)" && \
    export CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt" &&\
    pip install "apache-airflow[aws]"=="${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}" && \
    export AIRFLOW_HOME=~/airflow

RUN airflow db init
RUN airflow webserver

