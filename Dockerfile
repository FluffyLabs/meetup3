FROM oven/bun:1-alpine

WORKDIR /app

COPY server.ts .
RUN mkdir -p data

EXPOSE 3000

CMD ["bun", "run", "server.ts"]
