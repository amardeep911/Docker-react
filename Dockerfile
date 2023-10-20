FROM node:alpine as builder

WORKDIR '/app'

# Copy package.json first to avoid unnecessary npm installs
COPY package.json .

# Install dependencies
RUN npm install

# Copy everything else
COPY . .

# Build the app
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

