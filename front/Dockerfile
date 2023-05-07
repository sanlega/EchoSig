# Use the official Node.js image as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and pnpm-lock.yaml into the container
COPY package.json pnpm-lock.yaml ./

# Install the project dependencies
RUN npm install

# Copy the remaining files into the container
COPY . .

# Build the project
RUN npm run build

# Expose the port the app will run on
EXPOSE 4242

# Start the server
CMD ["npm", "start"]

