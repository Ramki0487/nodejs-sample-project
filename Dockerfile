# ----------------> The build image

FROM node:21.2.0-bullseye-slim AS build

#RUN apt-get update && apt-get install -y --no-install-recommends dumb-init

WORKDIR /app

COPY package*.json .

RUN npm ci --only=production

COPY . .

USER node



# ----------------> The Production image

FROM gcr.io/distroless/nodejs20-debian11

ENV NODE_ENV production

WORKDIR /usr/src/app/

COPY --from=build /app .

EXPOSE 5001

CMD [ "index.js" ]

