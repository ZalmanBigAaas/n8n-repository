# Use a stable, specific version of the n8n Alpine image
FROM n8nio/n8n:1-alpine

# Switch to the root user to install system and npm packages
USER root

# Install system dependencies needed for 'sharp'
RUN apk add --no-cache vips-dev build-base python3

# CRITICAL STEP: Install 'sharp' during the Docker build process.
# This ensures it is compiled correctly against the system libraries we just installed.
# We also change the directory to avoid permission issues.
WORKDIR /usr/local/lib/node_modules/n8n
RUN npm install sharp

# Change back to the default node user for running n8n
USER node

# Reset the working directory to the default for the node user
WORKDIR /home/node
