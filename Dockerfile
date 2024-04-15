FROM selenium/standalone-chrome:latest
USER root

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LANG=C.UTF-8

RUN apt-get update 
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install -y python3.10-venv
RUN python3.10 -m venv /venv 
RUN bash -c "source /venv/bin/activate && pip config set global.index-url 'https://mirror.sjtu.edu.cn/pypi/web/simple' && pip install selenium"
