FROM ubuntu:latest

# Update package lists and install required dependencies
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the contents of the current directory into the container at /app
COPY . /app/

# Set the working directory to /app
WORKDIR /app/

# Install Python dependencies using pip
RUN pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir --upgrade setuptools \
    && pip3 install --no-cache-dir --upgrade wheel \
    && pip3 install --no-cache-dir --upgrade --requirement Installer

# Specify the command to run on container startup
CMD ["python3", "modules/main.py"]
