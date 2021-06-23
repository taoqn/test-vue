FROM node:14-alpine
ARG TAG_NAME
ENV TAG_NAME=${TAG_NAME}
WORKDIR /app
COPY . .
# # install app dependencies
# RUN npm install @vue/cli -D
RUN npm install && npm audit fix
# remove build
RUN npm run build
# run
CMD [ "node", "server.js" ]
