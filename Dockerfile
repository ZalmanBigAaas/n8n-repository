# Dockerfile

# 1. Start with the official n8n base image
FROM n8nio/n8n:latest

# 2. Switch to the root user to install software
USER root

# 3. Install Python and pip
RUN apk add --no-cache python3 py3-pip

# 4. Copy your files into the container
#    This assumes requirements.txt is in your main project folder
COPY ./requirements.txt /home/node/requirements.txt
#    This copies your python code
COPY ./blackbird /home/node/blackbird/

# 5. Install the Python libraries your script needs
RUN pip install --no-cache-dir -r /home/node/requirements.txt

# 6. Switch back to the standard 'node' user for security
USER node
