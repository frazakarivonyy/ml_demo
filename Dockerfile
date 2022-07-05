### STAGE 1: BUILD ###
FROM python:3.9.13-slim as build-step
RUN useradd -m -u 1000 python
USER python

#RUN mkdir -p /home/python/app && chown -R python:python /home/python/app 
#USER root
RUN mkdir /app
#WORKDIR /home/python/app
WORKDIR /home/python/app
#RUN chown -R python:python /app
#RUN echo PYTHONPATH

ENV PATH="/usr/local/bin:${PATH}"

COPY --chown=python requirements.txt requirements.txt
RUN pip install --user --upgrade pip \
    && pip install --user -r requirements.txt

#COPY --chown=python:python requirements.txt requirements.txt
#RUN chmod 777 -R /app

#RUN chown -R python:python /usr
COPY --chown=python . .
#COPY --chown=python:python . .

#COPY . .

EXPOSE 7860

CMD [ "python", "app.py"]
