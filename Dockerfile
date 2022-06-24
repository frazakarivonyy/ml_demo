### STAGE 1: BUILD ###
FROM python:3.9.13-slim as build-step
RUN mkdir -p /app
WORKDIR /app
COPY requirements.txt ./
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN pip3 install -r requirements.txt
COPY . ./

EXPOSE 7860
CMD [ "python3", "app.py"]