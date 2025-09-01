# Dockerfile

# 1. Start with the official n8n base image
FROM n8nio/n8n:latest

# 2. Switch to the root user to install software
USER root

# 3. Install Python, pip, curl, AND the ca-certificates package
RUN apk add --no-cache python3 py3-pip curl ca-certificates

# 4. Copy your files into the container
COPY ./requirements.txt /home/node/requirements.txt
COPY ./blackbird /home/node/blackbird/

# 5. Create a virtual environment and install packages into it
RUN python3 -m venv /home/node/venv && \
    /home/node/venv/bin/pip install --no-cache-dir -r /home/node/requirements.txt

# 6. Switch back to the standard 'node' user for security
USER node
