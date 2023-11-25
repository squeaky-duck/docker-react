# build phase
FROM node:21-alpine AS builder

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

# run phase
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html