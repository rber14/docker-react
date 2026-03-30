
FROM node:18-alpine as builder


WORKDIR /app


COPY package.json package-lock.json* yarn.lock* ./

RUN npm install

COPY . .

EXPOSE 3000


RUN npm run build


FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html