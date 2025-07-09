# Use a specific, existing n8n version. As of now, 1.23.0 is a recent stable version.
# This IS the Alpine image.
FROM n8nio/n8n:latest

# Switch to the root user to install system and pnpm packages
USER root

# 1. Install system dependencies required by sharp
RUN apk add --no-cache vips-dev build-base python3

# 2. Set the working directory to n8n's root folder
WORKDIR /usr/local/lib/node_modules/n8n

# 3. Use pnpm (n8n's native package manager) to install sharp
RUN pnpm install sharp

# 4. Switch back to the default non-root user for running n8n
USER node

# 5. Reset the working directory to the default for the node user
WORKDIR /home/node
