FROM node:lts-alpine

RUN apk update \
    && apk add --no-cache curl git

RUN mkdir -p /var/www/nuxt-app
COPY . /var/www/nuxt-app

WORKDIR /var/www/nuxt-app
RUN npm install --omit=dev \
    && npm run build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD [ "npm", "start" ]

# docker builder prune -af \
#     && docker system prune -af \
#     && docker volume prune -f \
#     && docker image prune -af

# docker login
# docker build --no-cache -t 00x56/kubernetes-node:latest .
# docker push 00x56/kubernetes-node:latest
