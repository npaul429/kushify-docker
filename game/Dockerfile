# Stage 1: Build the game
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Set up env and build with /play/ base path
RUN cp .env.local.backup .env.local \
    && npx vite build --base=/play/

# Stage 2: Serve with nginx
FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
