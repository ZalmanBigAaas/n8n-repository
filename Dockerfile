# Use a specific, existing n8n version. This IS the Alpine image.
FROM n8nio/n8n:1.23.0

# Switch to the root user to install system and packages
USER root

# 1. Install system dependencies required by sharp
RUN apk add --no-cache vips-dev build-base python3

# 2. Set the working directory to n8n's root folder
WORKDIR /usr/local/lib/node_modules/n8n

# 3. CRITICAL: Use the full path to the bundled pnpm executable
#    This bypasses any PATH issues and directly calls the command.
RUN /usr/local/bin/pnpm install sharp

# 4. Switch back to the default non-root user for running n8n
USER node

# 5. Reset the working directory to the default for the node user
WORKDIR /home/node
