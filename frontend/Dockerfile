# Use the official Node.js image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy the frontend files into the container
COPY . .

# Install dependencies and build the React app
RUN npm install
RUN npm run build

# Serve the app
EXPOSE 3000

# Start the React app
CMD ["npm", "start"]
