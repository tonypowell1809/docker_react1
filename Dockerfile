FROM node:alpine 
WORKDIR /app
COPY package.json . 
RUN npm install 
COPY . . 
RUN npm run build 

# /app/build use for build data 


# run phase below using nginx

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
