# Use Heroku's official Python runtime as a base image
FROM heroku/python

# Update package lists and install required dependencies
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    ffmpeg aria2

# Copy the contents of the current directory into the container at /app
COPY . /app/

# Set the working directory to /app
WORKDIR /app/

# Install Python dependencies using pip
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir --upgrade setuptools \
    && pip install --no-cache-dir --upgrade wheel \
    && pip install --no-cache-dir --upgrade -r requirements.txt

# Specify the command to run on container startup
CMD ["python", "modules/main.py"]
