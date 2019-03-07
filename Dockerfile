# First phase - Build Phase

FROM node:alpine as builder

WORKDIR "/app"

COPY ./package.json ./
RUN npm install
COPY ./ ./

RUN npm run build

# Second phase - Production Phase - nginx server setup to serve all the build assets

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
