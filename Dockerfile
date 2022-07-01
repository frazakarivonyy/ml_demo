### STAGE 1: BUILD ###
FROM python:3.9.13-slim as build-step
RUN useradd -ms /bin/bash python

VOLUME [ "/usr", "/home" ]

#RUN mkdir -p /home/python/app && chown -R python:python /home/python/app 
#USER root

RUN mkdir -p /app
RUN chown python /app
USER python
#WORKDIR /home/python/app
WORKDIR /app

ENV PATH="/home/python/.local/bin:${PATH}"
COPY --chown=python:python requirements.txt requirements.txt

RUN python -m pip install --upgrade pip >/dev/null 2>&1

#COPY --chown=python:python requirements.txt requirements.txt
RUN pip install -r requirements.txt
#RUN chmod 777 -R /app

#COPY --chown=python:python . .
COPY  --chown=python:python . .

CMD python app.py

EXPOSE 7860