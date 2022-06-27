### STAGE 1: BUILD ###
FROM python:3.9.13-slim as build-step
RUN mkdir /app
WORKDIR /app
COPY . ./app
RUN pip install -r requirements.txt

EXPOSE 7860
CMD [ "python", "app.py"]