FROM alpine:3.7

RUN apk add -U python py2-numpy py2-pip
RUN pip install websockify

COPY ./ /app
WORKDIR /app

ENV SPICE_SERVER localhost:5959
EXPOSE 8000

CMD websockify -v --web=/app :8000 ${SPICE_SERVER}
