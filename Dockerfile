# Use the Debian-based n8n image for better compatibility
FROM n8nio/n8n:1.102.0-debian

# Switch to the root user to install system dependencies
USER root

# Install the required build tools and libraries for sharp on Debian
RUN apt-get update && apt-get install -y --no-install-recommends build-essential libvips-dev

# Switch back to the non-root n8n user for security
USER node
