### STAGE 1: BUILD ###
FROM python:3.9.13-slim as build-step
RUN mkdir -p /app
WORKDIR /app
COPY requirements.txt /app
RUN pip install -r requirements.txt
COPY . .

EXPOSE 7860
CMD [ "python", "app.py"]
