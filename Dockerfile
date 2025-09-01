# Dockerfile

# Start with the official n8n image
FROM n8nio/n8n:latest

# Switch to root to install software
USER root

# Install Python and pip
RUN apk add --no-cache python3 py3-pip

# --- Path Correction Section ---
# Copy requirements.txt from your project's ROOT folder
COPY ./requirements.txt /home/node/requirements.txt

# Copy your blackbird folder
COPY ./blackbird /home/node/blackbird/
# -----------------------------

# Install Python libraries
RUN pip install --no-cache-dir -r /home/node/requirements.txt

# Switch back to the standard user
USER node
