# Start from the official n8n image. 
# Using the explicit '-alpine' tag is safer and more reliable.
FROM n8nio/n8n:latest-alpine

# Switch to the root user to install system packages
USER root

# Install the system dependencies required by sharp on Alpine Linux
# This uses 'apk', the correct package manager for Alpine.
RUN apk add --no-cache vips-dev build-base python3

# Switch back to the default non-root 'node' user for security
USER node
