#multistep build process

FROM node:alpine as builder
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#default command automatically start nginx so dont need to specify it

