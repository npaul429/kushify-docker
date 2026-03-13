# Stage 1: Build the pitch deck
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install --legacy-peer-deps && npm install react@18.3.1 react-dom@18.3.1

COPY . .

# Add figma:asset alias and build
RUN sed -i "s|'@': path.resolve(__dirname, './src'),|'@': path.resolve(__dirname, './src'), 'figma:asset': path.resolve(__dirname, './src/assets'),|" vite.config.ts \
    && npm run build

# Stage 2: Serve with nginx
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
