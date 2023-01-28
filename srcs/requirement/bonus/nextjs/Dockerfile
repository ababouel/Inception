FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add --update nodejs 
RUN apk add npm
WORKDIR	/root/app
COPY ./tools/	/root/app
WORKDIR /root/app/nextjs
RUN npm i -g next
CMD ["npm","run","dev"]
