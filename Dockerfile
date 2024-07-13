# Use the official Node.js 16 image as the base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /home/app

# Copy package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install dependencies
RUN yarn install

# Copy the rest of the application code to the working directory
COPY . .

RUN yarn prisma generate

RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Define environment variables (optional, adjust as needed)
ENV PORT=3000
ENV NODE_ENV=production

# Run database migrations (if needed)
# RUN npx prisma migrate deploy

# Start the application
CMD ["npm", "start"]
