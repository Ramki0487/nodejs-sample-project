# ----------------> The build image

FROM node:21.2.0-bullseye-slim AS build
#RUN apt-get update && apt-get install -y --no-install-recommends dumb-init
WORKDIR /app
COPY package*.json .
RUN npm ci --only=production
COPY . .



# ----------------> The Production image

FROM gcr.io/distroless/nodejs20-debian11
ENV NODE_ENV production
#USER node
WORKDIR /usr/src/app/
#chmod +x /usr/src/app/
COPY --from=build /app .
#RUN chmod -R +x /usr/local/bin/docker-entrypoint.sh
EXPOSE 5001
CMD [ "index.js" ]

#ENTRYPOINT [ "/app" ] 