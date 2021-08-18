# Start of the build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# /app/build <-- where all the stuff we care about!

#Start of the run phase
FROM nginx 

# Copy something from another phase (build phase) to another folder 
COPY --from=builder /app/build /usr/share/nginx/html
