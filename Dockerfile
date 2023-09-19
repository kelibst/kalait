FROM node:18-alpine AS base

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

RUN yarn prisma generate

RUN yarn build

EXPOSE 3000

CMD ["yarn", "dev"]