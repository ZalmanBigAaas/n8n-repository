# Start from the official n8n image. The standard 'latest' tag IS based on Alpine.
FROM n8nio/n8n:latest

# Switch to the root user to install system packages
USER root

# Install the system dependencies required by sharp on Alpine Linux
# This uses 'apk', which is correct for the 'latest' image.
RUN apk add --no-cache vips-dev build-base python3

# Switch back to the default non-root 'node' user for security
USER node
