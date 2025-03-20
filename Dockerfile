FROM python:3.10-slim

RUN apt-get update && apt-get install -y git curl ffmpeg wget bash neofetch

COPY requirements.txt .
RUN pip install --no-cache-dir -U -r requirements.txt

WORKDIR /app
COPY . .

EXPOSE 8000

CMD gunicorn app:app --bind 0.0.0.0:8000
