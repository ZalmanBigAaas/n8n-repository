# Use a specific, existing n8n version.
FROM n8nio/n8n:1.23.0

# Switch to root to install things
USER root

# 1. Install system dependencies for sharp AND a package manager (npm)
RUN apk add --no-cache vips-dev build-base python3 npm

# 2. Create a directory for our custom modules and set permissions
RUN mkdir -p /home/node/.n8n/custom && chown -R node:node /home/node/.n8n

# 3. Switch to the non-root node user
USER node

# 4. Go into our new custom folder
WORKDIR /home/node/.n8n/custom

# 5. Install sharp here. It will be placed in the node_modules subdirectory.
RUN npm install sharp

# 6. Reset the working directory for the main n8n process to start correctly
WORKDIR /home/node
