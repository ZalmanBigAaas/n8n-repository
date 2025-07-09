# Use the correct, modern n8n version.
FROM n8nio/n8n:1.101.1

# Switch to root to install our package manager
USER root

# 1. We only need npm, no other system dependencies are required for jimp
RUN apk add --no-cache npm

# 2. Create a directory for our custom modules and set permissions
RUN mkdir -p /home/node/.n8n/custom && chown -R node:node /home/node/.n8n

# 3. Switch to the non-root node user
USER node

# 4. Go into our new custom folder
WORKDIR /home/node/.n8n/custom

# 5. Install jimp
RUN npm install jimp

# 6. Reset the working directory for the main n8n process to start correctly
WORKDIR /home/node
