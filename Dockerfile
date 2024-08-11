# syntax=docker/dockerfile:1
FROM node 
LABEL org.opencontainers.image.source=https://github.com/papawattu/sethdebt
LABEL org.opencontainers.image.description="A simple web app to track debt"
LABEL org.opencontainers.image.licenses=MIT

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /usr/src/app/public /usr/share/nginx/html
EXPOSE 80
