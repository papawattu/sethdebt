# syntax=docker/dockerfile:1
FROM node 

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /usr/src/app/public /usr/share/nginx/html
EXPOSE 80
