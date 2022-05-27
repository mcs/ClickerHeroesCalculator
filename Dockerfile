FROM node:10-alpine AS build

WORKDIR /app
COPY . .

RUN npm install
RUN npm run-script build

FROM httpd:2.4

COPY --from=build /app/dist/ /usr/local/apache2/htdocs/
