### STAGE 1: BUILD ###
FROM python:3.9.13-slim as build-step
RUN useradd -m -u 1000 python
#USER python

#RUN mkdir -p /home/python/app && chown -R python:python /home/python/app 
#USER root
RUN mkdir /home/python/app
#WORKDIR /home/python/app
WORKDIR /home/python/app
RUN chown -R python /home/python/app
#RUN echo PYTHONPATH

ENV PATH="/home/python/.local/bin:/usr/local/bin:${PATH}"

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

#COPY --chown=python:python requirements.txt requirements.txt
#RUN chmod 777 -R /app

#RUN chown -R python:python /usr
COPY --chown=python . .
#COPY --chown=python:python . .

USER python
#COPY . .

EXPOSE 7860

CMD [ "python", "app.py"]
