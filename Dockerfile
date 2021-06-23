FROM node:14-alpine
WORKDIR /app
COPY . .
# # install app dependencies
# RUN npm install @vue/cli -D
RUN npm install && npm audit fix
# remove build
RUN npm run build
# run
CMD [ "node", "build" ]
