# 1. Use the Node.js base image (LTS version recommended)
FROM node:18-alpine

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy the package.json and package-lock.json/yarn.lock
COPY package*.json ./

# 4. Install dependencies (choose npm or yarn, depending on your project)
RUN npm install

# 5. Copy the rest of the project files to the working directory
COPY . .

# 6. Build the Strapi app for production
RUN npm run build

# 7. Expose the port that Strapi uses (default is 1337)
EXPOSE 1337

# 8. Set environment variables (optional)
ENV NODE_ENV=development

# 9. Start the Strapi server
# CMD ["npm", "run", "start"]
CMD ["npm", "run", "develop"]

