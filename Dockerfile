FROM node:lts-alpine3.18 as build_stage

ENV GENERATE_SOURCEMAP=false
ENV NODE_OPTIONS=--max-old-space-size=1024

WORKDIR /app

COPY package.json .

# RUN ["npm", "install"]

COPY . .

# RUN ["npm", "run", "build"]


FROM nginx:alpine3.19

COPY --from=build_stage /app/build /usr/share/nginx/html