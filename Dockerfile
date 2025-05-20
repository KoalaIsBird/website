FROM node:24-slim AS build

WORKDIR /home/app
COPY . .

RUN npm install
RUN npm run build

FROM nginx
COPY --from=build /home/app/dist /usr/share/nginx/html