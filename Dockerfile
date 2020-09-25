# this is our docker file for prod

# as builder is a tag - for our 'build phase'
# this is our builder step for our muilt step docker build
FROM node:alpine 

WORKDIR '/app'

COPY package*.json ./

RUN npm install

COPY . . 

# run build - builds a production version of the application
RUN npm run build


# this is start of 2nd phase

FROM nginx
# For developers to use and read
# futher, elastic beanstalk sees this and maps the port for incomming traffic
EXPOSE 80
# copy over from builder (only what we need) and specify what folder and to which folder in nginx
# COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html





