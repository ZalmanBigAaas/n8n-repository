# Use a specific, existing n8n version. This IS the Alpine image.
FROM n8nio/n8n:1.23.0

# Switch to root to install things
USER root

# 1. Install system dependencies for sharp AND a package manager (npm)
RUN apk add --no-cache vips-dev build-base python3 npm

# 2. Create a directory for our custom modules and set permissions
RUN mkdir -p /home/node/.n8n/custom/node_modules && chown -R node:node /home/node/.n8n

# 3. Set NODE_PATH env variable so n8n's Code node finds modules in our new folder
ENV NODE_PATH="/home/node/.n8n/custom/node_modules"

# 4. Switch to the non-root node user
USER node

# 5. Go into our new custom folder
WORKDIR /home/node/.n8n/custom

# 6. Install sharp here. It will be placed in the node_modules subdirectory.
#    This is guaranteed to be compiled correctly because vips-dev is already installed.
RUN npm install sharp

# 7. Reset the working directory for the main n8n process to start correctly
WORKDIR /home/node
