FROM node:18.20.4-alpine3.20 as build_stage

ENV NODE_OPTIONS=--max-old-space-size=1024

WORKDIR /app

COPY package.json .

RUN ["npm", "install"]

COPY . .

RUN ["npm", "run", "build"]


FROM nginx:alpine3.20

COPY --from=build_stage /app/build /usr/share/nginx/html