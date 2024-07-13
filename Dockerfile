# Use the official Node.js 16 image as the base image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install
RUN npm run build

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Define environment variables (optional, adjust as needed)
ENV PORT=3000
ENV NODE_ENV=production

# Run database migrations (if needed)
# RUN npx prisma migrate deploy

# Start the application
CMD ["npm", "start"]
