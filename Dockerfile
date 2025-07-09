# Use a stable, specific version of the n8n Alpine image
FROM n8nio/n8n:1-alpine

# Switch to the root user to install system and pnpm packages
USER root

# 1. Install system dependencies required by sharp
RUN apk add --no-cache vips-dev build-base python3

# 2. Set the working directory to n8n's root folder where its package.json lives
WORKDIR /usr/local/lib/node_modules/n8n

# 3. CRITICAL: Use pnpm to install sharp. This matches n8n's package manager.
#    This command ensures sharp is compiled against the libraries we just installed
#    and placed in the correct pnpm store for the app to find.
RUN pnpm install sharp

# 4. Switch back to the default non-root user for running n8n
USER node

# 5. Reset the working directory to the default for the node user
WORKDIR /home/node
