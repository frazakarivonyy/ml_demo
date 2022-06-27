### STAGE 1: BUILD ###
FROM python:3.9.13-slim as build-step

USER root

RUN pip install --upgrade pip >/dev/null 2>&1

RUN useradd -ms /bin/bash deamon
USER deamon

WORKDIR /home/deamon

COPY --chown=deamon:deamon requirements.txt requirements.txt
RUN pip install --user -r requirements.txt

ENV PATH="/home/user/.local/bin:${PATH}"

COPY --chown=deamon:deamon . .

EXPOSE 7860
CMD [ "python", "app.py"]
