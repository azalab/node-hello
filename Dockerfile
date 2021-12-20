### 1st stage
### build stage
FROM node:14.16.1-alpine3.13

WORKDIR /app

COPY ./src/. ./

RUN yarn install


### 2nd stage
### final stage for pushing
FROM node:14.16.1-alpine3.13

WORKDIR /jsapp
COPY --from=0 /app/ ./ 

EXPOSE 3000
CMD yarn run start
