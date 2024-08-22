FROM node:lts-alpine3.18 as build_stage

WORKDIR /app

COPY package.json .

RUN ["npm", "install"]

COPY . .

RUN ["npm", "run", "build"]


FROM nginx:alpine3.19

COPY --from=build_stage /app/build /usr/share/nginx/html