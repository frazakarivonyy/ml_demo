### STAGE 1: BUILD ###
FROM python:3.9.13-slim as build-step

RUN pip install --upgrade pip >/dev/null 2>&1
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

EXPOSE 7860
CMD [ "python", "app.py"]
