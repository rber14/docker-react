# this is our docker file for prod

# as builder is a tag - for our 'build phase'
# this is our builder step for our muilt step docker build
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . . 

#run build - builds a production version of the application
RUN npm run build


# this is start of 2nd phase

FROM nginx
#copy over from builder (only what we need) and specify what folder and to which folder in nginx
COPY --from=builder /app/build /usr/share/nginx/html





