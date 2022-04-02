FROM python:3.8.2

ENV GIT_SSL_NO_VERIFY=1

# apt install
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
         curl \
         git \
         unzip \
         vim \
         wget

# pip install
COPY requirements.txt /tmp/
RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt

# cd
WORKDIR /opt/

# expose port for jupyter notebook
EXPOSE 8888

# exec CMD
CMD kedro run
