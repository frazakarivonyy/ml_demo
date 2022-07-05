### STAGE 1: BUILD ###
FROM python:3.9.13-slim as build-step
RUN useradd -m -u 1000 python
USER python

RUN mkdir /home/python/app

WORKDIR /home/python/app

ENV PATH="/home/python/.local/bin:/usr/local/bin:${PATH}"

COPY --chown=python requirements.txt requirements.txt

RUN pip install --user --upgrade pip \
    && pip install --user -r requirements.txt
    
COPY --chown=python . .
EXPOSE 7860

CMD [ "python", "app.py"]
