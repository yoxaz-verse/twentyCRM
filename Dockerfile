FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache libc6-compat python3 make g++

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build

EXPOSE 3000

CMD ["yarn", "start:prod"]
