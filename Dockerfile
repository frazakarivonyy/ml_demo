### STAGE 1: BUILD ###
FROM python:3.9.13-slim as build-step
#RUN useradd -ms /bin/bash python
#USER python

#RUN mkdir -p /home/python/app && chown -R python:python /home/python/app 
#USER root
RUN mkdir -p /app
#WORKDIR /home/python/app
WORKDIR /app
#ENV PATH="/home/python/bin:${PATH}"
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip >/dev/null 2>&1

#COPY --chown=python:python requirements.txt requirements.txt
RUN pip install -r requirements.txt

#COPY --chown=python:python . .
COPY . .

EXPOSE 7860
CMD [ "python", "app.py"]
