FROM python:3.10.4-slim-buster

RUN apt update && apt upgrade -y
RUN apt-get install git curl python3-pip ffmpeg wget bash neofetch software-properties-common -y

COPY requirements.txt .
RUN pip3 install wheel
RUN pip3 install --no-cache-dir -U -r requirements.txt

WORKDIR /app
COPY . .

EXPOSE 8000

CMD gunicorn app:app --bind 0.0.0.0:8000
