FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add --update nodejs 
RUN apk add yarn
RUN yarn add vite
WORKDIR	/root/app
COPY ./tools/	/root/app
WORKDIR /root/app/static-site
RUN yarn install
RUN yarn run build
CMD ["yarn","run","preview"]