### STAGE 1: BUILD ###
FROM python:3.9.13-slim as build-step

RUN pip install --upgrade pip >/dev/null 2>&1
WORKDIR /app

COPY requirements.txt requirements.txt
RUN chown -R deamon:deamon /app
RUN pip install -r requirements.txt

COPY . .
RUN chown -R deamon:deamon /app

USER daemon
EXPOSE 7860
CMD [ "python", "app.py"]
