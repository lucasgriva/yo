# 1. Use an official base image (The "Kitchen")
FROM node:20-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy package files first to leverage Docker's cache
# This means if your code changes but your dependencies don't, 
# Docker skips the slow 'npm install' step.
COPY package*.json ./

# 4. Install dependencies
RUN npm install --production

# 5. Copy the rest of your application code
COPY . .

# 6. Expose the port your app runs on
EXPOSE 3000

# 7. Define the command to run your app
CMD ["node", "index.js"]
