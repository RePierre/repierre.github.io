FROM debian:stable-slim

LABEL maintainer="petru.rebeja@gmail.com"

RUN apt update && apt upgrade -y && \
    apt install -y python3 python3-pip && \
    pip3 install -U pip setuptools wheel nikola[extra]

WORKDIR /nikola
EXPOSE 8000
