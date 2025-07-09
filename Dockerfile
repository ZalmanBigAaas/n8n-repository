# Start from the official n8n image (which is Debian-based)
FROM n8nio/n8n:latest

# Switch to the root user to install system packages
USER root

# Update package lists and install the vips library and build tools
# This is the key command for enabling sharp
RUN apt-get update && apt-get install -y libvips-dev build-essential gcc g++ make && rm -rf /var/lib/apt/lists/*

# Switch back to the default non-root 'node' user for security
USER node
