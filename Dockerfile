### STAGE 1: BUILD ###
FROM python:3.9.13-slim as build-step
RUN useradd -ms /bin/bash python

VOLUME [ "/usr", "/home" ]

#RUN mkdir -p /home/python/app && chown -R python:python /home/python/app 
USER root

RUN mkdir /app
RUN chown python:python /app
USER python
#WORKDIR /home/python/app
WORKDIR /app

ENV PATH="/usr/local/bin:/home/python/.local/bin:${PATH}"
#ENV PATH="/usr/local/bin:${PATH}"
COPY --chown=python:python requirements.txt requirements.txt

RUN /usr/local/bin/python -m pip install --user --upgrade pip >/dev/null 2>&1

#COPY --chown=python:python requirements.txt requirements.txt
RUN pip install -r requirements.txt
#RUN chmod 777 -R /app

#COPY --chown=python:python . .
COPY  --chown=python:python . .

CMD python app.py --user

EXPOSE 7860