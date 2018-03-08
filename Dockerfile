FROM alpine:3.7

RUN apk add -U python py2-numpy py2-pip
RUN pip install websockify

COPY ./ /app
WORKDIR /app

ENV HTTP_PORT 8001
ENV SPICE_SERVER localhost:5959

CMD websockify -v --web=/app :${HTTP_PORT} ${SPICE_SERVER}
