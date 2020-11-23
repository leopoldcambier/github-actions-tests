FROM alpine:3.10

COPY code.sh /code.sh

ENTRYPOINT ["/code.sh"]


