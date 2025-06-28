FROM rust:1.88 AS builder

WORKDIR /app
COPY . .
RUN cargo fetch
RUN cargo build --release

FROM nginx:1.29-alpine AS deploy

RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
