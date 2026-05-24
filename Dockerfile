FROM node

ENV MONGO_DB_USERNAME=admin\
    MONGO_DB_PASSWORD=QWERTY

RUN mkdir -p docker-testapp

COPY  . /docker-testapp

CMD ["node", "/docker-testapp/server.js"]