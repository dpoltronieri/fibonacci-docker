FROM node:16-alpine as builder

WORKDIR '/app'

COPY ./package.json /app

# To Fix Permissions for Packages
RUN npm config set unsafe-perm true

RUN npm install --force

COPY . /app

RUN chown -R node /app

USER node

RUN npm run build

FROM nginx

EXPOSE 3000

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/build /usr/share/nginx/html