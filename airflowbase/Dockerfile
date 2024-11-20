FROM ubuntu:latest

# Update system and install prerequisites
RUN apt update && \
    apt upgrade -y && \
    apt install -y software-properties-common wget build-essential && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt update && \
    apt install python3.9 python3.9-venv python3.9-dev -y

# Install pip using get-pip.py
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3.9 get-pip.py && \
    rm get-pip.py

# Upgrade pip after installation
RUN python3.9 -m pip install --upgrade pip

# Set up Airflow
RUN mkdir ~/airflow && \
    cd ~/airflow && \
    python3.9 -m venv venv && \
    source venv/bin/activate && \
    export AIRFLOW_VERSION=2.7.3 && \
    export PYTHON_VERSION="$(python --version | cut -d ' ' -f2 | cut -d '.' -f1-2)" && \
    export CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt" && \
    pip install "apache-airflow[aws]"=="${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}" && \
    export AIRFLOW_HOME=~/airflow

